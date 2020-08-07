FROM batonogov/cron

RUN apt update && \
    apt upgrade -y && \
    apt install \
        python3 \
        python3-pip \
        ffmpeg \
        sox \
        libsox-fmt-all \
        cifs-utils \
        -y && \
    apt clean

RUN pip3 install --upgrade pip && \
    pip3 install \
        librosa \
        pysndfx \
        moviepy && \
    rm -rf ~/.cache/pip

COPY convert.py /
