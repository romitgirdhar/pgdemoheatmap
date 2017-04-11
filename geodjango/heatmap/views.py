# -*- coding: utf-8 -*-
from __future__ import unicode_literals
 
from urllib2 import URLError
from django.http import HttpResponse
from django.contrib.gis import geos
from django.contrib.gis import measure
from django.shortcuts import render
from django.template import RequestContext
from django.core import serializers
from geopy.geocoders import Bing
from geopy.geocoders.bing import GeocoderServiceError
from datetime import datetime
from django.shortcuts import render
from heatmap.models import Heatmap
from random import randint
from django.views.decorators.csrf import csrf_exempt
import json
       
# CityName | Weight | Lat | Lng
CityList = [ {'city': 'Seattle', 'weight': '0', 'lat': '47.620422', 'long': '-122.349358'}
            ,{'city': 'Redmond', 'weight': '1', 'lat':  '22.1', 'long': '-122.0212'}
            ,{'city': 'New York', 'weight': '2', 'lat': '22.2', 'long': '-122.0212'}
            ,{'city': 'Chicago', 'weight': '3', 'lat': '22.333', 'long':'-122.0212'}
        ]
 
# Create your views here.
@csrf_exempt
def home(request):
    if request.method == "POST":
        print('Save called')
 
        randomCity = randint(0, len(CityList)-1)
        randomCity = CityList[randomCity]
        cityName = randomCity['city']
        lat = randomCity['lat']
        lng = randomCity['long']
        point = "POINT(%s %s)" % (lng, lat)
        loc = geos.fromstr(point)
       
        newHeatmap = Heatmap.objects.create(location=loc)
        newHeatmap.save()
        print('lat: ', lat, ' and long: ', lng)
        heatmappoint = {'lat': lat, 'long': lng}
        return HttpResponse(json.dumps(heatmappoint), content_type='application/json')
    
    return render(request,
        'home.html')