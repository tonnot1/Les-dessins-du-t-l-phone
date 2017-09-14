<?php

namespace Lddt\MainBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class DrawType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
   ->add('title',TextType::class,array('label'=>'Nom du dessin'
                    ));

        if($builder->getData()->getId() == false) {
//           $builder->add('drawPath',
//                TextType::class,array('label'=>'chemin du dessin'
//                    ));
            // Formulaire imbriqué pour charger la class PicType > 1 form pour créer un dessin et 1 form imbriqué pour créer une image
$builder->add('pic',PicType::class);
        }


//   $builder->add('avatarPath',TextType::class,
//                array('label'=>'chemin de votre avatar'
//                    ))
//           // ->add('isOnline')
//           ->add('authorName',TextType::class,
//               array('label'=>'Pseudo',
//                   'attr'=>array('class'=>'form-control')));

           // ->add('createdAt')
           // ->add('updatedAt')
$builder->add('category',EntityType::class,
               array('class'=>"Lddt\MainBundle\Entity\Category",'choice_label'=>'name','label'=>'Catégorie'))
            ->add('color',EntityType::class,array('class'=>"Lddt\MainBundle\Entity\Color",'label'=>"associez vos couleurs",
                'choice_label'=>'name','multiple'=>true,'expanded'=>true))

//       ->add('tags',EntityType::class,array('class'=>"Lddt\MainBundle\Entity\Tag",'label'=>"associez vos tags",
//           'choice_label'=>'name','multiple'=>true,'expanded'=>true))

           ->add('tags',CollectionType::class,
           array('entry_type'=>TagType::class,
                 'allow_add'=>true,
                 'allow_delete'=>true))

      ->add('valider', SubmitType::class, array(
                'attr' => array('class' => 'btn btn-primary pull-right mt-20')));


    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Lddt\MainBundle\Entity\Draw'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'lddt_mainbundle_draw';
    }


}
