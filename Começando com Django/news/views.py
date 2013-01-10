from django.shortcuts import render_to_response
from news.models import News
 
def index(request):
  return render_to_response('news/index.html',{
    'news': News.objects.all().order_by('-publication_date')
  })
 