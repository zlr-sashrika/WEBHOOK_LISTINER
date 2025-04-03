# Use a minimal base image for Node.js
FROM node:16-slim

# Set environment variables
ENV NODE_ENV=production

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies without dev dependencies
RUN npm install --only=production

# Copy project files
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "index.js"]
