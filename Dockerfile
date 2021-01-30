FROM adoptopenjdk/openjdk13:alpine
RUN apk update &&\ 
    apk upgrade &&\
    mkdir /XENIABACKENDINSTALL &&\
    cd /XENIABACKENDINSTALL &&\
    wget "https://ci.netbeacon.de/repository/download/Xenia_Backend/latest.lastSuccessful/Xenia-Backend-all.jar?guest=1" -O "Xenia-Backend.jar" &&\
    chmod +x Xenia-Backend.jar &&\
    mkdir -p /xenia-backend/{config, logs}

ENTRYPOINT cd /XENIABACKENDINSTALL && java -jar Xenia-Backend.jar $ARGS
