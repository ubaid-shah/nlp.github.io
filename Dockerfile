FROM frolvlad/alpine-python-machinelearning:latest
RUN pip install --upgrade pip


WORKDIR /app 
COPY . /app
RUN pip install --no-cache-dir --compile -r requirements.txt

# RUN python -m nltk.downloader punkt
RUN [ "python", "-c", "import nltk; nltk.download('punkt', download_dir='/usr/local/nltk_data')" ]
EXPOSE 4000

ENTRYPOINT  ["python"]
CMD ["app.py"]

