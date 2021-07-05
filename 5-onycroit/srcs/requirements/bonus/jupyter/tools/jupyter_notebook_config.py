# get the config object
c = get_config()
# JupyterHub listen address

c.NotebookApp.token = ''
c.NotebookApp.allow_root = True
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.port = 8888
c.NotebookApp.allow_origin = '*'
c.NotebookApp.open_browser = False
#c.NotebookApp.password = 'jupyter'
#c.NotebookApp.base_url = '/myjupi/'