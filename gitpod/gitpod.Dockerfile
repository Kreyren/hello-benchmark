FROM gitpod/workspace-full-vnc:latest

## VLANG ##
USER root
ENV VLANG_SOURCE="/opt/vlang"
USER root
RUN chown -R "$VLANG_SOURCE" || exit 1
USER gitpod
RUN git clone https://github.com/vlang/v "$VLANG_SOURCE" || exit 1
RUN make -C "$VLANG_SOURCE" || exit 1
RUN "$VLANG_SOURCE/v" symlink || exit 1
RUN unset VLANG_SOURCE
