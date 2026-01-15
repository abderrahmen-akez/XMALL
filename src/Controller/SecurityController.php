<?php

namespace Xmall\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;


/**
 * make:auth utilisé pour la connexion
 */
class SecurityController extends AbstractController
{
    public function __construct(private readonly \Symfony\Component\Security\Http\Authentication\AuthenticationUtils $authenticationUtils)
    {
    }
    #[Route(path: '/connexion', name: 'app_login')]
    public function login(): Response
    {
        if ($this->getUser() instanceof \Symfony\Component\Security\Core\User\UserInterface) {
            return $this->redirectToRoute('account');
        }
        // get the login error if there is one
        $error = $this->authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $this->authenticationUtils->getLastUsername();
        return $this->render('security/login.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
    }

    #[Route(path: '/logout', name: 'app_logout')]
    public function logout(): void
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }
}
