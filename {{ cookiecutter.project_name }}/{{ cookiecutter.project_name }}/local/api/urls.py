from django.conf.urls import include
from django.urls import path
from rest_framework import routers

from .views import AuthorViewSet, GenreViewSet

api_router = routers.SimpleRouter()
api_router.register(r"authors", AuthorViewSet, basename="author")
api_router.register(r"genres", GenreViewSet, basename="genre")

urlpatterns = [
    path(r"", include(api_router.urls)),
    # path('v1/openapi', get_schema_view(generator_class=SchemaGenerator, public=True),
    # name='openapi-schema'),
    # path('swagger-ui/', TemplateView.as_view(
    #    template_name='swagger-ui.html',
    #    extra_context={'schema_url': 'openapi-schema', 'title': 'LibraryAPI'}
    # ), name='swagger-ui'),
]
