<?php

namespace Xmall\Controller;

use Xmall\Form\SearchType;
use Xmall\Repository\ProductRepository;
use Xmall\Model\Search;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductController extends AbstractController
{
    public function __construct(private readonly \Xmall\Repository\ProductRepository $repository)
    {
    }
    #[Route('/articles', name: 'product')]
    public function index(Request $request): Response
    {
       
        // Si recherche exécutée, $products contiendra les résultats filtrés
        $search = new Search();
        $form = $this->createForm(SearchType::class, $search);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $products = $this->repository->findWithSearch($search);
        } else {
            $products = $this->repository->findAll();
        }

        
        return $this->renderForm('product/index.html.twig', [
            'products' => $products,
            'form' => $form,
        ]);
    }

    #[Route('/articles/{slug}', name: 'product_show')]
    public function show(string $slug): Response
    {
        $product = $this->repository->findOneBySlug($slug);

        if (!$product) {
            return $this->redirectToRoute('product');
        }
        return $this->render('product/show.html.twig', [
            'product' => $product,
        ]);
    }
}


