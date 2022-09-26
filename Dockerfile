FROM python:3.10 as builder

WORKDIR /home/epic

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN apt update -y \
    && apt install -y wget

COPY src ./
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt install -y ./google-chrome-stable_current_amd64.deb \
    && rm ./google-chrome-stable_current_amd64.deb

# docker container prune -f && docker image prune -f