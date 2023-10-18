# Dockerfile
FROM node:18.12.1

WORKDIR /app

COPY ./backend .
RUN npm install 

RUN mkdir /app/uploads

CMD ["npm", "start"]