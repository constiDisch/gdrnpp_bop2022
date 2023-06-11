FROM nvidia/cudagl:11.3.0-devel-ubuntu20.04


# We love UTF!
ENV LANG C.UTF-8

ARG USERNAME
ARG USER_UID=1000
ARG USER_GID=${USER_UID}
ARG TORCH_CUDA_ARCH_LIST="Ampere"

ENV DEBIAN_FRONTEND noninteractive

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    #
    # [Optional] Add sudo support. Omit if you don't need to install software after connecting.
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

# ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

# [Optional] Set the default user. Omit if you want to keep the default as root.

RUN apt-get update && apt-get install -y \
	python3-opencv ca-certificates python3-dev git wget sudo ninja-build
RUN ln -sv /usr/bin/python3 /usr/bin/python

RUN wget https://bootstrap.pypa.io/get-pip.py && \
	python3 get-pip.py && \
	rm get-pip.py



RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
	unzip \
	libjpeg-dev zlib1g-dev \
	libopenexr-dev \
	openexr \
	python3-dev \
	libglfw3-dev libglfw3 \
	libglew-dev \
	libassimp-dev \
	libnuma-dev \
	clang \
	## for bop cpp renderer
	curl \
	autoconf \
	libtool \
	## for uncertainty pnp
	libeigen3-dev \
	libgoogle-glog-dev \
	libsuitesparse-dev \
	libatlas-base-dev \
	## for nvdiffrast/egl
	cmake curl pkg-config \
	libgles2 \
	libgl1-mesa-dev \
	libegl1-mesa-dev \
	libgles2-mesa-dev \
	# (only available for Ubuntu >= 18.04)
	libglvnd0 \
	libgl1 \
	libglx0 \
	libegl1 \
	libglvnd-dev \
	libglew-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


RUN git config --global user.name "FIRST_NAME cdisch" && git config --global user.email "constantin.disch@gmail.com"

ENV FORCE_CUDA="1"

COPY requirements.txt /tmp/requirements.txt
RUN pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
RUN pip install  -r /tmp/requirements.txt

RUN git config --global user.name "const" && git config --global user.email "constantin.disch@gmail.com"