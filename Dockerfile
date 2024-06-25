FROM python:3.12.4-alpine3.20
LABEL  mantainer="dev@thecamel.uk"

# This environment variable is used to control whether Python should
# write bytecode files (.pyc) to disk. 1 = No, 0 = Yes
ENV PYTHONDONTWRITEBYTECODE 1

# Ensures that Python output is immediately flushed to the console or 
# other output devices, without being buffered.
# In short, you will see Python outputs in real time.
ENV PYTHONUNBUFFERED 1

# Copies the "djangoapp" and "scripts" folders into the container.
COPY djangoapp /djangoapp
COPY scripts /scripts

# Sets the working directory to the "djangoapp" folder in the container.
WORKDIR /djangoapp

# Makes port 8000 available for external connections to the container.
# This is the port we will use for Django.
EXPOSE 8000

# RUN executes commands in a shell within the container to build the image.
# The result of the command execution is stored in the image's filesystem
# as a new layer.
# Grouping commands into a single RUN can reduce the number of image layers
# and make it more efficient.

RUN python -m venv /venv && \
  /venv/bin/pip install --upgrade pip && \
  /venv/bin/pip install -r /djangoapp/requirements.txt && \
  adduser --disabled-password --no-create-home duser && \
  mkdir -p /data/web/static && \
  mkdir -p /data/web/media && \
  chown -R duser:duser /venv && \
  chown -R duser:duser /data/web/static && \
  chown -R duser:duser /data/web/media && \
  chmod -R 755 /data/web/static && \
  chmod -R 755 /data/web/media && \
  chmod -R +x /scripts

# Adds the scripts folder and venv/bin 
# to the container's $PATH.
ENV PATH="/scripts:/venv/bin:$PATH"

# Switches to the user "duser".
USER duser

# Executes the scripts/commands.sh file.
CMD ["commands.sh"]
