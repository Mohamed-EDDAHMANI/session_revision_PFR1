<?php
class Moto extends Vehicule implements ReservableInterface
{

    private $cylindree;

    public function __constractor($cylindree, $id, $immatriculation, $marque, $modele, $prixJour, $disponible)
    {
        parent::__construct($id, $immatriculation, $marque, $modele, $prixJour, $disponible);
        $this->cylindree = $cylindree;
    }

    public function reserver( $client,  $dateDebut,  $nbJours) {
        if ($this->getDisponible()) {
            return 'le Vehicule est deja reserve';
        } else {
            $this->setDisponible(false);
            return 'le Vehicule est reserve avec succes';
        }
        return new Reservation($vehicule, $client, $dateDebut, $nbJours, true);
    }

    public function getType()
    {
        return $this->getModele();
    }

    public function afficherDetails()
    {
        echo 'Moto id :' . $this->getId();
        echo 'immatriculation de Moto :' . $this->getImmatriculation();
        echo 'la marque de Moto :' . $this->getMarque();
        echo 'le modele de Moto :' . $this->getModele();
        echo 'le cylindree de Moto :' . $this->getCylindree();
        echo 'le prix journe de Moto :' . $this->getPrixJour() . 'DH';
        echo 'Disponible :' . ($this->getDisponible() ? 'OUI' : 'NON');
    }

    public function getCylindree()
    {
        return $this->cylindree;
    }
    public function setCylindree($cylindree)
    {
        $this->cylindree = $cylindree;
    }

}
?>