FROM jupyter/all-spark-notebook:2ce7c06a61a1

USER root

RUN apt update 
RUN apt install --yes git
	
USER $NB_USER
RUN pip install --upgrade pip
RUN pip install mysql.connector
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
RUN pip install --no-cache-dir -r requirements.txt 
	
ENV NBGITPULLER_APP lab






