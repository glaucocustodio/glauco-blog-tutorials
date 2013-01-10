# -*- coding: utf-8 -*-

from django.db import models

class News(models.Model):
  title = models.CharField('Título', max_length=100)
  publication_date = models.DateTimeField('Data de publicação', auto_now_add=True)
  content = models.TextField('Conteúdo')

  class Meta:
    verbose_name = 'notícia'
    verbose_name_plural = 'notícias'

  def __unicode__(self):
    return self.title