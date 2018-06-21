FROM debian:stretch-slim

# Setup useful environment variables

LABEL Description="This image is used to build an image factory container with Ansible, Packer and Inspec"

ENV PACKER_VERSION          1.2.3
ENV PACKER_DOWNLOAD         https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip
ENV PYTHON_PIP_VERSION      10.0.1

ARG tag=unversioned

ADD root /

USER root
RUN set -ex \
    && rm -rf               /var/lib/apt/lists \
    && mkdir                -p /var/lib/apt/lists/partial \
    && chmod 0750           /var/lib/apt/lists \
    && apt-get clean        \
    && apt-get update       \
    && apt-get install -y --no-install-recommends \
                            gnupg \
                            curl \
                            libssl-dev \
                            gcc \
                            ruby \
                            ruby-dev \
                            g++ \
                            make \
                            git \
                            openssh-client \
                            python \
                            python-dev \
                            unzip \
	&& curl -Ls             "https://bootstrap.pypa.io/get-pip.py" -o /tmp/get-pip.py \
	&& python /tmp/get-pip.py \
		--disable-pip-version-check \
		--no-cache-dir \
		"pip==$PYTHON_PIP_VERSION" \
	&& pip --version \
	&& rm -f                /tmp/get-pip.py \
    && pip install          -r /opt/factory/requirements/requirements.txt \
    && curl -Ls             "${PACKER_DOWNLOAD}" -o "/tmp/packer.zip" \
    && unzip                /tmp/packer.zip -d /usr/local/sbin \
    && rm -rf               /tmp/packer.zip \
    && gem install -N       inspec \
    && chmod +x             /opt/factory/running/* \
    && apt-get clean        \
    && rm -rf               /var/lib/apt/lists \
    && rm -rf               /root/.cache \
    && echo ${tag}          > /opt/container-version

ENTRYPOINT /opt/factory/running/start.sh



