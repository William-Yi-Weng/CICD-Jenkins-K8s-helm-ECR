FROM debian:latest

ARG USER_ID=1000
ARG GROUP_ID=1000

# Generate user and group
# We make both USER_ID and GROUP_ID optional.
# Building an image using --build-arg
RUN if getent group admin ; then groupdel admin; fi &&\
    groupadd -g ${GROUP_ID} admin &&\
    useradd -l -u ${USER_ID} -g admin admin &&\
    install -d -m 0755 -o admin -g admin /home/admin &&\
    chown --changes --silent --no-dereference --recursive \
    --from=41:41 ${USER_ID}:${GROUP_ID} \
        /home/admin

# Install dependencies
RUN apt-get update -y && \
  apt-get install openjdk-11-jre-headless -y &&

# Add java files
ADD HelloWorld,java /home
ADD startup.sh
RUN chown -R admin:admin /home

# Set USER variable
#USER admin
USER admin
