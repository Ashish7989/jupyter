FROM jupyter/all-spark-notebook:2ce7c06a61a1

USER root
COPY requirements.txt /srv/jupyter
RUN apt update 
RUN apt install --yes git
	

RUN pip install mysql.connector
RUN pip install --upgrade pip
RUN pip install nbgitpuller 
RUN pip install --upgrade nuclio-jupyter 
RUN pip install textblob
RUN jupyter labextension install @krassowski/jupyterlab_go_to_definition
RUN jupyter serverextension enable --py nbgitpuller --sys-prefix 
RUN jupyter labextension install @jupyterlab/git  
RUN pip install --upgrade jupyterlab-git 
RUN jupyter serverextension enable --py jupyterlab_git
RUN jupyter labextension install jupyterlab-drawio
RUN jupyter labextension install @jupyterlab/toc
RUN jupyter labextension install jupyterlab_voyager
RUN jupyter labextension install @jupyterlab/celltags
RUN pip install jupyterlab_sql
RUN jupyter serverextension enable jupyterlab_sql --py --sys-prefix
RUN pip install bqplot
RUN jupyter nbextension enable --py --sys-prefix bqplot
RUN jupyter labextension install @lckr/jupyterlab_variableinspector
RUN pip install --no-cache-dir papermill==1.0.1 \
nuclio==0.1.0 \
pykafka==2.8.0 \
pydruid==0.5.6 \
pyhive==0.6.1 \
pyhdfs==0.2.2 \
pymongo==3.9.0 \
PyMysql==0.9.3 \
pyforest==0.1.1 \
plotly==4.1.0 \
bokeh==1.3.4 \
flask==1.1.1 \
jupyterlab-sql==0.3.0 \
SQLAlchemy==1.3.8 \
mysql-connector==2.2.9 \
py_mysql_connector==0.1 \


	
ENV NBGITPULLER_APP lab






