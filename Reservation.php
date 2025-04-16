<?php
class Reservation
{
    public $vehicule;
    public $client;
    public $dateDebut;
    public $nbJours;
    public $statut;

    public function __construct($vehicule, $client, $dateDebut, $nbJours, $statut = false)
    {
        $this->vehicule = $vehicule;
        $this->client = $client;
        $this->dateDebut = $dateDebut;
        $this->nbJours = $nbJours;
        $this->statut = $statut;
    }

    public function calculerMontant()
    {
        return $this->vehicule->getPrixJour() * $this->nbJours;
    }

    public function confirmer()
    {
        if (!$this->vehicule->getDisponible()) {
            $this->statut = true;
            $this->vehicule->setDisponible(true);
        }
    }
    public function annuler()
    {
        $this->statut = false;
        $this->vehicule->setDisponible(false);
    }

    public function getVehicule()
    {
        return $this->vehicule;
    }
    public function getDateDebut()
    {
        return $this->dateDebut;
    }
    public function getNbJours()
    {
        return $this->nbJours;
    }
}