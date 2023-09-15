# Use Ubuntu 22.04 as the base image
# add
FROM ubuntu:22.04

# Install required dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    tar \
    git \
    build-essential \
    samtools \
    parallel \
    openjdk-17-jre-headless \
    bowtie2

WORKDIR /usr/local/bin



#RUN wget https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.5.1/bowtie2-2.5.1-linux-x86_64.zip/download && \
#    unzip download

#RUN wget https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.tar.gz && \
#    tar xvzf jdk-20_linux-x64_bin.tar.gz

# Copy your application code into the container
COPY run_melt.sh .
RUN chmod +x run_melt.sh

# give me all the permissions
RUN chmod -R 777 /var/lib/ 

# Set the entrypoint command
CMD ["run_melt.sh"]
