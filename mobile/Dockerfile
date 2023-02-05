FROM reactnativecommunity/react-native-android:6

ARG BUILD_API_ENDPOINT
ENV REACT_APP_API_ENDPOINT=${BUILD_API_ENDPOINT}

WORKDIR /usr/src/app

COPY . .

ENTRYPOINT ["/bin/bash", "./build.sh"]
#ENTRYPOINT ["tail", "-f", "/dev/null"]
