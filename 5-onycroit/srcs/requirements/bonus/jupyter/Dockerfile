FROM debian:buster

RUN apt-get update && apt-get install -y\
	python3-pip \
	python3-dev \
	# nginx \
	virtualenv \
	dumb-init

RUN pip3 install --upgrade pip

RUN pip3 install notebook==5.7.4
EXPOSE 8888

COPY ./tools/jupyterstart.sh /tmp/jupyterstart.sh
COPY ./tools/jupyter_notebook_config.py /tmp/jupyter_notebook_config.py

ENTRYPOINT [ "/usr/bin/dumb-init" ]

CMD ["bash", "/tmp/jupyterstart.sh"]