<?php

namespace Xmall\Controller;

use Xmall\Repository\HeadersRepository;
use Xmall\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    public function __construct(private readonly \Xmall\Repository\ProductRepository $productRepository, private readonly \Xmall\Repository\HeadersRepository $headersRepository)
    {
    }
    #[Route('/', name: 'home')]
    public function index(): Response
    {
        $products = $this->productRepository->findByIsInHome(1);
        $headers = $this->headersRepository->findAll();
        return $this->render('home/index.html.twig', [
            'carousel' => true,  //Le caroussel ne s'affiche que sur la page d'accueil (voir base.twig)
            'top_products' => $products,
            'headers' => $headers
        ]);
    }

    #[Route('a-propos', name: 'about')]
    public function about(): Response
    {
        return $this->render('home/about.html.twig');
    }
}
