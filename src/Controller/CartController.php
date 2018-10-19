<?php

namespace App\Controller;

use App\Entity\Product;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Session\Session;
use Cart\Cart;
use Cart\Storage\SessionStore;
use Cart\CartItem;

class CartController extends AbstractController
{
    /**
     * @Route("/cart", name="cart")
     */
    public function index()
    {
        $session = new Session();
        $session->get('cart');

        return $this->render('cart/cart.html.twig');
    }

    /**
     * @Route("/cart/add/{id}/{cat}", name="cart_add")
     */
    public function addProduct($id, $cat)
    {
        $session = new Session();
        $product = $this->getDoctrine()
            ->getRepository(Product::class)
            ->find($id);
        if (!$session->get('cart'))
        {
            $id = 'cart-01';
            $cartSessionStore = new SessionStore();
            $session->set('cart', new Cart($id, $cartSessionStore));
        }
        $item = new CartItem();
        $item->name = $product->getName();
        $item->price = $product->getPrice();

        $session->get('cart')->add($item);
        return $this->redirectToRoute('product_list', [
            'cat' => $cat
        ]);
    }

    /**
     * @Route("/cart/delete/{id}", name="cart_delete")
     */
    public function deleteItem(SessionInterface $session, $id)
    {
        $cart = $session->get('cart')->toArray()['items'];
        foreach ($cart as $item)
        {
            if  ($item['id'] == $id)
            {
                if ($item['data']['quantity'] == 1)
                {
                    $session->get('cart')->remove($id);
                }
                else
                {
                    $session->get('cart')->update($id, 'quantity', $item['data']['quantity']-=1 );
                }
            }
        }
        return $this->redirectToRoute('cart');

    }

    /**
     * @Route("/cart/clear", name="cart_clear")
     */
    public function clearCart()
    {
        $session = new Session();
        $session->remove('cart');

        return $this->redirectToRoute('cart');
    }
}
