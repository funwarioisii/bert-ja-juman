FROM tensorflow/tensorflow:2.0.0-gpu-py3

RUN apt update --fix-missing
RUN apt install -y wget cmake git


###############
# build juman
###############
WORKDIR tmp
RUN wget https://github.com/ku-nlp/jumanpp/releases/download/v2.0.0-rc3/jumanpp-2.0.0-rc3.tar.xz
RUN tar xJvf jumanpp-2.0.0-rc3.tar.xz

WORKDIR jumanpp-2.0.0-rc3/bld
RUN cmake ..
RUN make install


############################
# set up pretrained bert-ja
############################
WORKDIR /work
RUN wget http://nlp.ist.i.kyoto-u.ac.jp/nl-resource/JapaneseBertPretrainedModel/Japanese_L-12_H-768_A-12_E-30_BPE.zip
RUN unzip Japanese_L-12_H-768_A-12_E-30_BPE.zip
ENV BERT_BASE_DIR /work/Japanese_L-12_H-768_A-12_E-30_BPE


##########################
# set up bert play ground
##########################
EXPOSE 8888
RUN pip install -U pip
RUN pip install numpy pyknp jupyterlab
COPY convert.py .
COPY Makefile .
COPY input.txt .


