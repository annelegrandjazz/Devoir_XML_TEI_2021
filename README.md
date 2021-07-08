# Structuration XML de trois lettres de la correspondance entre Hugues Panassié et Charles Delaunay puis transformation XSLT vers le format HTML.

Devoir de Master 2 Technologies numériques appliquées à l'histoire (Ecole nationale des chartes) : cours de [@ArianePinche](https://github.com/ArianePinche).

## Devoir ```TEI```

### Consignes générales

* Structurer le texte en ```XML-TEI``` en vue d’une édition et en respectant le genre littéraire auquel il appartient ;
* Compléter de la manière la plus précise possible le teiHeader de l'édition, en fonction des éléments nécessaires à son établissement et à la compréhension du texte ;
* Écrire un schéma ```ODD``` adapté à l'encodage et documenté.
  - Générer une ```ODD``` à partir de oddbyexample et associer le schéma rng correspondant au fichier ```XML```.
	- À partir de l'```ODD```, générer la documentation ```HTML``` du projet.
		- Présenter en introduction le projet et ses exploitations possibles ;
		- Documenter le fonctionnement de l'encodage et le choix des balises.
* Créer une feuille de transformation simple ;
* Maîtriser ```XPath```et ses fonctions de base ;

### Consignes de l'édition d'une correspondance

* Télécharger le texte via l’interface de Gallica ;
* Nettoyer le texte (doubles espaces, problème sur les caractères accentués, coquilles…) ;
* Structurer le texte en prenant en compte le genre de la correspondance ;
* Ajouter dans le texte toutes les notes nécessaires à la compréhension du texte ;
* Signaler dans le texte les dates, les noms de personnages, les noms de lieux ;
* Faire un index des noms de personnages et de lieux ;
* Compléter le TEIheader ;
* Écrire l’```ODD``` la plus restrictive possible en fonction de votre encodage ;
* Ajouter dans votre ```ODD``` la documentation sur votre projet d’encodage, les éléments que vous avez encodés : pourquoi et comment, et quels pourront être à terme les usages de votre édition.

## Devoir ```XSLT```

### Consignes générales

* Mettre en place une structure d'accueil en ```HTML``` ;
* Rédiger des règles simples avec un ```XPath``` valide pour insérer des informations du document source dans le document de sortie ;
* Créer une ou des règles avec des conditions ;
* Utiliser une ou des règles avec ```<xsl:for-each>``` *(uniquement si cela est nécessaire)* ;
* Proposer un code facile à lire et commenté ;
* Simplifier le plus possible ses règles ```XSL```.

## Consulter le site

Télécharger le projet et ouvrir la page home.html dans le dossier XSLT_HTML.
