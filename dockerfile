# Use a lightweight web server to serve static files
FROM nginx:alpine

# Copy the current directory contents into /usr/share/nginx/html
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80
