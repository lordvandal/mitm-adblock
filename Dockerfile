FROM python:3.7.4

COPY requirements.txt .

RUN pip install mitmproxy
RUN pip install adblockparser
RUN pip install 'Cython>=0.29.19,<1.0'  # for pyre2
RUN pip install -r requirements.txt

EXPOSE 8118

RUN mkdir /code
ADD . /code
CMD cd code && ./go # -d for debug
