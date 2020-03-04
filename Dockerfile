FROM baota:7.1

VOLUME [ "/www" ]

COPY "www" "./www"

EXPOSE 8888