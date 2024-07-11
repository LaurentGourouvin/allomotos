# Arborescence du projet

## application/
Contient la logique d'application. C'est ici que se trouvent les services applicatifs, les DTOs (Data Transfer Objects), et les interfaces.

- **dto/** : Contient les objets de transfert de données utilisés pour transférer des données entre les couches.
- **interfaces/** : Contient les interfaces pour les services applicatifs.
- **services/** : Contient les services applicatifs qui orchestrent les cas d'utilisation.

## domain/
Contient la logique métier. C'est le cœur de l'application où se trouvent les entités, les services métiers, les interfaces des répositories et les objets de valeur.

- **entities/** : Contient les entités de domaine.
- **repositories/** : Contient les interfaces des répositories.
- **services/** : Contient les services métiers spécifiques au domaine.
- **value-objects/** : Contient les objets de valeur utilisés dans le domaine.

## infrastructure/
Contient les interactions avec les systèmes externes. C'est ici que se trouvent les contrôleurs, les répositories implémentés, et les services infrastructurels.

- **controllers/** : Contient les contrôleurs REST ou GraphQL.
- **orm/** : Contient les entités et configurations spécifiques à l'ORM utilisé (par exemple, TypeORM, Mongoose, etc.).
- **repositories/** : Contient les implémentations concrètes des répositories.
- **services/** : Contient les services qui interagissent avec des systèmes externes (comme les services de messagerie, les APIs externes, etc.).

## config/
Contient les fichiers de configuration de l'application.

- **configuration.ts** : Contient la configuration centralisée de l'application (par exemple, les variables d'environnement, les configurations de base de données, etc.).

## shared/
Contient le code partagé et les utilitaires communs à plusieurs parties de l'application.

- **utils/** : Contient les fonctions utilitaires.
- **decorators/** : Contient les décorateurs customisés.

## app.module.ts
Le module racine de l'application NestJS.

## main.ts
Le point d'entrée principal de l'application NestJS.
