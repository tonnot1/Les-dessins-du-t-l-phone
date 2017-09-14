<?php
/**
 * Created by PhpStorm.
 * User: stagiaire
 * Date: 27/06/2017
 * Time: 11:55
 */

namespace Lddt\MainBundle\Controller;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class InstagramController extends Controller
{

    //Récupérer les dessins postés sur Instagram avec le #lesdessinsdutelephone
    public function fetchDrawAction() {
        // Récupérer l'id d'un compte instagram
       // https://www.instagram.com/lesdessinsdutelephone/?__a=1

        // Récupérer les medias d'un user
        // $endpoint_url = "https://api.instagram.com/v1/users/1463064591/media/recent/?access_token=1463064591.7b97e10.25ef17cf38374b40b7017c4d4ccd57a3";
        $client = new \GuzzleHttp\Client();

        $response=  $client->request('GET','https://www.instagram.com/lesdessinsdutelephone/?__a=1');
        $json = $response->getBody();
        $json_tab = json_decode($json,true);
       // var_dump($json_tab);
       // die();
        return $this->render('@LddtMain/Instagram/debug.html.twig',['json'=>$json_tab]);
    }
}