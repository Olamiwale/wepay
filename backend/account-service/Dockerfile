# Stage 1: Build
FROM node:18-alpine AS builder

WORKDIR /backend

COPY package*.json ./
RUN npm install

COPY . .



# Stage 2: Runtime
FROM node:18-alpine

WORKDIR /backend

COPY --from=builder /backend .

EXPOSE 3000

CMD ["node", "account.js"]