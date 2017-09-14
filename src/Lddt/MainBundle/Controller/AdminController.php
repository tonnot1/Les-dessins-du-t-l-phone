<?php
namespace Lddt\MainBundle\Controller;
use Lddt\MainBundle\Entity\Draw;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Template;

class AdminController extends Controller
{
    /**
     * @Template()
     */
    public function indexAction() {
        $draws = $this->get('doctrine')
            ->getRepository('LddtMainBundle:Draw')
            ->findAllDrawsToPushOnline();
        $datas = ['draws'=>$draws];
        return $datas;
    }

    public function pushOnlineAction(Draw $draw) {
        $draw->setIsOnline(true);
        $em = $this->get('doctrine')->getManager();
        $em->persist($draw);
        $em->flush();
        // Envoi du mail de confirmation de mise en ligne
        $message = \Swift_Message::newInstance()
            ->setSubject("Votre dessin {$draw->getTitle()}")
            ->setFrom('m.de.ubeda@gmail.com')
            ->setTo($draw->getAuthor()->getEmail())
            ->setBody($this->renderView('@LddtMain/Emails/confirmation_online.html.twig',['draw'=>$draw]),'text/html');
        $this->get('mailer')->send($message);


        $this->addFlash('success','le dessin '.$draw->getTitle().' est en ligne');
        return $this->redirect($this->generateUrl('lddt_admin_homepage'));
    }


}