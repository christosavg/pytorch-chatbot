FROM anibali/pytorch:cuda-8.0
#FROM floydhub/pytorch
MAINTAINER Avgerinos Christos <christosavg@gmail.com>

USER root
RUN sudo apt-get update \
  && apt-get install -y python3-pip python3-dev vim \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && sudo pip3 install --upgrade pip  \
  && sudo pip3 install torch torchvision

RUN pip install tqdm

RUN mkdir -p /chatbot/
RUN mkdir -p /chatbot/data/
RUN mkdir -p /chatbot/save/model/movie_subtitles/1-1_512/
COPY 50000_backup_bidir_model.tar /chatbot/save/model/movie_subtitles/1-1_512/

COPY ./data /chatbot/data/
COPY *.py /chatbot/
WORKDIR /chatbot/

#CMD ["python", "main.py", "-te", "/chatbot/save/model/movie_subtitles/1-1_512/50000_backup_bidir_model.tar", "-c", "/chatbot/data/movie_subtitles.txt"]
CMD ["python", "main.py", "-te", "/chatbot/save/model/movie_subtitles/1-1_512/50000_backup_bidir_model.tar", "-c", "/chatbot/data/movie_subtitles.txt"]
#python main.py -te <MODEL_FILE_PATH> -c <CORPUS_FILE_PATH> -be k [-i]
