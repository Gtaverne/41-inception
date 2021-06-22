FROM debian:buster

RUN apt-get update && apt-get install -y\
	python3-pip \
	python3-dev \
	dumb-init

RUN pip3 install --upgrade pip
RUN pip3 install virtualenv

RUN mkdir ~/nb
RUN cd ~/nb
RUN echo "We are here" ; pwd
# RUN virtualenv envpython
# RUN source envpython/bin/activate


RUN pip3 install jupyter
# RUN jupyter notebook

EXPOSE 8888

#ENTRYPOINT ["dumb-init", "--"]

ENTRYPOINT ["jupyter", "notebook", "--ip 0.0.0.0", "--no-browser", "--allow-root"]