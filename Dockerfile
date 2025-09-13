FROM node:19-alpine AS firststage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .


FROM firststage AS final
RUN npm run build --production
COPY . .
CMD ["npm", "start"]
