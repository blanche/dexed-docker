FROM debian:latest

RUN apt-get update
RUN apt-get install -y git freeglut3-dev g++ libasound2-dev libcurl4-openssl-dev build-essential\
                     libfreetype6-dev libjack-jackd2-dev libx11-dev libxcomposite-dev \
                     libxcursor-dev libxinerama-dev libxrandr-dev mesa-common-dev && apt-get clean

RUN git clone https://github.com/asb2m10/dexed.git

RUN cd /dexed/Builds/Linux && \
	make CONFIG=Release && \
	install -Dm755 build/Dexed.so /usr/lib/vst/Dexed.so

VOLUME /vol

ENTRYPOINT ["/bin/cp","/dexed/Builds/Linux/build/Dexed", "/dexed/Builds/Linux/build/Dexed.so", "/vol"]