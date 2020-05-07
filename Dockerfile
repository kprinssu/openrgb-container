FROM jlesage/baseimage-gui:ubuntu-18.04

MAINTAINER Poseidon's 3 Rings

ENV APP_NAME="P3R OpenRGB"

WORKDIR /usr/src/openrgb

COPY OpenRGB .
COPY startapp.sh /startapp.sh

RUN chmod +x /usr/src/openrgb/OpenRGB
RUN apt-get update
RUN apt-get -y install libusb-1.0-0 libqt5widgets5 libqt5core5a libqt5gui5 usbutils i2c-tools
RUN \
	APP_ICON_URL=https://raw.githubusercontent.com/captasic/unraid-dev/master/OpenRGB-P3R-256px.png && \
    APP_ICON_DESC='{"masterPicture":"/opt/novnc/images/icons/master_icon.png","iconsPath":"/images/icons/","design":{"ios":{"pictureAspect":"noChange","assets":{"ios6AndPriorIcons":false,"ios7AndLaterIcons":false,"precomposedIcons":false,"declareOnlyDefaultIcon":true}},"desktopBrowser":{"design":"raw"},"windows":{"pictureAspect":"noChange","backgroundColor":"#da532c","onConflict":"override","assets":{"windows80Ie10Tile":false,"windows10Ie11EdgeTiles":{"small":false,"medium":true,"big":false,"rectangle":false}}},"androidChrome":{"pictureAspect":"noChange","themeColor":"#ffffff","manifest":{"display":"standalone","orientation":"notSet","onConflict":"override","declared":true},"assets":{"legacyIcon":false,"lowResolutionIcons":false}},"safariPinnedTab":{"pictureAspect":"silhouette","themeColor":"#5bbad5"}},"settings":{"scalingAlgorithm":"Mitchell","errorOnImageTooSmall":false,"readmeFile":false,"htmlCodeFile":false,"usePathAsIs":false},"versioning":{"paramName":"v","paramValue":"ICON_VERSION"}}' && \
	install_app_icon.sh "$APP_ICON_URL" "$APP_ICON_DESC"
