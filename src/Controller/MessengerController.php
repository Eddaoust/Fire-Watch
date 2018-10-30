<?php

namespace App\Controller;

use App\Entity\Messenger;
use App\Entity\User;
use Doctrine\Common\Persistence\ObjectManager;
use PhpParser\JsonDecoder;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\Session;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;

class MessengerController extends AbstractController
{
    /**
     * @Route("/messenger", name="messenger")
     */
    public function index()
    {
        return $this->render('messenger/messenger.html.twig');
    }

    /**
     * @Route("/messenger/add", name="messenger_add")
     */
    public function add(Request $request, ObjectManager $manager, Session $session)
    {
        $user = $this->getDoctrine()
            ->getRepository(User::class)
            ->find($session->get('userId'));

        $messenger = new Messenger();
        $messenger->setUser($user);
        $messenger->setMessage($request->request->get('message'));
        $messenger->setUsername($session->get('userName'));
        $messenger->setDate(new \DateTime('now'));

        $manager->persist($messenger);
        $manager->flush();

        return $this->redirectToRoute('messenger');
    }

    /**
     * @Route("/messenger/ajax", name="messenger_ajax")
     */
    public function ajaxMessage()
    {
        $messages = $this->getDoctrine()
            ->getRepository(Messenger::class)
            ->findAll();

        $encoders = [new JsonEncoder()];
        $normalizers = [
            (new ObjectNormalizer())
            ->setIgnoredAttributes(['user'])
        ];
        $serializer = new Serializer($normalizers, $encoders);
        $data = $serializer->serialize($messages, 'json');

        return new JsonResponse($data, 200, [], true);
    }

    /**
     * @Route("/messenger/ajax_add", name="messenger_add")
     */
    public function ajaxAdd(Request $request, Session $session, ObjectManager $manager)
    {
        $messenger = new Messenger();

        $data = $request->request->get('mess');

        $user = $this->getDoctrine()
            ->getRepository(User::class)
            ->find($session->get('userId'));

        $messenger->setUser($user);
        $messenger->setUsername($session->get('userName'));
        $messenger->setDate(new \DateTime('now'));
        $messenger->setMessage($data);

        $manager->persist($messenger);
        $manager->flush();

        return new Response();
    }
}
