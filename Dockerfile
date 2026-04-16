# # Step 1: Build React app
# FROM node:18 AS build

# WORKDIR /app

# COPY package*.json ./
# RUN npm install

# COPY . .

# RUN npm run build

# # Step 2: Serve with Nginx
# FROM nginx:alpine

# COPY --from=build /app/build /usr/share/nginx/html

# EXPOSE 3000

# CMD ["nginx", "-g", "daemon off;"]









# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json first to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the React app for production
RUN npm run build

# Serve the app using a simple static file server (e.g., serve)
RUN npm install -g serve

# Expose port 3000 (the port that the React app will run on)
EXPOSE 3000

# Command to run the app using the static file server
CMD ["serve", "-s", "build", "-l", "3000"]