FROM batonogov/cron

LABEL maintainer="batonogov@icloud.com"

RUN apt update && \
    apt install \
        python3-pip \
        ffmpeg \
        sox \
        libsox-fmt-all \
        cifs-utils \
        -y

RUN pip3 install --upgrade pip && \
    pip3 install \
        librosa \
        pysndfx \
        moviepy
