<?php
/**
 * Created by PhpStorm.
 * User: edmonddaoust
 * Date: 07/10/2018
 * Time: 12:43
 */

namespace App\Service;


use App\Entity\Category;
use Doctrine\ORM\EntityManagerInterface;

class TwigGlobalCategory
{
    /**
     * Service permettant d'accéder aux catégories de montre globalement
     */
    private $categories;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $categoriesRepo = $entityManager->getRepository(Category::class);
        $categories = $categoriesRepo->findAll();

        $this->setCategories($categories);
    }

    /**
     * @return mixed
     */
    public function getCategories()
    {
        return $this->categories;
    }

    /**
     * @param mixed $categories
     */
    public function setCategories($categories): void
    {
        $this->categories = $categories;
    }

}