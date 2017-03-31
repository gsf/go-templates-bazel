FROM ubuntu:16.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install \
  g++ \
  git \
  openjdk-8-jdk-headless \
  pkg-config \
  python \
  python-pip \
  unzip \
  wget \
  zip \
  zlib1g-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/* && update-ca-certificates -f

RUN pip install awscli

RUN wget --progress=dot:giga -O bazel-install.sh \
  http://s3.amazonaws.com/cookbooks.vistarmedia.com/third-party/bazel-0.4.4-installer-linux-x86_64.sh \
  && chmod +x bazel-install.sh \
  && ./bazel-install.sh \
  && rm bazel-install.sh

ARG APP_DIR=/opt/app
WORKDIR $APP_DIR
