FROM node:18-alpine
WORKDIR /app

# Copy package.json (already referenced by docker-compose build context)
COPY package.json package-lock.json ./
RUN npm ci

# Workspace vulnerability installs
RUN npm install file:./missing-frontend-workspace/auth
RUN npm install file:../nonexistent-ui-packages/components

COPY . .
RUN npm run build
