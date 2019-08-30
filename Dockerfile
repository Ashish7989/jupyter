FROM jupyter/all-spark-notebook:2ce7c06a61a1

USER root
COPY requirements.txt /srv/jupyter
RUN apt update 
RUN apt install --yes git
RUN python -m pip install --upgrade pip setuptools wheel
	


RUN pip install --upgrade pip
RUN pip install bqplot
RUN jupyter nbextension enable --py --sys-prefix bqplot

RUN pip install --no-cache-dir nltk==3.4.5 




	
ENV NBGITPULLER_APP lab






