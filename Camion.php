<?php
class Moto extends Vehicule implements ReservableInterface
{

    private $capaciteTonnage;

    public function __construct($id, $immatriculation, $marque, $modele, $prixJour, $disponible, $capaciteTonnage)
    {
        parent::__construct($id, $immatriculation, $marque, $modele, $prixJour, $disponible);
        $this->capaciteTonnage = $capaciteTonnage;
    }

    public function reserver( $client,  $dateDebut,  $nbJours): Reservation {
        return new Reservation($this, $client, $dateDebut, $nbJours, false);
    }

    public function getType()
    {
        return $this->getModele();
    }

    public function afficherDetails()
    {
        echo 'Camion id :' . $this->getId();
        echo 'immatriculation de Camion :' . $this->getImmatriculation();
        echo 'la marque de Camion :' . $this->getMarque();
        echo 'le modele de Camion :' . $this->getModele();
        echo 'le capaciteTonnage de Camion :' . $this->getCapaciteTonnage();
        echo 'le prix journe de Camion :' . $this->getPrixJour() . 'DH';
        echo 'Disponible :' . ($this->getDisponible() ? 'OUI' : 'NON');
    }

    public function getCapaciteTonnage()
    {
        return $this->capaciteTonnage;
    }

    public function setCapaciteTonnage($capaciteTonnage)
    {
        $this->capaciteTonnage = $capaciteTonnage;
    }

}
?>