<?php

class Alerte {
    private string $type;
    private string $dateCreation;
    private bool $estLue;

    public function __construct(string $type, string $dateCreation, bool $estLue = false) {
        $this->type = $type;
        $this->dateCreation = $dateCreation;
        $this->estLue = $estLue;
    }

    public function getType(): string { return $this->type; }
    public function getDateCreation(): string { return $this->dateCreation; }
    
    public function getEstLue(): bool { return $this->estLue; }
    public function setEstLue(bool $estLue): void { $this->estLue = $estLue; } // Permet de marquer comme lue
}
