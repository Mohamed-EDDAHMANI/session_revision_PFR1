<?php
class Voiture extends Vehicule implements ReservableInterface
{

    private $nbPortes;
    private $transmission;

    public function __construct( $nbPortes, $transmission)
    {
        $this->nbPortes = $nbPortes;
        $this->transmission = $transmission;
    }

    public function reserver($client, $dateDebut, $nbJours) {
        return ;
    }

    public function getType()
    {
        return $this->getModele();
    }

    public function afficherDetails()
    {
        echo 'Voiture id :' . $this->getId();
        echo 'immatriculation de Voiture :' . $this->getImmatriculation();
        echo 'la marque de Voiture :' . $this->getMarque();
        echo 'le modele de Voiture :' . $this->getModele();
        echo 'le nombre portes de Voiture :' . $this->getNbPortes();
        echo 'le transmission de Voiture :' . $this->getTransmission();
        echo 'le prix journe de Voiture :' . $this->getPrixJour() . 'DH';
        echo 'Disponible :' . ($this->getDisponible() ? 'OUI' : 'NON');
    }

    public function getNbPortes()
    {
        return $this->nbPortes;
    }
    public function setNbPortes($nbPortes)
    {
        $this->nbPortes = $nbPortes;
    }
    public function getTransmission()
    {
        return $this->transmission;
    }
    public function setTransmission($transmission)
    {
        $this->transmission = $transmission;
    }

}
?>