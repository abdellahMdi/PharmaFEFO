-- ==========================================
-- 1. EXPANDED SEED DATA FOR 'utilisateurs'
-- ==========================================
INSERT INTO utilisateurs (nom, email, mot_de_passe, role) VALUES
('Jean Préparateur', 'jean@pharmacie.fr', '$2y$10$xyz123abc456hashedpassword', 'Préparateur'),
('Lucas Saisies', 'lucas@pharmacie.fr', '$2y$10$lucas789xyzhashedpassword', 'Préparateur'),
('Chloé Ingrédients', 'chloe@pharmacie.fr', '$2y$10$chloe456abchashedpassword', 'Préparateur'),
('Marie Pharmacienne', 'marie@pharmacie.fr', '$2y$10$abc456xyz123hashedpassword', 'Pharmacien Titulaire'),
('Jérôme Biologiste', 'jerome@pharmacie.fr', '$2y$10$bio789biologistehashed', 'Pharmacien Titulaire'),
('Alain Admin', 'alain@pharmacie.fr', '$2y$10$999999999999hashedpassword', 'Administrateur');

-- ==========================================
-- 2. EXPANDED SEED DATA FOR 'medicaments'
-- ==========================================
INSERT INTO medicaments (code_cip, nom, seuil_alerte) VALUES
('3400930190457', 'Doliprane 1000mg - Boite de 8 gélules', 50),
('3400936231451', 'Amoxicilline Sandoz 1g - Boite de 14 comprimés', 20),
('3400934945411', 'Kardegic 75mg - Boite de 30 sachets', 15),
('3400930024141', 'Spasfon Comprimés - Boite de 30', 40),
('3400935634574', 'Tahor 20mg (Atorvastatine) - Boite de 28', 25),
('3400936015426', 'Imodium Capcaps 2mg - Boite de 12', 10),
('3400934394851', 'Inexium 40mg (Esoméprazole) - Boite de 28', 30),
('3400932434320', 'Dafalgan Codeine - Boite de 16 comprimés', 15),
('3400930002149', 'Ventoline 100 µg/dose - Inhalateur 200 doses', 25),
('3400936838353', 'Augmentin Enfant (Amox/Acide Clav) - Flacon Poudre', 12);

-- ==========================================
-- 3. EXPANDED SEED DATA FOR 'lots'
-- ==========================================
INSERT INTO lots (medicament_id, numero_lot, dlu, quantite, statut) VALUES
-- Doliprane (Id: 1) - Multiple lots to test FEFO rules
(1, 'LOT-DOLI-001', '2027-12-31', 120, 'Disponible'), -- Plenty of time
(1, 'LOT-DOLI-002', '2026-07-01', 4, 'Disponible'),   -- CRITICAL (< 30 days remaining in June 2026)
(1, 'LOT-DOLI-003', '2026-08-15', 45, 'Disponible'),  -- WARNING (< 90 days remaining)
-- Amoxicilline (Id: 2)
(2, 'LOT-AMOX-88A', '2026-09-15', 40, 'Disponible'),  -- WARNING (< 90 days remaining)
(2, 'LOT-AMOX-88B', '2028-01-20', 200, 'Disponible'),
-- Kardegic (Id: 3)
(3, 'LOT-KARD-99X', '2025-12-01', 0, 'Périmé'),       -- Expired in the past
(3, 'LOT-KARD-99Y', '2026-06-25', 12, 'Disponible'),  -- CRITICAL (< 30 days)
-- Spasfon (Id: 4)
(4, 'LOT-SPAS-041', '2027-04-10', 85, 'Disponible'),
(4, 'LOT-SPAS-042', '2026-07-12', 3, 'Disponible'),   -- CRITICAL
-- Tahor (Id: 5)
(5, 'LOT-TAHO-L5', '2026-11-30', 60, 'Disponible'),   -- Safe for now (> 5 months)
-- Imodium (Id: 6)
(6, 'LOT-IMOD-A1', '2026-07-02', 2, 'Disponible'),    -- CRITICAL
(6, 'LOT-IMOD-A2', '2027-08-14', 50, 'Disponible'),
-- Inexium (Id: 7)
(7, 'LOT-INEX-55', '2026-08-05', 18, 'Disponible'),   -- WARNING
-- Dafalgan Codeine (Id: 8)
(8, 'LOT-DAF-C09', '2027-02-28', 35, 'Disponible'),
-- Ventoline (Id: 9)
(9, 'LOT-VENT-V1', '2026-06-18', 0, 'Périmé'),        -- Expired this month, set to 0
(9, 'LOT-VENT-V2', '2027-10-22', 90, 'Disponible'),
-- Augmentin (Id: 10)
(10, 'LOT-AUG-R4', '2026-08-29', 15, 'Disponible');  -- WARNING

-- ==========================================
-- 4. EXPANDED SEED DATA FOR 'mouvements_stocks'
-- ==========================================
INSERT INTO mouvements_stocks (lot_id, utilisateur_id, type, quantite, date_heure) VALUES
-- Initial setups (January - April 2026)
(1, 1, 'ENTREE', 120, '2026-01-10 09:15:00'),
(2, 1, 'ENTREE', 10, '2026-02-14 10:30:00'),
(4, 2, 'ENTREE', 40, '2026-03-01 11:00:00'),
(5, 3, 'ENTREE', 85, '2026-03-15 15:45:00'),
(8, 2, 'ENTREE', 50, '2026-04-02 09:00:00'),
(11, 1, 'ENTREE', 60, '2026-04-12 14:10:00'),

-- Sales and dispensations (May - June 2026)
(2, 1, 'SORTIE', 3, '2026-05-20 14:22:00'),
(2, 2, 'SORTIE', 3, '2026-06-01 16:05:00'), -- Using up old stock of Doliprane
(4, 1, 'SORTIE', 5, '2026-06-02 10:12:00'),
(7, 3, 'SORTIE', 10, '2026-06-04 11:30:00'),
(11, 2, 'SORTIE', 8, '2026-06-05 17:00:00'),

-- Wasted / Lost items declared
(6, 6, 'PERTE', 15, '2026-05-01 08:30:00'),  -- Old Kardegic thrown out
(15, 6, 'PERTE', 12, '2026-06-10 09:00:00'); -- Ventoline expired thrown out

-- ==========================================
-- 5. EXPANDED SEED DATA FOR 'alertes'
-- ==========================================
INSERT INTO alertes (medicament_id, type, date_creation, est_lue) VALUES
-- Low stock alerts
(1, 'STOCK_BAS', '2026-06-01 08:00:00', 0),
(6, 'STOCK_BAS', '2026-06-03 12:15:00', 0),
(8, 'STOCK_BAS', '2026-06-04 09:30:00', 1),

-- Expiration warning alerts (DLU coming up fast)
(3, 'PEREMPTION', '2025-11-15 08:00:00', 1), -- Old alert
(1, 'PEREMPTION', '2026-06-01 06:00:00', 0), -- Doliprane LOT-002 alert
(7, 'PEREMPTION', '2026-06-05 06:00:00', 0), -- Kardegic LOT-99Y alert
(9, 'PEREMPTION', '2026-06-08 06:00:00', 0); -- Spasfon LOT-042 alert

-- ==========================================
-- 6. EXPANDED SEED DATA FOR 'rapports'
-- ==========================================
INSERT INTO rapports (utilisateur_id, periode, valeur_pertes, date_generation) VALUES
(6, '2026-03', 0.00, '2026-04-01'),   -- Clear month, no waste
(6, '2026-04', 42.10, '2026-05-01'),  -- Small loss
(6, '2026-05', 145.20, '2026-06-01'); -- Bigger loss recorded at start of June