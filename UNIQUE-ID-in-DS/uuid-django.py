import uuid
from django.db import models

class Contact(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    created_at = models.DateTimeField(auto_now_add=True)

class Lead(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    contact = models.ForeignKey(Contact, on_delete=models.CASCADE)
    opportunity = models.CharField(max_length=255)
    status = models.CharField(max_length=50)
    created_at = models.DateTimeField(auto_now_add=True)

# in this example uses Django's built-in UUIDField to generate unique IDs
# automatically when a new Contact or Lead is created.

# security :
# Apply rate limiting to avoid abuse of the API endpoints generating IDs.
# Ensure that the ID generator does not expose sensitive information or is vulnerable to timing attacks.