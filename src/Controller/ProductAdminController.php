<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class ProductAdminController extends AbstractController
{
    /**
     * @Route("/admin", name="product_admin_home")
     */
    public function homeAdmin()
    {
        return $this->render('product_admin/home_admin.html.twig');
    }
}
