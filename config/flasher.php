<?php

return [
    'default' => 'flasher',

    'root_script' => [
        'cdn' => 'https://cdn.jsdelivr.net/npm/@flasher/flasher@1.3.1/dist/flasher.min.js',
        'local' => '/vendor/flasher/flasher.min.js',
    ],

    'styles' => [
        'cdn' => 'https://cdn.jsdelivr.net/npm/@flasher/flasher@1.3.1/dist/flasher.min.css',
        'local' => '/vendor/flasher/flasher.min.css',
    ],

    'use_cdn' => true,
    'auto_translate' => true,
    'auto_render' => false,

    'flash_bag' => [
        'enabled' => true,
        'mapping' => [
            'success' => ['success'],
            'error' => ['error', 'danger'],
            'warning' => ['warning', 'alarm'],
            'info' => ['info', 'notice', 'alert'],
        ],
    ],

    'filter_criteria' => [
        'limit' => 5,
    ],
];