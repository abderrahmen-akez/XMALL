<?php

namespace Xmall\Controller;

use Xmall\Entity\User;
use Xmall\Form\RegisterType;
use Xmall\Security\LoginAuthenticator;
use Xmall\Service\Mail;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\UserAuthenticatorInterface;

/**
 * Formulaire d'inscription créé manuellement
 * Une fois inscris, l'utilisateur est automatiquement authentifié.
 */
class RegisterController extends AbstractController
{
    public function __construct(private readonly \Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface $userPasswordHasher, private readonly \Symfony\Component\Security\Http\Authentication\UserAuthenticatorInterface $userAuthenticator, private readonly \Xmall\Security\LoginAuthenticator $authenticator)
    {
    }
    #[Route('/inscription', name: 'register')]
    public function index(Request $request, EntityManagerInterface $em): Response
    {
        $user = new User();

        $form = $this->createForm(RegisterType::class,$user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user->setPassword($this->userPasswordHasher->hashPassword($user,$form->get('password')->getData()));

            $em->persist($user);
            $em->flush();

            // Envoi mail confirmation
            $content = "Bonjour {$user->getFirstname()} nous vous remercions de votre inscription";
            (new Mail)->send($user->getEmail(), $user->getFirstname(), "Bienvenue sur XMALL", $content);

            // Loggin auto
            return $this->userAuthenticator->authenticateUser(
                $user,
                $this->authenticator,
                $request
            );
        }

        return $this->renderForm('register/index.html.twig', [
            'form' => $form,
        ]);
    }
}
