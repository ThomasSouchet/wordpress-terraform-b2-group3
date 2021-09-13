# wordpress-terraform-b2-group3

## Contexte du projet

Il s'agit de créer un blog sous `Wordpress` avec une base de données pour publier des articles, les modifier, d'en rajouter et d'en supprimer. 
Le blog sera déployé sur une instance `instance EC2` avec une base de donnée `Mysql` déployée sur une `instance RDS` d'amazon `AWS`.
La configuration de cette infrastructure `AWS` sera gérée par l'outil `Terraform`.

### Infrastructure Terraform

Deployer une infrastructure avec `Terraform` avec:

- Une instance EC2
- Un VPC (Virtuel Private Cloud)
- Deux Subnets
- Une instance RDS
- Un `Backend S3` pour la gestion du state Terraform
- Un `Bucket S3` pour le déploiement du code wordpress via la fonctionalité `codedeploy`d'AWS
- Une application `codedeploy` et un deployment group `codedeploy`

### Sécurisation de l'infrastructure

L'infrastructure comporte deux `Security Groups`, un pour l'instance `EC2` et le second pour l'instance `RDS`. 

#### Security Group EC2 (cf security_group.tf)

Il ouvre l'accès à toutes les adresses IP entrantes:
- Le port 80 pour les requêtes HTTP 
- Le 22 pour les requêtes SSH

En sortie, il ouvre tous les ports pour toutes les adresses IP quelque soit le protocole.

#### Security Group RDS (cf security_group.tf)

Il ouvre l'accès à toutes les adresses IP entrantes:
- Le port 3306 pour la connexion à la DB 

En sortie, il ouvre tous les ports pour toutes les adresses IP quelque soit le protocole.

Les Security Group doivent être rattachés aux instances EC2 et RDS via le VPC.

### Rôles et Policies

Nous avons créé un `instance profile` auquel on associe un rôle iam b2-group3. A ce rôle on associe une policy qui va définir ses droits. 
Nous avons également créé un `codedeploy_deployment_group`qui va nous permettre de déployer notre application wordpress sur l'instance EC2 (cf s3_deploy.tf).
On associe à ce groupe le role `codedeploy_service` (cf roles.tf)
On associe également une policy à ce rôle  `codedeploy_service` pour déployer sur l'instance EC2






A revoir -> plus bas



- Une Route table et sa route table association
- Une internet Gateway
- Une Eip
- Deux Security Groups
- Les prividers `random`, `local`, `tls`
- 4 paramètres `ssm` pour le nom de la base, le username, le password ainsi que l'entrypoint
- Une clé de cryptage pour les paramètres `ssm`

