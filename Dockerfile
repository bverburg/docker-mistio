FROM ubuntu:latest
MAINTAINER roli keusch  <mail@keus.ch>

# Update Ubuntu to the latest
RUN apt-get update
RUN apt-get dist-upgrade -y

# Install needed Softwares
RUN apt-get install -y wget curl python-dev build-essential git python-pip python-setuptools && \
useradd -ms /bin/bash mist && \
git clone https://github.com/mistio/mist.io.git /opt/mistio && \
cd /opt/mistio

WORKDIR /opt/mistio
USER mist
RUN /usr/bin/pip install setuptools --upgrade && \
/usr/bin/pip install pyvmomi && \
/usr/bin/python bootstrap.py && \
/opt/mistio/bin/buildout -v 
USER root
apt-get autoremove && apt-get autoclean

# Expose port 
EXPOSE 6543 

# Additional Files
ADD ./mistio-run.sh /mistio-run.sh
RUN chmod 755 /mistio-run.sh
ADD ./settings.py /opt/mistio/

# Start Mist.io
CMD ["/bin/bash", "/mistio-run.sh"]
