FROM batonogov/cron

RUN apt update && \
    apt upgrade && \
    apt install \
        python3 \
        python3-pip \
        ffmpeg \
        sox \
        libsox-fmt-all \
        cifs-utils \
        -y && \
    apt clean && \
    pip3 install --upgrade pip && \
    pip3 install \
        librosa \
        pysndfx \
        moviepy && \
    rm -rf ~/.cache/pip
