FROM ubuntu:14.04
MAINTAINER Juan Ferreira "juan.ferreira@me.com"

ARG CG_PKG="Cg-3.1_April2012_x86_64.deb"

# Install dependencies
RUN apt-get update && \
	apt-get install -y curl

WORKDIR /tmp

# Install CG Toolkit
RUN curl -O http://developer.download.nvidia.com/cg/Cg_3.1/$CG_PKG && \
    dpkg -i $CG_PKG

# Clean up apt-get cache (helps keep the image size down)
RUN apt-get remove --purge -y git
RUN apt-get autoclean && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/*