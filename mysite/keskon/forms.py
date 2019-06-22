from django import forms

from .models import MealIdea, IdeaDay

class MealIdeaForm(forms.ModelForm):
    mealIdeaName = forms.CharField(widget=forms.TextInput(
        attrs={
            'class': 'form-control',
            'placeholder': 'Ex: Gratin de pâtes',
        }
    ))
    mealIdeaDescription = forms.CharField(widget=forms.TextInput(
        attrs={
            'class': 'form-control',
            'placeholder': 'Ex: Gratin de pâtes sans pâtes ni gratin',
        }
    ))
    mealIdeaCategory = forms.ChoiceField(choices=(
                                                  ('meat','Viande'), 
                                                  ('fish','Poisson'),
                                                  ('vegetable','Légume'),
                                                  ('starchy','Féculent'),
                                                  ('dough','Pâte'),
                                                  ('dessert','Dessert')
                                                  ))
    mealIdeaSteps = forms.CharField(widget=forms.Textarea)
    mealIdeaImage = forms.ImageField(required=False)

    class Meta:
        model = MealIdea
        fields = ('mealIdeaName',
                  'mealIdeaDescription',
                  'mealIdeaCategory',
                  'mealIdeaSteps',
                  'mealIdeaImage',
                  )


class IdeaDayForm(forms.ModelForm):
    day = forms.ChoiceField(choices=(
                                    ('lundi','Lundi'), 
                                    ('mardi','Mardi'),
                                    ('mercredi','Mercredi'),
                                    ('jeudi','Jeudi'),
                                    ('vendredi','Vendredi'),
                                    ('samedi','Samedi'),
                                    ('diamanche','Dimanche')
                                    ))
    momentDay = forms.ChoiceField(choices=(
                                    ('midi','Midi'), 
                                    ('soir','Soir'),
                                    ))
    typeMeal = forms.ChoiceField(choices=(
                                    ('entree','Entrée'), 
                                    ('plat','Plat'),
                                    ('dessert','Dessert'),
                                    ))

    class Meta:
        model = IdeaDay
        fields = ('day',
                  'momentDay',
                  'typeMeal',
                  )