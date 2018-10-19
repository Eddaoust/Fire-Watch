<?php

namespace App\Controller;

use App\Entity\Product;
use App\Entity\User;
use App\Form\ProductType;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
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

    /**
     * @Route("/admin/products", name="product_admin")
     */
    public function listProducts()
    {
        $repo = $this->getDoctrine()
            ->getRepository(Product::class);
        $products = $repo->findAll();

        return $this->render('product_admin/listProducts.html.twig', [
            'products' => $products
        ]);
    }

    /**
     * @Route("/admin/update/{id}", name="product_update")
     */
    public function updateProduct(Request $request, ObjectManager $manager, $id)
    {
        $repo = $this->getDoctrine()
            ->getRepository(Product::class);
        $product = $repo->find($id);

        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid())
        {
            $manager->persist($product);
            $manager->flush();
            $this->addFlash('success', 'Your product is updated');
            return $this->redirectToRoute('product_admin');
        }

        return $this->render('product_admin/updateProduct.html.twig',[
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("Admin/add", name="product_add")
     */
    public function addProduct(Request $request, ObjectManager $manager)
    {
        $product = new Product();

        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid())
        {
            $manager->persist($product);
            $manager->flush();
            $this->addFlash('success', 'Product added');
            return $this->redirectToRoute('product_admin');
        }

        return $this->render('product_admin/addProduct.html.twig', [
            'form' => $form->createView()
        ]);
    }


    /**
     * @Route("/admin/delete/{id}", name="product_delete")
     */
    public function deleteProduct(ObjectManager $manager, $id)
    {
        $repo = $this->getDoctrine()
            ->getRepository(Product::class);
        $product = $repo->find($id);

        $manager->remove($product);
        $manager->flush();
        $this->addFlash('success', 'Product deleted');
        return $this->redirectToRoute('product_admin');
    }

    /**
     * @Route("/admin/published/{id}", name="product_published")
     */
    public function published(ObjectManager $manager, $id)
    {
        $repo = $this->getDoctrine()
            ->getRepository(Product::class);
        $product = $repo->find($id);

        $product->getPublished() ? $product->setPublished(0) : $product->setPublished(1);
        $manager->persist($product);
        $manager->flush();

        return $this->redirectToRoute('product_admin');
    }
}
