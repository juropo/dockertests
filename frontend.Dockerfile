FROM node:18-alpine

EXPOSE 3000

RUN adduser node root && \
    mkdir -p /src

WORKDIR /src

# Install dependencies
RUN apk add git && git clone -b UTOPIA --single-branch https://github.com/industrial-optimization-group/desdeo-webui.git

WORKDIR /src/desdeo-webui

RUN sed -i 's,localhost:5000,desdeo-webapi-dsd-test-project.rahtiapp.fi,' ./src/lib/api.ts
RUN npm install -g npm@latest && rm .npmrc && \
    npm cache clean --force && npm install && npm run build && \
    chmod -R 775 /src/desdeo-webui && \
    chown -R node:root /src/desdeo-webui 

USER 1000

ENTRYPOINT [ "npm", "run", "dev", "--", "--host", "--port", "3000" ]
