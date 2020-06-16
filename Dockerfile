FROM ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
  vlc \
  wget \
  sudo
    
RUN mkdir -p /opt/vlc-media

#COPY ./media/* /opt/vlc-media/

RUN useradd vlcuser -M -d /opt/vlc-media -r -U

RUN echo -e "\nauth  [success=ignore default=1] pam_succeed_if.so user = vlcuser \nauth  sufficient                 pam_succeed_if.so use_uid user ingroup sudo \n" >> /etc/pam.d/su

EXPOSE 8080
EXPOSE 554
EXPOSE 8554
RUN cd /opt/vlc-media/ && wget http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
RUN chown vlcuser:vlcuser -R /opt/vlc-media

ENTRYPOINT ["/usr/bin/sudo","su","-","vlcuser","-c"]
