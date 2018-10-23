<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Product;
use App\Form\ProductType;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;

class ProductController extends AbstractController
{
    /**
     * @Route("/api", name="product_api", methods={"GET"})
     */
    public function testApi()
    {
        $repo = $this->getDoctrine()
            ->getRepository(Category::class);
        $cat = $repo->findAll();

        $encoders = [new JsonEncoder()];
        $normalizers = [
            (new ObjectNormalizer())
            ->setIgnoredAttributes(['category'])
        ];
        $serializer = new Serializer($normalizers, $encoders);

        $data = $serializer->serialize($cat, 'json');
        return new JsonResponse($data, 200, [], true);
    }
    /**
     * @Route("/", name="product_home")
     */
    public function index()
    {
        return $this->render('product/home.html.twig');
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

    /**
     * @Route("/product/{id}", name="product_one")
     */
    public function oneProduct($id)
    {
        $repo = $this->getDoctrine()
            ->getRepository(Product::class);
        $product = $repo->find($id);

        return $this->render('product/oneProduct.html.twig', [
            'product' => $product
        ]);
    }

    /**
     * @Route("/terms", name="product_terms")
     */
    public function termsOfUse()
    {
        return $this->render('product/termsOfUse.html.twig');
    }
}