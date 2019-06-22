from django.db import models
from django.contrib.auth.models import User

class MealIdea(models.Model):
    mealIdeaName = models.CharField(max_length = 250)
    mealIdeaDescription = models.CharField(max_length = 250)
    mealIdeaCategory = models.CharField(max_length=20, choices=(('meat','Viande'),('fish','Poisson'),('vegetable','Légume'),('starchy','Féculent'),('dough','Pâte'),('dessert','Dessert')))
    mealIdeaPublisher = models.ForeignKey(User, on_delete=models.CASCADE)
    mealIdeaLikes = models.ManyToManyField(User, related_name='likes', blank=True)
    mealIdeaSteps = models.TextField(max_length = 5000)
    mealIdeaImage = models.ImageField(upload_to='media') #, default='media/image_nondispo.png'


    def total_mealIdeaLikes(self):
        return self.mealIdeaLikes.count()

    def __str__(self):
        return self.mealIdeaName + '-' + self.mealIdeaPublisher.username

class IdeaDay(models.Model):
    mealId = models.ForeignKey(MealIdea, on_delete=models.CASCADE)
    ideaDayUser = models.ForeignKey(User, on_delete=models.CASCADE)
    day = models.CharField(max_length=20, choices=(
                                ('lundi','Lundi'), 
                                ('mardi','Mardi'),
                                ('mercredi','Mercredi'),
                                ('jeudi','Jeudi'),
                                ('vendredi','Vendredi'),
                                ('samedi','Samedi'),
                                ('diamanche','Dimanche')
                                ))
    momentDay = models.CharField(max_length=20, choices=(
                                    ('midi','Midi'), 
                                    ('soir','Soir'),
                                    ))
    typeMeal = models.CharField(max_length=20, choices=(
                                    ('entree','Entrée'), 
                                    ('plat','Plat'),
                                    ('dessert','Dessert'),
                                    ))

