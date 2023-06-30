FROM python:3.9-slim-bullseye

RUN apt update
RUN apt install gcc git -y

RUN pip install --no-cache-dir cython
RUN pip install --no-cache-dir redis
RUN pip install --no-cache-dir aioredis
RUN pip install --no-cache-dir pymongo[srv]
RUN pip install --no-cache-dir motor
RUN pip install --no-cache-dir asyncpg
WORKDIR /app
RUN git clone -b huyenha --single-branch https://github.com/hathehuyen/cryptofeed.git
WORKDIR /app/cryptofeed
RUN python setup.py install
WORKDIR /app

COPY cryptostore.py ./cryptostore.py

CMD ["./cryptostore.py"]
ENTRYPOINT ["python"]
