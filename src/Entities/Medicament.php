<?php

class Medicament {
    private int $id;
    private string $nom;
    private int $seuilAlerte;

    public function __construct(int $id, string $nom, int $seuilAlerte) {
        $this->id = $id;
        $this->nom = $nom;
        $this->seuilAlerte = $seuilAlerte;
    }

    public function getId(): int { return $this->id; }
    public function getNom(): string { return $this->nom; }
    public function getSeuilAlerte(): int { return $this->seuilAlerte; }
}

class Lot {
    private string $numeroLot;
    private string $dlu;
    private int $quantite;
    private string $statut;

    public function __construct(string $numeroLot, string $dlu, int $quantite, string $statut) {
        $this->numeroLot = $numeroLot;
        $this->dlu = $dlu;
        $this->quantite = $quantite;
        $this->statut = $statut;
    }

    public function getNumeroLot(): string { return $this->numeroLot; }
    public function getDlu(): string { return $this->dlu; }
    public function getQuantite(): int { return $this->quantite; }
    
    public function getStatut(): string { return $this->statut; }
    public function setStatut(string $statut): void { $this->statut = $statut; } // Permet de modifier le statut
}