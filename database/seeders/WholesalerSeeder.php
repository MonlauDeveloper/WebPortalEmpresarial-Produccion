<?php

namespace Database\Seeders;

use App\Models\Wholesaler;
use Illuminate\Database\Seeder;

class WholesalerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $wholesalers = [
            [
                'center_id' => 2,
                'name' => 'TecnoOfficina',
                'cif' => 'B12345678',
                'social_denomination' => 'TecnoOfficina S.L.',
                'transport' => 10.5,
                'location' => 'Calle Tecnología, 15',
                'city' => 'Madrid',
                'icon' => 'tecnoofficina.png',
                'disccount' => 5,
                'payment_days' => 30,
                'country' => 'España',
                'tax' => 1,
            ],
            [
                'center_id' => 2,
                'name' => 'MobiliarioPlus',
                'cif' => 'B87654321',
                'social_denomination' => 'MobiliarioPlus S.A.',
                'transport' => 25.0,
                'location' => 'Avenida del Mueble, 42',
                'city' => 'Barcelona',
                'icon' => 'mobiliarioplus.png',
                'disccount' => 10,
                'payment_days' => 45,
                'country' => 'España',
                'tax' => 0,
            ],
            [
                'center_id' => 2,
                'name' => 'PapelExpress',
                'cif' => 'B55443322',
                'social_denomination' => 'PapelExpress S.L.',
                'transport' => 5.0,
                'location' => 'Plaza de la Papelería, 3',
                'city' => 'Valencia',
                'icon' => 'papelexpress.png',
                'disccount' => 3,
                'payment_days' => 15,
                'country' => 'España',
                'tax' => 1,
            ],
            [
                'center_id' => 2,
                'name' => 'SegurOfficina',
                'cif' => 'B11223344',
                'social_denomination' => 'SegurOfficina S.L.',
                'transport' => 15.0,
                'location' => 'Calle Seguridad, 112',
                'city' => 'Sevilla',
                'icon' => 'segurofficina.png',
                'disccount' => 2,
                'payment_days' => 30,
                'country' => 'España',
                'tax' => 0,
            ],
            [
                'center_id' => 2,
                'name' => 'ElectroHogar',
                'cif' => 'B99887766',
                'social_denomination' => 'ElectroHogar S.A.',
                'transport' => 12.5,
                'location' => 'Avenida de los Electrodomésticos, 24',
                'city' => 'Zaragoza',
                'icon' => 'electrohogar.png',
                'disccount' => 7,
                'payment_days' => 30,
                'country' => 'España',
                'tax' => 1,
            ]
        ];

        foreach ($wholesalers as $wholesaler) {
            Wholesaler::create($wholesaler);
        }
    }
}