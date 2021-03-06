FROM python:3.7.4

COPY requirements.txt /

RUN pip install --upgrade pip
#RUN pip install pip==18.1
RUN pip install mitmproxy
RUN pip install adblockparser
RUN pip install 'Cython>=0.29.19,<1.0'  # for pyre2
#RUN pip install git+https://github.com/google/re2 && cd re2 && make && make install
RUN git clone https://github.com/google/re2.git && cd re2 && make && make install
RUN pip install -r requirements.txt

EXPOSE 8118

RUN mkdir /code
ADD . /code
CMD cd code && ./go # -d for debug

