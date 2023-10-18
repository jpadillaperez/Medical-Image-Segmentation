# Use the official Ubuntu base image
#FROM ubuntu:23.10
FROM continuumio/anaconda3

#SHELL ["/bin/bash", "-c"]
#ENV SHELL=/bin/bash

# Update the package repository and install some packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    software-properties-common \
    python3 \
    python3-pip \
    build-essential \
    wget \
    git \ 
    ffmpeg \
    libsm6 \
    libxext6

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

#ENV CONDA_DIR /opt/conda
#RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
#    /bin/bash ~/miniconda.sh -b -p /opt/conda
#
#ENV PATH=$CONDA_DIR/bin:$PATH

# Prepare the environment
#RUN conda create -n nnsam python=3.9
#RUN conda init bash
#RUN conda activate nnsam


EXPOSE 5000

RUN conda create -n nnsam python=3.9

SHELL ["conda", "run", "-n", "venv", "/bin/bash", "-c"]

#RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu117 && \
#   pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121 && \
#   pip3 install git+https://github.com/ChaoningZhang/MobileSAM.git && \
#   pip3 install timm && \
#   pip3 install git+https://github.com/Kent0n-Li/nnSAM.git && \
#   pip3 install nnunetv2 && \
#   git clone https://github.com/Kent0n-Li/Medical-Image-Segmentation.git && \
#   cd Medical-Image-Segmentation && pip3 install -r requirements.txt
