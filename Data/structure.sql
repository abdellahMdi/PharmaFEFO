-- 1. Table for users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE, -- Added UNIQUE so two users can't use the same email
    mot_de_passe VARCHAR(255) NOT NULL,
    role VARCHAR(100) NOT NULL
);

-- 2. Table for medicines
CREATE TABLE medicaments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code_cip VARCHAR(50) NOT NULL UNIQUE, -- Added UNIQUE because every medicine has one unique CIP code
    nom VARCHAR(255) NOT NULL,
    seuil_alerte INT NOT NULL DEFAULT 0 -- Added DEFAULT 0 so it starts at zero if forgotten
);

-- 3. Table for medicine batches
CREATE TABLE lots (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medicament_id INT NOT NULL,
    numero_lot VARCHAR(100) NOT NULL,
    dlu DATE NOT NULL,
    quantite INT NOT NULL DEFAULT 0, -- Prevents null errors, starts at 0
    statut VARCHAR(50) NOT NULL DEFAULT 'Disponible', -- Sets a default status automatically
    FOREIGN KEY (medicament_id) REFERENCES medicaments(id) ON DELETE CASCADE -- Automatically removes lots if a medicine is deleted
);

-- 4. Table to track stock movements
CREATE TABLE mouvements_stocks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lot_id INT NOT NULL,
    utilisateur_id INT NOT NULL,
    type VARCHAR(50) NOT NULL, -- 'ENTREE' or 'SORTIE'
    quantite INT NOT NULL,
    date_heure DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Automatically fills in the current date and time
    FOREIGN KEY (lot_id) REFERENCES lots(id) ON DELETE CASCADE,
    FOREIGN KEY (utilisateur_id) REFERENCES users(id)
);

-- 5. Table for system alerts
CREATE TABLE alertes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medicament_id INT NOT NULL,
    type VARCHAR(100) NOT NULL, -- 'PEREMPTION' or 'STOCK_BAS'
    date_creation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Automatically saves when the alert happened
    est_lue TINYINT(1) NOT NULL DEFAULT 0, -- Starts as 0 (Not Read)
    FOREIGN KEY (medicament_id) REFERENCES medicaments(id) ON DELETE CASCADE
);

-- 6. Table for financial/loss reports
CREATE TABLE rapports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT NOT NULL,
    periode VARCHAR(50) NOT NULL, -- e.g., '2026-06'
    valeur_pertes DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    date_generation DATE NOT NULL,
    FOREIGN KEY (utilisateur_id) REFERENCES users(id)
);