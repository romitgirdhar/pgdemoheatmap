# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from urllib2 import URLError
from django.shortcuts import render
from datetime import datetime

def home(request):
      return render(request,
        'home.html')
