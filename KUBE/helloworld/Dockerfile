# python runtime as parent image
FROM python:3.8-slim-buster

# set env variables
ENV PYTHONUNBUFFERED 1

# set work directory
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt /app/

# install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# copy project
COPY . .

# give django.sh execute permissions
RUN chmod +x /app/django.sh

# expose port 8000
EXPOSE 8000

# command to run my application
ENTRYPOINT [ "/app/django.sh" ]
