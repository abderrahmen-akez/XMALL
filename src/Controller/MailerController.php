<?php

namespace Xmall\Controller;

use Xmall\Service\Mail;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MailerController extends AbstractController
{
    #[Route('/mailer', name: 'mailer')]
    public function index(): Response
    {
        $mail = new Mail();
        $mail->send('abderrahmen.akkez@gmail.com', 'Abderrahmen', 'test', 'contenu');
        return $this->redirectToRoute('home');
    }
}
