FROM debian:buster-slim

RUN apt update && \
    apt upgrade -y && \
    apt install \
        python3 \
        python3-pip \
        ffmpeg \
        sox \
        libsox-fmt-all \
        cifs-utils \
        curl \
        cron \
        -y && \
    apt clean

RUN pip3 install --upgrade pip && \
    pip3 install \
        librosa \
        pysndfx \
        moviepy && \
    rm -rf ~/.cache/pip

COPY entrypoint.sh /
COPY start.sh /
COPY convert.py /

RUN chmod +x /entrypoint.sh && \
    chmod +x /start.sh && \
    (crontab -l ; echo "* * * * * /start.sh") | crontab - 

ENTRYPOINT /entrypoint.sh
