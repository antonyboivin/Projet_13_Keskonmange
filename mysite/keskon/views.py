import random

from django.shortcuts import render, get_object_or_404
from django.urls import reverse
from django.http import HttpResponseRedirect
from django.core.paginator import Paginator

from .forms import MealIdeaForm, IdeaDayForm
from .models import MealIdea, IdeaDay


def home(request):
    """
        Display home page with random idea
    """
    random_idea = random.choice(MealIdea.objects.all())
    context = {
        'total_mealIdeaLikes': random_idea.total_mealIdeaLikes(),
        'random_idea': random_idea
    }
    return render(request, 'keskon/home.html', context)


def legal_notice(request):
    """
        Display legal notice page
    """
    return render(request, 'legal_notice.html')


def my_account(request):
    """
        Display the user account page
    """
    if request.user.is_authenticated:
        return render(request, 'keskon/my_account.html')
    else:
        return render(request, 'keskon/home.html')


def display_all_idea(request):
    """
        Display all user's ideas
    """
    list_idea = MealIdea.objects.all()
    # Pagination
    paginator = Paginator(list_idea, 9)
    page = request.GET.get('page')
    list_idea = paginator.get_page(page)
    context = {
        'paginator': paginator,
        'list_idea' : list_idea
        }

    return render(request, 'keskon/display_all_idea.html', context)


def display_categories(request):
    """
        Display all the categories for ideas
    """
    list_cat = {
        'meat': 'meat',
        'fish': 'fish',
        'vegetable': 'vegetable',
        'starchy': 'starchy',
        'dough': 'dough',
        'dessert': 'dessert',
    }
    return render(request, 'keskon/display_categories.html', {'list_cat': list_cat})


def display_by_category(request, cat):
    """
        Display ideas by category
    """
    list_idea = MealIdea.objects.filter(mealIdeaCategory=cat)
    if cat == "meat":
        cat = "viande"
    elif cat == "fish":
        cat = "poisson"
    elif cat == "vegetable":
        cat = "légume"
    elif cat == "starchy":
        cat = "féculent"
    elif cat == "dough":
        cat = "pâte"
    else:
        cat = "dessert"
    # Pagination
    paginator = Paginator(list_idea, 9)
    page = request.GET.get('page')
    list_idea = paginator.get_page(page)

    context = {
        'paginator': paginator,
        'list_idea' : list_idea,
        'categorie' : cat
        }
    return render(request, 'keskon/display_by_category.html', context)


def add_idea(request):
    """
        Display form for add a new idea
    """
    if request.user.is_authenticated:
        if request.method == 'POST':
            form = MealIdeaForm(request.POST, request.FILES)
            # check whether it's valid:
            if form.is_valid():
                mealIdea = form.save(commit=False)
                mealIdea.mealIdeaPublisher = request.user
                mealIdea.save()

                return HttpResponseRedirect(reverse('home'))

        # if a GET (or any other method) we'll create a blank form
        else:
            form = MealIdeaForm()

        return render(request, 'keskon/form_add_idea.html', {'form': form})
    else:
        return render(request, 'keskon/home.html')


def edit_idea(request, id):
    """
        Display form for edit an idea
    """
    idea = get_object_or_404(MealIdea, id=id)
    if request.method == 'POST':
        form = MealIdeaForm(request.POST, request.FILES, instance=idea)
        if form.is_valid():
            mealIdea = form.save(commit=False)
            mealIdea.mealIdeaPublisher = request.user
            mealIdea.save()
            context = {
                'id': id,
            }

            return HttpResponseRedirect(reverse('detail_idea', args=[id]))

    form = MealIdeaForm(instance=idea)
    return render(request, 'keskon/edit_idea.html', {'form': form})


def delete_idea(request, id):
    """
        Display form for delete an idea
    """
    idea = get_object_or_404(MealIdea, id=id)
    idea.delete()

    return HttpResponseRedirect(reverse('home'))


def likes_idea(request):
    """
        Like / unlike system
    """
    idea = get_object_or_404(MealIdea, id=request.POST.get('idea.id'))
    is_liked = False
    if idea.mealIdeaLikes.filter(id=request.user.id).exists():
        idea.mealIdeaLikes.remove(request.user.id)
        is_liked = False
    else:
        idea.mealIdeaLikes.add(request.user)
        is_liked = True
    return HttpResponseRedirect(reverse('detail_idea', args=[idea.id]))


def week_menu(request):
    """
        Display the week menu page
    """
    list_ideaday = IdeaDay.objects.filter(ideaDayUser=request.user.id)
    return render(request, 'keskon/week_menu.html', {'list_ideaday': list_ideaday})


def delete_week_idea(request, id):
    """
        Delete an user's idea of the week menu
    """
    week_idea = get_object_or_404(IdeaDay, id=id)
    week_idea.delete()
    list_ideaday = IdeaDay.objects.filter(ideaDayUser=request.user.id)
    return render(request, 'keskon/week_menu.html', {'list_ideaday': list_ideaday})


def del_all_week_idea(request):
    """
        Delete all user's week menu
    """
    list_ideaday = IdeaDay.objects.filter(ideaDayUser=request.user.id)
    list_ideaday.delete()
    return render(request, 'keskon/week_menu.html', {'list_ideaday': list_ideaday})


def detail_idea(request, id):
    """
        Display the detail of an idea
    """
    idea = get_object_or_404(MealIdea, id=id)
    is_liked = False
    if idea.mealIdeaLikes.filter(id=request.user.id).exists():
        is_liked = True

    if request.user.is_authenticated:
        if request.method == 'POST':
            form = IdeaDayForm(request.POST, request.FILES)
            # check whether it's valid:
            if form.is_valid():
                ideaday = form.save(commit=False)
                ideaday.mealId = get_object_or_404(MealIdea, id=id)
                ideaday.ideaDayUser = request.user
                ideaday.save()

                list_ideaday = IdeaDay.objects.filter(ideaDayUser=request.user.id)

                if 'week_menu' in request.POST:
                    return render(request, 'keskon/week_menu.html', {'list_ideaday': list_ideaday})
                elif 'display_categories' in request.POST:
                    return HttpResponseRedirect(reverse('display_categories'))
                else:
                    return HttpResponseRedirect(reverse('display_all_idea'))

        # if a GET (or any other method) we'll create a blank form
        else:
            form = IdeaDayForm()
        context = {
            'idea': idea,
            'is_liked': is_liked,
            'total_mealIdeaLikes': idea.total_mealIdeaLikes(),
            'form' : form
        }

        return render(request, 'keskon/detail_idea.html', context)
    else:
        return render(request, 'keskon/home.html')
