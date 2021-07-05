echo "Launching jupyter"

jupyter notebook --allow-root --generate-config
[ -f /tmp/jupyter_notebook_config.py ] && mv /tmp/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

#jupyter notebook --no-browser --allow-root --ip 0.0.0.0

jupyter notebook