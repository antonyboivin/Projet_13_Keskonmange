Projet Final DA Python - Keskonmange ??!

This project is the final project of Openclassromm's Python App Developer Training:  
"What could we eat tonight?" or "I need 3 meal ideas to order the races next week ...". It is to answer these questions of the week that I decided to think of a solution to facilitate this exercise and sometimes avoid some that is to eat too often the same type of food.

## Prerequisites
You need to have install docker engine.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.


### Installing

A step by step series of examples that tell you have to get a development env running

Clone the repository : https://github.com/antonyboivin/Projet_13_Keskonmange

You can use an virtual environment like virtualenv

Install all the necessary packages :
```
pip install -r requirements.txt
```
From now on you can use the Docker-compose commands:  

```
# Build the container
docker-compose build
# Collect the statics files
docker-compose run djangoapp mysite/manage.py collectstatic --no-input
# Migrate database
docker-compose run --rm djangoapp /bin/bash -c "cd mysite; ./manage.py migrate"
# Create a super user
docker-compose run --rm djangoapp mysite/manage.py createsuperuser
# Run the containers
docker-compose up -d
```  
The site is then searchable from the browser with the URL:
```
# First log with your superuser account
http://localhost/login/
# Go to the account page to create your first meal idea
http://localhost/my_account/
```

## Deployment

The application is deployed at : http://www.keskonmangeproject.fr

## Authors

* **Antony Boivin** - *Initial work* 