FROM godatadriven/unity-catalog:0.2.1

RUN apk update && apk add --no-cache bash

WORKDIR /app/unitycatalog

# Create the shared group and users
RUN addgroup -g 1011 sharedgroup && \
    adduser -u 1008 -G sharedgroup -s /bin/bash -D dunky && \
    adduser -u 1009 -G sharedgroup -s /bin/bash -D unitycat

# Change ownership of the directory to sharedgroup
RUN chown -R :sharedgroup /app/unitycatalog

# Listen to port 8080
EXPOSE 8080

# Run the server
CMD ["bin/start-uc-server"]
