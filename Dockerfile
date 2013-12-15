FROM bydavy/ubuntu-supervisor

RUN echo deb http://plex.r.worldssl.net/PlexMediaServer/ubuntu-repo lucid main > /etc/apt/sources.list.d/plexmediaserver.list
RUN apt-get update -q
RUN apt-get install -qy --force-yes plexmediaserver

ENV HOME /root
#VOLUME /root/Library/Application\ Support/Plex\ Media\ Server 
EXPOSE 32400/tcp

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
