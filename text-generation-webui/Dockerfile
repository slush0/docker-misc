FROM huggingface/transformers-pytorch-gpu

# Install base utilities
RUN apt-get update && apt-get install -y build-essential wget
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install miniconda
#ENV CONDA_DIR /opt/conda
#RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
#     /bin/bash ~/miniconda.sh -b -p /opt/conda

# Put conda in path so we can use conda activate
#ENV PATH=$CONDA_DIR/bin:$PATH

VOLUME /data

RUN git clone https://github.com/oobabooga/text-generation-webui /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN rm -rf /app/models
RUN ln -s /data /app/models

ENV PATH=$PATH:/app

#CMD ["python", "server.py", "--listen-port", "8000", "--load-in-8bit", "--model", "model-name", "--auto-devices"]
