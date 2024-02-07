FROM python:3.9

RUN useradd node -g root && mkdir -p /src

WORKDIR /src

# Install dependencies
RUN git clone -b rahti-deployment --single-branch https://github.com/juropo/desdeo-webapi.git

WORKDIR /src/desdeo-webapi

# EXPOSE 5000

#RUN python -mvenv .venv && \
#    source .venv/bin/activate && \
RUN pip install -r requirements.txt && pip install psycopg2-binary && \
#RUN python add_exp_users.py --username user --N 1 && \
#cat ./users_and_pass.csv
    chmod -R 775 /src/desdeo-webapi && \
    chown -R node:root /src/desdeo-webapi


ENTRYPOINT [ "/bin/sh", "-c", "python add_UTOPIA_users.py && cat ./users_and_pass.csv" ]
