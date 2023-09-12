FROM python:3.11.4-slim-bullseye
ENV CONTAINERIZED yes

RUN apt update
RUN apt install g++ git  -y

WORKDIR /usr/src/app
RUN pip install --no-cache-dir redis
RUN pip install --no-cache-dir aioredis
RUN pip install --no-cache-dir bson
RUN pip install --no-cache-dir motor
RUN pip install --no-cache-dir asyncpg
RUN pip install --no-cache-dir git+https://github.com/bmoscon/cryptofeed

COPY cryptostore.py ./cryptostore.py

CMD ["./cryptostore.py"]
ENTRYPOINT ["python"]
