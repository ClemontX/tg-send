FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip \
  wget \
  && pip3 install telegram-send \
  && rm -rf /var/lib/apt/lists/*
COPY entrypoint.sh /entrypoint.sh
COPY app.sh /app.sh
COPY copy.sh /copy.sh
ENTRYPOINT ["/entrypoint.sh"]
