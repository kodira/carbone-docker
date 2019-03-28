FROM node:8

WORKDIR /tmp
RUN wget https://ftp.igh.cnrs.fr/pub/tdf/libreoffice/_testing_/5.4.7/deb/x86_64/LibreOffice_5.4.7.2_Linux_x86-64_deb.tar.gz -O libo.tar.gz
RUN apt update \
  && apt install -y libxinerama1 libfontconfig1 libdbus-glib-1-2 libcairo2 libcups2 libglu1-mesa libsm6 unzip \
  && tar -zxvf libo.tar.gz
WORKDIR LibreOffice_5.4.7.2_Linux_x86-64_deb/DEBS
RUN dpkg -i *.deb

RUN mkdir /tmp-reports
COPY . /carbone-api
WORKDIR /carbone-api
RUN yarn
CMD node index