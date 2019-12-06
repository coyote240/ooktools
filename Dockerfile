FROM python:3.8-buster


RUN apt-get update
RUN apt-get install -y git python-pip

RUN git clone https://github.com/coyote240/rfcat.git
WORKDIR rfcat
RUN git checkout spike/2to3
RUN python setup.py install

RUN pip install pyusb libusb PySide2 future

WORKDIR ..
RUN git clone https://github.com/coyote240/ooktools.git
WORKDIR ooktools
RUN git checkout spike/dockerize
RUN python setup.py install

ENTRYPOINT ["ooktools", "--help"]
