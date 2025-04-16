<?php

class Client extends Personne{

    private $numeroClient;
    private $reservations = [];

    public function __construct($numeroClient, $reservations, $nom, $prenom, $email){
        $this->numeroClient = $numeroClient;
        $this->reservations = $reservations;
        parent::__construct($nom, $prenom, $email);
    }

    public function afficherProfil(){
        echo 'Le nom : ' . $this->nom;
        echo 'Le prenom : ' . $this->prenom;
        echo 'Le email : ' . $this->email;
        echo 'Le nombre de client : ' . $this->numeroClient;
        
    }
    public function getHistorique(){
        foreach($this->reservations as $index => $re){
            echo '          La reservation '. $index . ' : ' ;
            echo '--vehicule : '. $this->reservations->getVehicule();
            echo '--date debut : '. $this->reservations->getDateDebut();
            echo '--nombre des jours : '. $this->reservations->getNbJours();
        }
    }
}