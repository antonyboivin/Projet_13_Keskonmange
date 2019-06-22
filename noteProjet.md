# Note de projet

## Initial commit
Création du projet, installation de Django.
```
pip install django
```

## Initialisation de l'application "accounts"
Cette application va gérer toute la partie authentification du projet.
```
django-admin startapp accounts
```

Ajout de l'app accounts dans le `installed_app` dans le fichier `settings.py`.

## Création de la vue
`mysite/urls.py`
```python
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('accounts.urls')),
]
```

### creation du fichier `accounts/urls.py`
```python
from django.urls import path

from . import views

urlpatterns = [
    path('accounts/', views.signup, name='signup')
]
```

### creation du fichier 'accounts/views.py'
```python
from django.shortcuts import render

def signup(request):
    return render(request, 'signup.html')
```

### création de la page 'accounts/templates/signup.html'
Afin de faire un premier test grandeur nature et verifier manuelement que tous fonctionne.

## Mise en place du gitFlow avec Gitkraken
Création de la branche develop qui correspondra à la recette.
Toutes les fonctionnalités développées à partir de maintenant, seront développées sur la branche feature.

## Ecriture des premiers tests `accounts/tests/tests.py`
```python
from django.urls import reverse, resolve
from django.test import TestCase
from ..views import signup


class SignUpTests(TestCase):
    def test_signup_status_code(self):
        url = reverse('signup')
        response = self.client.get(url)
        self.assertEquals(response.status_code, 200)
    
    def test_signup_url_resolves_signup_view(self):
        view = resolve('/accounts/')
        self.assertEquals(view.func, signup)
```

Commande pour lancer les tests :
```
python manage.py test
```

## Modification de `settings.py`
TEMPLATES_DIRS
STATICFILES_DIRS

# Ajout de bootstrap et création de dossier
static/ et templates/
Création de base.html

# Ajout formulaire sur signup.html

# Ajout de 'django-widget-tweaks'
```
pip install django-widget-tweaks
```
Ajout dans INSTALLED_APPS.

# Migration initiale
```
python manage.py migrate
```

# Création du superuser

# Ajout du formulaire de connexion

# test connexion

# Dockerisation de l'application
Ajout du Dockerfile et de docker-compose.yml.

# Création d'un droplet sur digital Ocean  Docker.
Ajout connection ssh sans passphrase pour faciliter la connection automatique avec gitlab-CI.

# Configuration de gitlab-ci
+ création d'un jeu de clés sur le serveur
+ copie de la clé publique du serveur dans gitlab-ci : deploy key

# ajout de la configuration docker
Configuration de nginx, gunicorn modification du Dockerfile et docker-compose.yml
Ajout du dossier de configuration.

## Initialisation de l'application "keskon"
Cette application va gérer toute la partie authentification du projet.
```
django-admin startapp keskon
```

Ajout de l'app accounts dans le `installed_app` dans le fichier `settings.py`.

# Création de la vue
```python
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('accounts.urls')),
    path('', include('keskon.urls')),
]
```

### creation du fichier `keskon/urls.py`
```python
from django.urls import path

from . import views

urlpatterns = [
    path('home_keskon/', views.signup, name='home_keskon')
]
```

### creation du fichier 'keskon/views.py'
```python
from django.shortcuts import render

def signup(request):
    return render(request, 'signup.html')
```

# Ajout des models

# Création du formulaire pour renseigner les données des idées repas
utilisation de bootstrap pour l'affichage.
Création d'un fichier form.py qui contient un modelForm pour lier la classe du model au form.
Codage de la vue pour permettre a Django re rendre la vue.

# Création de la page account

# Création de la page Tout voir
Page affichant toutes les idées repas de la base de données, tout utilisateur.

# Ajout d'un système de like / unlike

# Affichage par catégorie

# Modification de la base de données sqlite -> postgresql
modification du settings.py
build + migration + collecte des fichiers statics
```
docker-compose build
docker-compose run --rm djangoapp /bin/bash -c "cd mysite; ./manage.py migrate"
```
# Ajout U -> CRUD

# Ajout du D -> CRUD

# Mise à jour de la vue 'detail_idea'

# Ajout de la page week_menu

# Random de la page d'accueil

# Ajout d'une pagination

# Amélioration de l'UX navigation pour l'ajout d'idée dans le menus de la semaine

# Amelioration display_by_category
paginaton
ajout titre avec categorie dans le titre

# Amélioration UX detail_idea

# Ajout truncate pour le titre des nom d'idée trop long



# formulaire de contact

# Modification de mot de passe

# Reset password

# Acceptation des cookies

# Mentions légales

# Mise en mode private repo gitlab
Mise en place de token de deploiement.

# deploy
Résolution de problème avec les fichier media stocker dans les volume et donc non pushable par défault.
Résolution des problèmes avec posgrsql pour mettre à jour la bd et effectuer des suvegarde.
    + backup
    + restaure







# DIFFICULTÉ : static files
Gros soucis avec la collect static des fichier because of the caching mechanisms of Docker.
problème resolu avec la commande après suppresiion dans le Dockerfile :
```
docker-compose run djangoapp mysite/manage.py collectstatic --no-input
```

# TODO :

+ Mon compte / changer mot de passe / reset mot de passe
+ Page mentions légales
+ Gestion pages 400 et 500


+ Sécurité - contôle dans le code - TESTS

+ Lettre d'intention
+ Les bonnes bonnes pratiques de l'extreme Programming



-----------------------------------
+ base.html => ajouter les liens pour:
    + changer de mot de passe



# Droit auteur

+ liste repas : https://thenounproject.com/search/?q=food&i=984189
+ add meal : https://thenounproject.com/search/?q=add%20recipe&i=1001670
+ trash : https://thenounproject.com/search/?q=trash&i=314617

## photos site https://pikwizard.com
+ page catégorie
    + viande = https://pikwizard.com/photo/abstract-barbecue-barbeque-bbq/c2e88b4627e541c0c8014dccd631fdfb


# process Docker

docker-compose build
docker-compose run djangoapp mysite/manage.py collectstatic --no-input
    docker-compose run --rm djangoapp /bin/bash -c "cd mysite; ./manage.py makemigrations"
docker-compose run --rm djangoapp /bin/bash -c "cd mysite; ./manage.py migrate"
docker-compose run --rm djangoapp mysite/manage.py createsuperuser
docker-compose up -d



# Export database
docker exec -t projet13_database1_1 pg_dumpall -c -U database1_role > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql

# recuperer les medias du container en prod ves dossier sauv
docker cp projet13_nginx_1:/opt/services/djangoapp/media/media media


# insert manuel database
root@docker-p13:~/projet13# docker exec -it projet13_database1_1 bash
root@05232b57f770:/# psql -U database1_role -d database1
CREATE USER postgres SUPERUSER;
psql -U postgres -c "drop database database1"
docker cp ./dump_16-06-2019_00_03_13.sql projet13_database1_1:/
psql -U postgres -d postgres -a -f /dump_16-06-2019_00_03_13.sql

# copier vers le container
docker cp media/ projet13_nginx_1:/opt/services/djangoapp/media/

# push depuis le serveur
git push https://BoivinAntony:<MdP>@gitlab.com/boivinantony/projet13.git feature/deploy


# Wording

## gratin de pâte
- Faire cuire des pâtes
- Mélanger :
    . pâtes
    . gruyère
    . dés de jambon
- Ajouter une tranche de fromage à raclette
- Mettre au four

## Tarte au thon
- Faire cuire la pâte
- Couper les tomates en rondelle
- Faire cuire 20 min
- Ajouter la pulpe de tomate, le thon et les rondelles de tomate
- Assaisonner
- Enfourner 15 min à 200°


# non fonctionnel

docker-compose run --rm djangoapp /bin/bash -c "cd mysite; ./manage.py test"