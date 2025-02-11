# README - Pipeline de Gestion des Données E-commerce

## Introduction
Ce projet vise à mettre en place un pipeline de gestion et d'analyse des données pour une plateforme e-commerce. Il intègre des processus d'ETL, un entrepôt de données structuré et des outils de visualisation pour améliorer la prise de décision.

## Technologies Utilisées
- **ETL** : Talend
- **Base de données** : SQL Server
- **Visualisation** : Power BI
- **Tests SQL** : tSQLt

## Fonctionnalités Principales
- Extraction et transformation des données de vente et d'inventaire.
- Stockage structuré dans un entrepôt de données (modèle en constellation).
- Création de Data Marts pour analyses spécifiques.
- Tableaux de bord interactifs sous Power BI.
- Orchestration et automatisation des processus ETL avec Talend.

## Structure du Projet
### 1. ETL avec Talend
- Chargement des fichiers CSV et JSON.
- Nettoyage et enrichissement des données.
- Gestion des Slowly Changing Dimensions (SCD).

### 2. Modélisation SQL Server
- Tables de dimensions (clients, produits, transporteurs, etc.).
- Tables de faits (ventes, stocks, etc.).
- Indexation et partitionnement pour optimiser les performances.

### 3. Analyse et Visualisation
- Tableaux de bord Power BI pour suivre les performances commerciales et logistiques.
- Prédictions des ventes et alertes en cas de seuil critique.

### 4. Orchestration et Automatisation
- Planification et surveillance des tâches ETL via Talend JobConductor.
- Journalisation des processus et alertes en cas d'erreur.

## Instructions d'Installation
1. Installer **Talend Open Studio** et configurer les connexions aux sources de données.
2. Déployer les scripts SQL sur SQL Server pour créer l'entrepôt de données.
3. Importer les fichiers CSV/JSON dans le système.
4. Charger et exécuter les flux ETL.
5. Configurer Power BI pour exploiter les données via des tableaux de bord dynamiques.

## Contact
Pour toute question ou amélioration, n'hésitez pas à contacter l'équipe projet.
