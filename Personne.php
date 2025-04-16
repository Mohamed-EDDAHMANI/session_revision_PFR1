<?php 

abstract class Personne{

    protected $nom;
    protected $prenom;
    protected $email;

    public function __construct($nom, $prenom, $email){
        $this->nom = $nom;
        $this->prenom = $prenom;
        $this->email = $email;
    }

    public function afficherProfil(){
        echo 'Le nom : ' . $this->nom;
        echo 'Le prenom : ' . $this->prenom;
        echo 'Le email : ' . $this->email;
    }
}