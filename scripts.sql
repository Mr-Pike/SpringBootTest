
-- Companies.
CREATE TABLE company (
    id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) DEFAULT NULL,
	created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL
);
INSERT INTO `company` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES (1, 'TechNova Solutions', '12 Rue des Innovateurs, 75011 Paris', '2025-10-03 17:20:21', '2025-10-03 17:20:22');
INSERT INTO `company` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES (2, 'GreenLeaf Énergies', '45 Avenue des Écologistes, 69007 Lyon', '2025-10-03 17:20:35', '2025-10-03 17:20:37');
INSERT INTO `company` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES (3, 'Boulangerie du Coin', '8 Rue de la Baguette, 13005 Marseille', '2025-10-03 17:20:55', '2025-10-03 17:20:56');
INSERT INTO `company` (`id`, `name`, `address`, `created_at`, `updated_at`) VALUES (4, 'Business and co', '15 Rue des grandes Affaires, 13005 Marseille', '2025-10-03 17:20:55', '2025-10-03 17:20:56');

-- Customers.
CREATE TABLE customer (
	id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	email VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci',
	lucky_number INT DEFAULT NULL,
	created_at TIMESTAMP NULL DEFAULT NULL,
	updated_at TIMESTAMP NULL DEFAULT NULL,
	company_id BIGINT(20) UNSIGNED NOT NULL
);
ALTER TABLE customer ADD CONSTRAINT `user_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);
INSERT INTO customer (name, email, created_at, updated_at, company_id) VALUES
('Alice Dupont', 'alice.dupont@example.com', '2025-09-01 10:15:00', '2025-09-10 14:00:00', 1),
('Jean Martin', 'jean.martin@example.com', '2025-08-25 09:30:00', '2025-09-05 11:45:00', 1),
('Claire Moreau', 'claire.moreau@example.com', '2025-07-18 15:20:00', '2025-08-20 16:30:00', 2),
('Marc Lefebvre', 'marc.lefebvre@example.com', '2025-06-10 08:00:00', '2025-06-20 09:00:00', 2),
('Sophie Renault', 'sophie.renault@example.com', '2025-10-01 11:00:00', '2025-10-01 11:00:00', 2),
('Luc Dubois', 'luc.dubois@example.com', '2025-09-15 13:45:00', '2025-09-25 17:10:00', 1),
('Emma Bernard', 'emma.bernard@example.com', '2025-08-01 12:00:00', '2025-08-15 14:30:00', 2),
('Thomas Roux', 'thomas.roux@example.com', '2025-07-10 10:10:00', '2025-07-20 12:45:00', 1),
('Julie Fontaine', 'julie.fontaine@example.com', '2025-09-05 09:25:00', '2025-09-10 13:00:00', 1),
('Antoine Giraud', 'antoine.giraud@example.com', '2025-10-02 08:40:00', '2025-10-02 08:40:00', 1);

UPDATE customer SET lucky_number = 4 WHERE id = 1;
UPDATE customer SET lucky_number = 9 WHERE id = 6;

-- Services.
CREATE TABLE service (
    id BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL COLLATE 'utf8mb4_unicode_ci'
);
INSERT INTO `service` (`id`, `name`) VALUES (1, 'Conception de pain');
INSERT INTO `service` (`id`, `name`) VALUES (2, 'Vendeur de pain');
INSERT INTO `service` (`id`, `name`) VALUES (3, 'Chcoloatine');
INSERT INTO `service` (`id`, `name`) VALUES (4, 'Croissant');
INSERT INTO `service` (`id`, `name`) VALUES (5, 'Vente de produits / services');
INSERT INTO `service` (`id`, `name`) VALUES (6, 'Produit de l\'électricité');
INSERT INTO `service` (`id`, `name`) VALUES (7, 'Référencement SEO');
INSERT INTO `service` (`id`, `name`) VALUES (9, 'Gestion des réseaux sociaux');
INSERT INTO `service` (`id`, `name`) VALUES (8, 'Nettoyage des locaux');

-- Company service.
CREATE TABLE company_service (
    company_id BIGINT(20) UNSIGNED NOT NULL,
    service_id BIGINT(20) UNSIGNED NOT NULL
);
ALTER TABLE company_service ADD CONSTRAINT `company_service_company_id` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);
ALTER TABLE company_service ADD CONSTRAINT `company_service_service_id` FOREIGN KEY (`service_id`) REFERENCES `service` (`id`);
ALTER TABLE company_service ADD  PRIMARY KEY(service_id, company_id);
INSERT INTO `company_service` (`company_id`, `service_id`) VALUES (3, 3);
INSERT INTO `company_service` (`company_id`, `service_id`) VALUES (3, 5);
INSERT INTO `company_service` (`company_id`, `service_id`) VALUES (3, 2);
INSERT INTO `company_service` (`company_id`, `service_id`) VALUES (3, 4);
INSERT INTO `company_service` (`company_id`, `service_id`) VALUES (2, 7);
INSERT INTO `company_service` (`company_id`, `service_id`) VALUES (2, 5);
INSERT INTO `company_service` (`company_id`, `service_id`) VALUES (1, 3);

