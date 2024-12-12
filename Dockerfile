# Use the official Node.js image as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Define environment variable for the Docker build
ARG GHCR_USERNAME
ARG GHCR_PASSWORD

# Login to GitHub Container Registry
RUN echo $GHCR_PASSWORD | docker login ghcr.io -u $GHCR_USERNAME --password-stdin

# Build the application
RUN npm run build

# Start the application
CMD ["node", "index.js"]