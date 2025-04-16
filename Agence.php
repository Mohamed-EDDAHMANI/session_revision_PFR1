<?php 

class Agence{

    private $nom;
    private $ville;
    private $vehicules = [];
    private $clients = [];

    public function __construct($nom, $ville) {
        $this->nom = $nom;
        $this->ville = $ville;
    }

    public function ajouterVehicule(Vehicule $v){
        $this->vehicules[] = $v;
    }

    public function rechercherVehiculeDisponible(string $type){
        foreach($this->vehicules as $v){
            return $v->getType() == $type;
        }
    }

    public function enregistrerClient(Client $c){
        $this->clients[] = $c;
    }

    public function faireReservation(Client $client, Vehicule $v, DateTime $dateDebut, int $nbJours): Reservation{
        return new Reservation($v, $client, $dateDebut, $nbJours);
    }
}