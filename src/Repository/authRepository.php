<?php

/**
 * Récupère un utilisateur par son email depuis la base de données.
 *
 * @param PDO $pdo L'instance de connexion PDO à la base de données.
 * @param string $email L'email à rechercher.
 * @return array|false Retourne les données de l'utilisateur sous forme de tableau associatif, ou false si non trouvé.
 */
function getUserByEmail(PDO $pdo, string $email) {
    try {
        // 1. Préparation de la requête SQL (utilisation des requêtes préparées contre les injections SQL)
        $sql = "SELECT id, nom, email, mot_de_passe, role FROM users WHERE email = :email LIMIT 1";
        $stmt = $pdo->prepare($sql);
        
        // 2. Exécution avec liaison du paramètre
        $stmt->execute([':email' => $email]);
        
        // 3. Récupération du résultat sous forme de tableau associatif
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        
        return $user; // Retournera le tableau ou false si aucun utilisateur ne correspond
        
    } catch (PDOException $e) {
        // 4. Gestion de l'erreur
        // En production, il vaut mieux écrire l'erreur dans un fichier de log (error_log) 
        // plutôt que de l'afficher directement à l'écran pour des raisons de sécurité.
        error_log("Erreur lors de la récupération de l'utilisateur : " . $e->getMessage());
        
        // Optionnel : vous pouvez lever à nouveau une exception ou retourner false
        return false;
    }
}