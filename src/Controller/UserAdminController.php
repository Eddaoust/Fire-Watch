<?php

namespace App\Controller;

use App\Entity\User;
use App\Form\UserUpdateType;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class UserAdminController extends AbstractController
{
    /**
     * @Route("/admin/users", name="user_admin")
     */
    public function listUsers()
    {
        $repo = $this->getDoctrine()
            ->getRepository(User::class);
        $users = $repo->findAll();

        return $this->render('user_admin/listUser.html.twig', [
            'users' => $users
        ]);
    }

    /**
     * @Route("/admin/update-user/{id}", name="user_update")
     */
    public function updateUser(Request $request, ObjectManager $manager, $id)
    {
        $repo = $this->getDoctrine()
            ->getRepository(User::class);
        $user = $repo->find($id);

        $form = $this->createForm(UserUpdateType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid())
        {
            $manager->persist($user);
            $manager->flush();
            $this->addFlash('success', 'User\'s data updated');
            return $this->redirectToRoute('user_admin');
        }

        return $this->render('user_admin/updateUser.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/admin/delete-user/{id}", name="user_delete")
     */
    public function deleteUser(ObjectManager $manager, $id)
    {
        $repo = $this->getDoctrine()
            ->getRepository(User::class);
        $user = $repo->find($id);

        $manager->remove($user);
        $manager->flush();
        $this->addFlash('success', 'User deleted');
        return $this->redirectToRoute('user_admin');
    }
}
