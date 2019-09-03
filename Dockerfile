FROM jupyter/all-spark-notebook:2ce7c06a61a1

USER root
RUN apt update
RUN apt install --yes git

USER $NB_USER


# Copy the current directory contents into the container at /srv/jupyterhub

# Change directory to /opt/conda and install jupyterlab
# Install the additional lab extensions
RUN pip install --upgrade pip
RUN pip install mysql.connector
RUN pip install textblob
RUN pip install --upgrade nuclio-jupyter
RUN pip install nbgitpuller
RUN jupyter serverextension enable --py nbgitpuller --sys-prefix
RUN jupyter labextension install @krassowski/jupyterlab_go_to_definition
RUN jupyter labextension install @jupyterlab/git
RUN pip install --upgrade jupyterlab-git
RUN jupyter serverextension enable --py jupyterlab_git
RUN jupyter labextension install jupyterlab-drawio
RUN jupyter labextension install @jupyterlab/toc
RUN jupyter labextension install @jupyterlab/celltags
RUN pip install jupyterlab_sql
RUN jupyter serverextension enable jupyterlab_sql --py --sys-prefix
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
opencv-python==4.1.0.25 \
geopy==1.20.0 \
pyAudioAnalysis==0.2.5 \ 
localization==0.1.7 \
openALPR==1.0.12 \
Pillow==6.1.0 \
imageai==2.1.4 \
SpaCy==2.1.8 \
tensorflow==1.14.0 \
liblinear==2.11.2 \
statsmodels==0.10.1 \ 
scikit-learn==0.21.3 \
fuzzywuzzy==0.17.0 \
seaborn==0.9.0 \
Dash==1.2.0 \
scrapy==1.7.3 \ 
selenium==3.141.0 \ 
sphinx==2.2.0 \ 
virtualenv2==0.0.1 \ 
joblib==0.13.2 \
NumPy==1.17.1 \
SciPy==1.3.1 \
pandas==0.25.1 \ 
flask==1.1.1 \
psutil==5.6.3 \
pyinstaller==3.5 \ 
wave==0.0.2 \
filterpy==1.4.5 \ 
Datetime==4.3 \
glob2==0.7 \
argparse==1.4.0 \ 
twilio==6.29.4 \
playsound==1.2.2 \ 
Numba==0.45.1 \
django==2.2.4 \
openpyxl==2.6.3 \
imutils==0.5.3 \
thrift==0.11.0 \
scikit-image==0.15.0 \ 
theano==1.0.4 \
librosa==0.7.0 
	
ENV NBGITPULLER_APP lab






