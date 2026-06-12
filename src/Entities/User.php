<?php

class User {
    protected int $id;
    protected string $nom;
    protected string $email;
    protected string $motDePasse;
    protected string $role;

    public function __construct(int $id, string $nom, string $email, string $motDePasse, string $role) {
        $this->id = $id;
        $this->nom = $nom;
        $this->email = $email;
        $this->motDePasse = $motDePasse;
        $this->role = $role;
    }

    // Getters
    public function getId(): int { return $this->id; }
    public function getNom(): string { return $this->nom; }
    public function getEmail(): string { return $this->email; }
    public function getRole(): string { return $this->role; }

    public function seDeconnecter(): void {
        // Code pour déconnexion
    }
}