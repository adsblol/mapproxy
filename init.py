import logging
from os import environ

if environ.get("DEBUG"):
    logging.getLogger().setLevel(logging.DEBUG)
    logging.getLogger("mapproxy.source.request").setLevel(logging.DEBUG)
    logging.getLogger("mapproxy.cache.tile").setLevel(logging.DEBUG)
    logging.getLogger("mapproxy.source.tile").setLevel(logging.DEBUG)

from mapproxy.wsgiapp import make_wsgi_app

application = make_wsgi_app("/app/mapproxy.yaml")
