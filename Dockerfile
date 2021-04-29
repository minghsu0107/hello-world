FROM ubuntu:latest AS builder
# Install gcc
RUN apt-get update -qy
RUN apt-get upgrade -qy
RUN apt-get install build-essential -qy
COPY hello.cpp .
# Build the binary.
RUN g++ -o hello -static hello.cpp
FROM scratch
COPY --from=builder hello /
# Run the hello binary.
ENTRYPOINT ["/hello"]
