FROM python:latest
WORKDIR /app/


ADD requirements.txt .

RUN pip install --upgrade -r requirements.txt

ADD . .

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /scripts
	RUN chmod +x /scripts/wait-for-it.sh
	ENTRYPOINT ["/scripts/wait-for-it.sh", "db:5432", "--"]

EXPOSE 80

CMD ["python", "app.py" ,"runserver",  "--host=0.0.0.0",  "--threaded"]