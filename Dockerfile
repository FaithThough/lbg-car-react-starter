# Stage 1: Build the React application
FROM node:18-alpine as build

WORKDIR /app

# Install dependencies
COPY package.json . 
RUN npm ci --legacy-peer-deps

# Copy the rest of the application code and build
COPY . .
RUN npm run build

###############################################

# Stage 2: Serve the app with Nginx
FROM nginx:1.23-alpine

# Copy the build output to the Nginx HTML directory
COPY --from=build /app/build /usr/share/nginx/html

# Copy the Nginx configuration file if you have custom settings
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
