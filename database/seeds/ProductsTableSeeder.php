<?php

use Illuminate\Database\Seeder;
use App\Models\Product;
class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i=1; $i <= 30; $i++) {
            Product::create([
                'name' => 'Laptop '.$i,
                'slug' => 'laptop-'.$i,
                'details' => [13,14,15][array_rand([13,14,15])] . ' inch, ' . [1, 2, 3][array_rand([1, 2, 3])] .' TB SSD, 32GB RAM',
                'price' => rand(149999, 249999),
                'description' =>'Lorem '. $i . ' ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!',
            ])->categories()->attach(1);
        }

        $product = Product::find(1);
        $product->categories()->attach(2);


        for ($i=1; $i <= 9; $i++) {
            Product::create([
                'name' => 'Desktop '.$i,
                'slug' => 'desktop-'.$i,
                'details' => [13,14,15][array_rand([13,14,15])] . ' inch, ' . [1, 2, 3][array_rand([1, 2, 3])] .' TB SSD, 32GB RAM',
                'price' => rand(149999, 249999),
                'description' =>'Lorem '. $i . ' ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!',
            ])->categories()->attach(2);
        }

        for ($i = 1; $i <= 9; $i++) {
            Product::create([
                'name' => 'Phone ' . $i,
                'slug' => 'phone-' . $i,
                'details' => [16, 32, 64][array_rand([16, 32, 64])] . 'GB, 5.' . [7, 8, 9][array_rand([7, 8, 9])] . ' inch screen, 4GHz Quad Core',
                'price' => rand(79999, 149999),
                'description' => 'Lorem ' . $i . ' ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!',
            ])->categories()->attach(3);
        }

        for ($i = 1; $i <= 9; $i++) {
            Product::create([
                'name' => 'Tablet ' . $i,
                'slug' => 'tablet-' . $i,
                'details' => [16, 32, 64][array_rand([16, 32, 64])] . 'GB, 5.' . [10, 11, 12][array_rand([10, 11, 12])] . ' inch screen, 4GHz Quad Core',
                'price' => rand(49999, 149999),
                'description' => 'Lorem ' . $i . ' ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!',
            ])->categories()->attach(4);
        }

        for ($i = 1; $i <= 9; $i++) {
            Product::create([
                'name' => 'TV ' . $i,
                'slug' => 'tv-' . $i,
                'details' => [46, 50, 60][array_rand([7, 8, 9])] . ' inch screen, Smart TV, 4K',
                'price' => rand(79999, 149999),
                'description' => 'Lorem ' . $i . ' ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!',
            ])->categories()->attach(5);
        }

        for ($i = 1; $i <= 9; $i++) {
            Product::create([
                'name' => 'Camera ' . $i,
                'slug' => 'camera-' . $i,
                'details' => 'Full Frame DSLR, with 18-55mm kit lens.',
                'price' => rand(79999, 249999),
                'description' => 'Lorem ' . $i . ' ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!',
            ])->categories()->attach(6);
        }

        for ($i = 1; $i <= 9; $i++) {
            Product::create([
                'name' => 'Appliance ' . $i,
                'slug' => 'appliance-' . $i,
                'details' => 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Perferendis, dolorum!',
                'price' => rand(79999, 149999),
                'description' => 'Lorem ' . $i . ' ipsum dolor sit amet, consectetur adipisicing elit. Ipsum temporibus iusto ipsa, asperiores voluptas unde aspernatur praesentium in? Aliquam, dolore!',
            ])->categories()->attach(7);
        }
    }
}
