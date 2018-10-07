<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Product;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    /**
     * @Route("/", name="product_home")
     */
    public function index()
    {
        $repo = $this->getDoctrine()
            ->getRepository(Category::class);
        $category = $repo->findAll();

        foreach ($category as $index => $key)
        {
            $this->get('twig')->addGlobal('category'.$index, $key); // Création des variables globales
        }

        return $this->render('product/home.html.twig', [
            'categories' => $category
        ]);
    }

    /**
     * @Route("/list/{cat}", name="product_list")
     */
    public function list($cat)
    {
        $repo = $this->getDoctrine()
            ->getRepository(Product::class);
        $product = $repo->findBy(
            ['category' => $cat]
        );

        return $this->render('product/list.html.twig', [
            'products' => $product
        ]);
    }

}
