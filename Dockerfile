ARG rversion=latest
FROM r-base:${rversion}

COPY tmp/custom-pre-commands.sh /
RUN bash -e /custom-pre-commands.sh

COPY tmp/R-packages-cran.sh /
RUN bash -e /R-packages-cran.sh

COPY tmp/R-packages-bioc.sh /
RUN bash -e /R-packages-bioc.sh

COPY tmp/custom-commands.sh /
RUN bash -e /custom-commands.sh

RUN date > /build-date
