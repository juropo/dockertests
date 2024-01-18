FROM python:3.9

#RUN adduser node root && \
RUN mkdir -p /src

WORKDIR /src

# Install dependencies
RUN git clone https://github.com/industrial-optimization-group/desdeo-webapi

WORKDIR /src/desdeo-webapi

EXPOSE 5000

#RUN python -mvenv .venv && \
#    source .venv/bin/activate && \
RUN pip install -r requirements.txt
# python add_exp_users.py --N 1 && \
# cat ./users_and_pass.csv

#RUN chmod -R 775 /src/desdeo-webapi
#RUN chown -R node:root /src/desdeo-webapi


ENTRYPOINT [ "python", "-m", "flask", "run", "--host=0.0.0.0" ]
