FROM ubuntu:18.04 

RUN mkdir /root/build_folder

COPY ./ /root/build_folder/
WORKDIR /root/build_folder/

# Dependencies.
USER root
RUN apt-get update
# Copied from han xiao
RUN apt-get install -qqy automake libtool pkg-config libffi6 libgmp3-dev openssl
# Copied from han xiao
RUN pip3 install -r requirements.txt
# myself
RUN apt-get install -qqy libssl-dev
# myself
RUN apt-get install -qqy python3-pip


#RUN exit 0

# Test if command exist, installation complete.
#RUN bash -c '[[ $(which web3-gear) == "/usr/local/bin/web3-gear" ]] || exit 1'

# Entry point
#COPY docker-entrypoint.sh /usr/local/bin/
#RUN chmod 777 /usr/local/bin/docker-entrypoint.sh

# Backwards compatibility
#RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh

# See docker-entrypoint.sh for details
#ENTRYPOINT ["docker-entrypoint.sh"]

# Ports that should be exposed
#EXPOSE 8545/tcp
#EXPOSE 8545/udp
