# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.gis.db import models as gis_models
from django.db import models
from geopy.geocoders import Bing
from geopy.geocoders.bing import GeocoderServiceError
from urllib2 import URLError
from django.contrib.gis import geos


class Heatmap(models.Model):
    location = gis_models.PointField(u"longitude/latitude",
                                     geography=True, blank=True, null=True)

    def __unicode__(self):
        return self.location

    def save(self, **kwargs):
        