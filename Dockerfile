FROM s3it/jupyter-with-spark:rc3
MAINTAINER riccardo.murri@uzh.ch


## defaults
#
# NB: these should match the equivalent settings in
# s3it/jupyter-with-spark Is there a way to import environment
# variables settings from a Docker image we depend upon?
#
ENV JUPYTER_NOTEBOOK_PORT 8888
ENV SPARK_WEBUI_PORT 4040


## checkout the course repository
WORKDIR /home/jupyter
RUN git clone https://github.com/rokroskar/spark_workshop.git


## run the notebook and expose the web port
EXPOSE ${JUPYTER_NOTEBOOK_PORT} ${SPARK_WEBUI_PORT}
WORKDIR spark_workshop
CMD ["python", "-m", "notebook", \
    "--ip=0.0.0.0", "--port=8888", "--no-browser", \
    "--notebook-dir=/home/jupyter/spark_workshop/notebooks"]
