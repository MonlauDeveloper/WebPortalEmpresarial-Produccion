@if ($errors->has($field))
    <div class="text-red-500 text-sm mt-1">
        @foreach ($errors->get($field) as $error)
            @if(is_array($error))
                <span>{{ implode(', ', $error) }}</span>
            @else
                <span>{{ $error }}</span>
            @endif
        @endforeach
    </div>
@endif
