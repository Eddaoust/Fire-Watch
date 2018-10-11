<?php

namespace App\Controller;

use App\Entity\Product;
use App\Entity\User;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class ProductAdminController extends AbstractController
{
    /**
     * @Route("/admin", name="product_admin_home")
     */
    public function homeAdmin()
    {
        $repo = $this->getDoctrine()
            ->getRepository(Product::class);
        $products = $repo->findAll();

        $repo = $this->getDoctrine()
            ->getRepository(User::class);
        $users = $repo->findAll();

        return $this->render('product_admin/home_admin.html.twig', [
            'products' => $products,
            'users' => $users
        ]);
    }
}
