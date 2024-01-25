FROM python:3.9

RUN useradd node -g root && mkdir -p /src

WORKDIR /src

# Install dependencies
<<<<<<< HEAD
RUN git clone -b rahti-deployment --single-branch https://github.com/juropo/desdeo-webapi.git
=======
RUN git clone https://github.com/industrial-optimization-group/desdeo-webapi.git
>>>>>>> 5334d66857e873d41027e22547d5b2fcf4b40b18

WORKDIR /src/desdeo-webapi

EXPOSE 5000

#RUN python -mvenv .venv && \
#    source .venv/bin/activate && \
RUN pip install -r requirements.txt && pip install psycopg2-binary && \
#RUN python add_exp_users.py --username user --N 1 && \
#cat ./users_and_pass.csv
    chmod -R 775 /src/desdeo-webapi && \
    chown -R node:root /src/desdeo-webapi


ENTRYPOINT [ "python", "-m", "flask", "run", "--host=0.0.0.0" ]
