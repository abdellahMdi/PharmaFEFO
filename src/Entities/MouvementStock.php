<?php

class MouvementStock {
    private string $type;
    private int $quantite;
    private string $dateHeure;

    public function __construct(string $type, int $quantite, string $dateHeure) {
        $this->type = $type;
        $this->quantite = $quantite;
        $this->dateHeure = $dateHeure;
    }

    public function getType(): string { return $this->type; }
    public function getQuantite(): int { return $this->quantite; }
    public function getDateHeure(): string { return $this->dateHeure; }
}