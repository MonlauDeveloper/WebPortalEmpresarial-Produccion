<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Role;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class AdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Find the 'Administrador' role
        $adminRole = Role::where('name', 'Administrador')->first();

        // If the role doesn't exist, we might need to create it or handle the error.
        // Assuming it exists for now based on the login logic.
        if (!$adminRole) {
            $this->command->error("Role 'Administrador' not found.");
            return;
        }

        try {
            // Create or update the admin user
            User::updateOrCreate(
                ['email' => 'mancar@monlau.com'],
                [
                    'name' => 'Admin User',
                    'password' => '$Alba2024!',
                    'role_id' => $adminRole->id,
                    'status' => 'active',
                ]
            );
            $this->command->info("Admin user 'mancar@monlau.com' created successfully with role '{$adminRole->name}'.");
        } catch (\Exception $e) {
            $this->command->error("Error creating user: " . $e->getMessage());
        }
    }
}
