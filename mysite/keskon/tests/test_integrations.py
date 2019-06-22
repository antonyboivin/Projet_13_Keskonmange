from django.contrib.auth.models import User
from django.contrib import auth
from django.urls import reverse
from django.test import TestCase

from ..models import MealIdea, IdeaDay



# At first, I check that all pages of the application are functional.
class StatusCodePages(TestCase):
    """
        Class StatusCodePages ensures that all templates return a status code 200.
    """


    def test_home_page(self):
        user = User.objects.create(username='usertest', password='usertest')
        MealIdea.objects.create(
            id= 1,
            mealIdeaName= 'test',
            mealIdeaDescription= 'test',
            mealIdeaCategory= 'test',
            mealIdeaPublisher= user,
            mealIdeaSteps= 'test',
            mealIdeaImage= 'test'
        )
        response = self.client.get(reverse('home'))
        self.assertEqual(response.status_code, 200)


    def test_legal_notice_page(self):
        response = self.client.get(reverse('legal_notice'))
        self.assertEqual(response.status_code, 200)


    def test_my_account_page(self):
        logged = self.client.login(username='usertest', password='usertest')
        if logged:
            response = self.client.get(reverse('my_account'))
            self.assertEqual(response.status_code, 200)
            self.client.logout()


    def test_display_all_idea_page(self):
        response = self.client.get(reverse('display_all_idea'))
        self.assertEqual(response.status_code, 200)


    def test_display_by_category_page(self):
        response = self.client.get(reverse('display_by_category', kwargs={'cat': 'viande'}))
        self.assertEqual(response.status_code, 200)


    def test_ddisplay_categories_page(self):
        list_cat = {
        'meat': 'meat',
        'fish': 'fish',
        'vegetable': 'vegetable',
        'starchy': 'starchy',
        'dough': 'dough',
        'dessert': 'dessert',
    }
        response = self.client.get(reverse('display_categories'))
        self.assertEqual(response.status_code, 200)


    def test_detail_idea_page(self):
        user = User.objects.create(username='usertest', password='usertest')
        logged = self.client.login(username='usertest', password='usertest')
        if logged:
            MealIdea.objects.create(
                id= 3,
                mealIdeaName= 'test',
                mealIdeaDescription= 'test',
                mealIdeaCategory= 'test',
                mealIdeaPublisher= user,
                #mealIdeaLikes.set(),
                mealIdeaSteps= 'test',
                mealIdeaImage= 'test'
            )
            response = self.client.get('/detail_idea/?id=3')
            self.assertEqual(response.status_code, 200)
             
    def test_add_idea_page(self):
        user = User.objects.create(username='usertest', password='usertest')
        logged = self.client.login(username='usertest', password='usertest')
        if logged:
            response = self.client.get(reverse('add_idea'))
            self.assertEqual(response.status_code, 200)


    def test_edit_idea_page(self):
        user = User.objects.create(username='usertest', password='usertest')
        MealIdea.objects.create(
            id= 2,
            mealIdeaName= 'test',
            mealIdeaDescription= 'test',
            mealIdeaCategory= 'test',
            mealIdeaPublisher= user,
            #mealIdeaLikes.set(),
            mealIdeaSteps= 'test',
            mealIdeaImage= 'test'
        )
        response = self.client.get(reverse('edit_idea', kwargs={'id': 2}))
        self.assertEqual(response.status_code, 200)


    def test_delete_idea_page(self):
        user = User.objects.create(username='usertest', password='usertest')
        MealIdea.objects.create(
            id= 3,
            mealIdeaName= 'test',
            mealIdeaDescription= 'test',
            mealIdeaCategory= 'test',
            mealIdeaPublisher= user,
            mealIdeaSteps= 'test',
            mealIdeaImage= 'test'
        )
        response = self.client.get(reverse('delete_idea', kwargs={'id': 3}))
        self.assertEqual(response.status_code, 302)


    def test_likes_idea_page(self):
        user = User.objects.create(username='usertest', password='usertest')
        logged = self.client.login(username='usertest', password='usertest')
        if logged:
            response = self.client.get(reverse('likes_idea'))
            self.assertEqual(response.status_code, 200)


    def test_week_menu_page(self):
        response = self.client.get(reverse('week_menu'))
        self.assertEqual(response.status_code, 200)


    def test_delete_week_idea_page(self):
        user = User.objects.create(username='usertest', password='usertest')
        mealidea= MealIdea.objects.create(
            mealIdeaName= 'test',
            mealIdeaDescription= 'test',
            mealIdeaCategory= 'test',
            mealIdeaPublisher= user,
            mealIdeaSteps= 'test',
            mealIdeaImage= 'test'
        )
        ideaday = IdeaDay.objects.create(
            mealId = mealidea,
            ideaDayUser = user,
            day= 'lundi',
            momentDay= 'midi', 
            typeMeal ='Dessert')
        response = self.client.get(reverse('delete_week_idea', kwargs={'id': 1}))
        self.assertEqual(response.status_code, 200)


    def test_del_all_week_idea_page(self):
        response = self.client.get(reverse('del_all_week_idea'))
        self.assertEqual(response.status_code, 200)
