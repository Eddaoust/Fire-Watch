<?php
/**
 * Created by PhpStorm.
 * User: edmonddaoust
 * Date: 07/10/2018
 * Time: 12:43
 */

namespace App\Service;


use App\Entity\Category;
use Doctrine\ORM\EntityManager;

class TwigGlobalCategory
{
    public function getCategories(EntityManager $entityManager)
    {
        $categoriesRepo = $entityManager->getRepository(Category::class);
        $categories = $categoriesRepo->findAll();

        return $categories;
    }
}