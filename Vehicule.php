<?php
abstract class Vehicule 
{
    protected $id;
    protected $immatriculation;
    protected $marque;
    protected $modele;
    protected $prixJour;
    protected $disponible;

    public function __construct($id, $immatriculation, $marque, $modele, $prixJour, $disponible)
    {
        $this->id = $id;
        $this->immatriculation = $immatriculation;
        $this->marque = $marque;
        $this->modele = $modele;
        $this->prixJour = $prixJour;
        $this->disponible = $disponible;
    }

    public function afficherDetails()
    {
        echo 'Vehicule id :' . $this->getId();
        echo 'immatriculation de Vehicule :' . $this->getImmatriculation();
        echo 'la marque de Vehicule :' . $this->getMarque();
        echo 'le modele de Vehicule :' . $this->getModele();
        echo 'le prix journe de Vehicule :' . $this->getPrixJour() . 'DH';
        echo 'Disponible :' . ($this->getDisponible() ? 'OUI' : 'NON');
    }

    public function calculerPrix(int $jours)
    {
        return $this->getPrixJour() * $jours;
    }

    public function estDisponible(int $jours)
    {
        return $this->getPrixJour() * $jours;
    }

    abstract public function getType();

    public function getId()
    {
        return $this->id;
    }
    public function getImmatriculation()
    {
        return $this->immatriculation;
    }
    public function getMarque()
    {
        return $this->marque;
    }
    public function getModele()
    {
        return $this->modele;
    }
    public function getPrixJour()
    {
        return $this->prixJour;
    }
    public function getDisponible()
    {
        return $this->disponible;
    }
    public function setId($id)
    {
        $this->id = $id;
    }
    public function setImmatriculation($immatriculation)
    {
        $this->immatriculation = $immatriculation;
    }
    public function setMarque($marque)
    {
        $this->marque = $marque;
    }
    public function setModele($modele)
    {
        $this->modele = $modele;
    }
    public function setPrixJour($prixJour)
    {
        $this->prixJour = $prixJour;
    }
    public function setDisponible($disponible)
    {
        $this->disponible = $disponible;
    }


}
?>