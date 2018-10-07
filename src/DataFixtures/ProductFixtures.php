<?php

namespace App\DataFixtures;

use App\Entity\Product;
use App\Entity\Category;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Common\Persistence\ObjectManager;
use Faker;

class ProductFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        $faker = Faker\Factory::create('en_EN');
        // $product = new Product();
        // $manager->persist($product);
        for ($i = 0; $i <= 2; $i++)
        {
            $genre = ['Men', 'Women', 'Kid'];

            $category = new Category();
            $category->setName($genre[$i].'\'s Watches');
            $category->setImg('home_'.$genre[$i].'.png');
            $category->setDescription($faker->sentence(8, false));
            $manager->persist($category);

            for ($j = 1; $j <= 15; $j++)
            {
                $product = new Product();
                $product->setName($faker->company);
                $product->setPrice($faker->randomFloat(2, 25, 1000));
                $product->setImg(random_int(1, 19).'.png');
                $product->setPromo($faker->numberBetween(5, 50));
                $product->setPublished(true);
                $product->setCategory($category);
                $manager->persist($product);
            }
        }

        $manager->flush();
    }
}
