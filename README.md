# README

Ce projet est une application web qui permet de consulter les données de l'API Swappi (https://swapi.dev/).

## Installation

J'ai mis en place un script d'installation qui permet de créer un environnement virtuel et d'installer les dépendances du projet en utilisant Docker.

Pour lancer le script, il faut se placer à la racine du projet et lancer la commande suivante :
        
```bash
docker compose up
```

L'installation peut prendre quelques minutes. 
Une fois terminée, vous pouvez accéder à l'application à l'adresse suivante : http://localhost:3000

## Utilisation

J'ai pu mettre en place les fonctionnalités suivantes :

- Login avec création de compte
- Overview des données de Swappi trié par type (people, planets, starships, vehicles, films, species)
- Fonction de recherche qui va chercher dans tous les types de données de Swappi
- Lorsqu'on clique sur un élément de la liste, on accède à une page de détail de l'élément
- La page détails affiche les informations de l'élément ainsi que des liens vers les éléments liés (par exemple, pour un people, on affiche les films dans lesquels il a joué) 

## Temps passé

- Vendredi 05/05 : 09h00 - 12h20 / 13h30 - 16h30 (6h50)
  - Implémentation de la fonction de login
  - Implémentation de la fonction de récupération des données de Swappi
  - Implémentation de la fonction de recherche
- Dimanche 07/05 : 18h00 - 20h00 / 23h00 - 01h00 (4h00)
  - Ajout du framework CSS Bulma
  - Ajout du Css pour les différentes pages
- Lundi 08/05 : 09h00 - 12h15 / 13h45 - 16h15 (5h30)
  - Implémentation des scripts Docker
  - Corretion de bugs et amélioration
  - Documentation

Total : 16h20