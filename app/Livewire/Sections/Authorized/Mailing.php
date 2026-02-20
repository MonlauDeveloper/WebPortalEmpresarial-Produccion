<?php

namespace App\Livewire\Sections\Authorized;

use App\Models\MailAttachment;
use App\Models\Mail;
use App\Models\MailsUser;
use App\Models\User;
use Livewire\Component;
use Illuminate\Support\Facades\Auth;
use Livewire\WithPagination;
use Livewire\WithFileUploads;
use Livewire\Attributes\Validate;
use App\Models\Company;

class Mailing extends Component
{
    use WithPagination, WithFileUploads;
    protected $paginationTheme = 'tailwind';

    public $selectedEmail, $modalSelectedEmail = null;
    public $newEmail = false;
    #[Validate(['attachments.*' => 'file|max:10240|mimes:jpg,jpeg,png,pdf,doc,docx,xls,xlsx,ppt,pptx,txt,zip|nullable'], onUpdate: false)]
    public $attachments = [];

    // Error messages to be presented to the user in the frontend.
    protected $messages = [
        // submitEmail() messages
        'recipients.required' => 'Los destinatarios son obligatorios',
        'recipients.string' => 'Los destinatarios se deben especificar con texto',
        'subject.required' => 'El asunto del correo es obligatorio',
        'subject.max' => 'El asunto tiene un máximo de 255 caracteres',
        'body.required' => 'El cuerpo del correo es obligatorio',
        'body.string' => 'En el cuerpo del mensaje solo puede haber texto'
    ];

    // submitEmail() validation rules
    public $recipients, $recipientsOnCopy, $subject, $body, $submitEmailMessages = '';
    #[Validate([
        'recipients' => 'required|string',
        'recipientsOnCopy' => 'nullable|string',
        'subject' => 'required|max:255',
        'body' => 'required|string'
    ], onUpdate: false)]

    public function submitEmail()
    {
        $this->validate();
        $this->submitEmailMessages = '';
        $recipientsEmails = array_map('trim', explode(',', $this->recipients));
        $recipientsEmailsOnCopy = array_map('trim', explode(',', $this->recipientsOnCopy));

        // Validate all recipients exists;
        $notFoundUsersCompanies = [];
        $notFoundUsersCompaniesOnCopy = [];
        $usersCompanies = [];
        $usersCompaniesOnCopy = [];
        foreach ($recipientsEmails as $recipient) {
            $company = Company::where('name', $recipient)->first();
            $user = User::where('email', $recipient)->first();

            if (!$user && !$company) {
                $notFoundUsersCompanies[] = $recipient;
            } else {
                if ($user) {
                    $usersCompanies[] = $user;
                } else {
                    $usersCompanies[] = $company;
                }
            }
        }

        if ($recipientsEmailsOnCopy) {
            foreach ($recipientsEmailsOnCopy as $recipient) {
                $company = Company::where('name', $recipient)->first();
                $user = User::where('email', $recipient)->first();

                if (!$user && !$company) {
                    $notFoundUsersCompaniesOnCopy[] = $recipient;
                } else {
                    if ($user) {
                        $usersCompaniesOnCopy[] = $user;
                    } else {
                        $usersCompaniesOnCopy[] = $company;
                    }
                }
            }
        }

        if ($notFoundUsersCompanies) {
            $this->addError('recipients', 'No exite ninguna empresa o usuario con esta dirección de correo: ' . implode(',', $notFoundUsersCompanies));
            /*   $this->submitEmailMessages = ['success' => false, 'message' => 'No exite ninguna empresa o usuario con esta dirección de correo: ' . implode(',', $notFoundUsersCompanies)]; */
            return;
        }

        $email = Mail::create([
            'subject' => $this->subject,
            'body' => $this->body,
            'sender_id' => Auth::id(),
        ]);

        // Send emails
        foreach ($usersCompanies as $recipient) {
            if ($recipient instanceof Company) {
                foreach ($recipient->employees as $employee) {
                    MailsUser::create([
                        'message_id' => $email->id,
                        'recipient_id' => $employee->user_id,
                        'onCopy' => false
                    ]);
                }
            } elseif ($recipient instanceof User) {
                MailsUser::create([
                    'message_id' => $email->id,
                    'recipient_id' => $recipient->id,
                    'onCopy' => false
                ]);
            }
        }

        foreach ($usersCompaniesOnCopy as $recipient) {
            if ($recipient instanceof Company) {
                foreach ($recipient->employees as $employee) {
                    MailsUser::create([
                        'message_id' => $email->id,
                        'recipient_id' => $employee->user_id,
                        'onCopy' => true
                    ]);
                }
            } elseif ($recipient instanceof User) {
                MailsUser::create([
                    'message_id' => $email->id,
                    'recipient_id' => $recipient->id,
                    'onCopy' => true
                ]);
            }
        }

        if ($this->attachments) {
            foreach ($this->attachments as $file) {
                $path = $file->store('attachments', 'public');

                MailAttachment::create([
                    'mail_id' => $email->id,
                    'file_name' => $file->getClientOriginalName(),
                    'file_path' => $path,
                ]);
            }
        }

        $this->submitEmailMessages = ['success' => true, 'message' => 'Correo enviado exitosamente'];
        $this->reset(['subject', 'body', 'newEmail', 'attachments']);

        /* foreach ($recipientsEmails as $recipient) {
            $company = Company::where('name', $recipient)->first();
            $user = User::where('email', $recipient)->first();

            if ($company) {
                foreach ($company->employees as $employee) {
                    MailsUser::create([
                        'message_id' => $email->id,
                        'recipient_id' => $employee->user_id,
                    ]);
                }
            } elseif ($user) {
                MailsUser::create([
                    'message_id' => $email->id,
                    'recipient_id' => $user->id,
                ]);
            } else {
                $this->submitEmailMessages = ['success' => false, 'message' => 'No exite ningúna empresa o usuario con esta dirección de correo: ' . $recipient];
                return;
            }
        } */
    }

    /**************************************************************

        Methods to help viewing sended, recibed and deleted emails

     **************************************************************/

    // Sended emails methods
    public $showSendedEmails;
    public function toggleSendedEmails()
    {
        $this->_resetToggles();
        $this->showSendedEmails = true;
    }

    // Recibed emails methods
    public $showRecibedEmails = true;
    public function toggleRecibedEmails()
    {
        $this->_resetToggles();
        $this->showRecibedEmails = true;
    }

    // Deleted emails methods
    public $showDeletedEmails;
    public function toggleDeletedEmails()
    {
        $this->_resetToggles();
        $this->showDeletedEmails = true;
    }

    public function closeModal()
    {
        $this->selectedEmail = false;
        $this->modalSelectedEmail = false;
    }

    private function _markMailAsRead(Mail $mail)
    {
        $mailUser = MailsUser::withTrashed()
            ->where('message_id', $mail->id)
            ->where('recipient_id', Auth::id())
            ->whereNull('readt_at')
            ->first();

        if ($mailUser) {
            $mailUser->readt_at = now();
            $mailUser->save();
        }
    }

    public function selectEmail($emailId)
    {
        $this->newEmail = false;
        if ($this->modalSelectedEmail) {
            $this->closeModal();
            return;
        }

        $this->selectedEmail = Mail::find($emailId);
        $this->_markMailAsRead($this->selectedEmail);
    }

    public function modalSelectEmail($emailId)
    {
        $this->modalSelectedEmail = Mail::find($emailId);

        if ($this->modalSelectedEmail) {
            $this->_markMailAsRead($this->modalSelectedEmail);
        }
    }

    public function markAsUnread($emailId)
    {
        $this->selectedEmail = Mail::find($emailId);

        if ($this->selectedEmail) {
            $mailUser = MailsUser::withTrashed()->where('message_id', $this->selectedEmail->id)
                ->where('recipient_id', Auth::id())
                ->first();

            if ($mailUser) {
                $mailUser->readt_at = null;
                $mailUser->save();
            }
        }
    }

    public function toggleNewEmail()
    {
        if ($this->newEmail) {
            $this->reset(['newEmail', 'subject', 'body', 'recipients', 'attachments']);
            return;
        }

        $this->newEmail = true;
        $this->selectedEmail = null;
        $this->reset(['subject', 'body', 'recipients', 'attachments']);
    }

    public function deleteEmail(Mail $email)
    {
        $this->newEmail = false;
        $this->selectedEmail = null;

        $mailUser = MailsUser::where('message_id', $email->id)
            ->where('recipient_id', Auth::id())
            ->first();

        if ($mailUser) {
            $mailUser->delete();
        }
    }

    public $showForceDeleteModal, $emailToDelete;
    public function openForceDeleteEmailModal(Mail $email)
    {
        $this->showForceDeleteModal = true;
        $this->emailToDelete = $email->id;
    }

    public function forceDeleteEmail()
    {
        $this->newEmail = false;
        $this->selectedEmail = null;

        $mailUser = MailsUser::withTrashed()
            ->where('message_id', $this->emailToDelete)
            ->where('recipient_id', Auth::id())
            ->first();

        if ($mailUser) {
            $mailUser->forceDelete();
        }

        $this->reset(['showForceDeleteModal', 'emailToDelete']);
    }

    public function restoreEmail(Mail $email)
    {
        $mailUser = MailsUser::withTrashed()
            ->where('message_id', $email->id)
            ->where('recipient_id', Auth::id())
            ->first();

        if ($mailUser && $mailUser->trashed()) {
            $mailUser->restore();
        }
    }

    // Helper functions:
    private function _resetToggles()
    {
        $this->newEmail = false;
        $this->showSendedEmails = false;
        $this->modalSelectedEmail = false;
        $this->showDeletedEmails = false;
        $this->showRecibedEmails = false;
    }

    public function render()
    {
        $query = Mail::query();

        if ($this->showSendedEmails) {
            $query->where('sender_id', Auth::id());
        }

        if ($this->showDeletedEmails) {
            $query->whereHas('recipients', function ($query) {
                $query->onlyTrashed()
                    ->where('recipient_id', Auth::id());
            });
        }

        if ($this->showRecibedEmails) {
            $query->whereHas('recipients', function ($query) {
                $query->where('recipient_id', Auth::id())
                    ->where('deleted_at', null);
            });
        }

        $emails = $query->latest()->paginate(9);
        return view('livewire.sections.authorized.mailing', compact('emails'));
    }
}
