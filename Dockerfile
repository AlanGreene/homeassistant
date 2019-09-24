FROM homeassistant/home-assistant:stable

# Installs latest Chromium package.
RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
    && echo @edge http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories \
    && apk add --no-cache \
    chromium@edge \
    chromium-chromedriver@edge \
    harfbuzz@edge \
    nss@edge \
    freetype@edge \
    ttf-freefont@edge \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

RUN ln -sf /usr/bin/chromium-browser /usr/bin/google-chrome

ENV CHROME_BIN=/usr/bin/google-chrome \
    CHROME_PATH=/usr/lib/chromium/
