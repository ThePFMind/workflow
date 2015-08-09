FROM node:0.12.7

ENV APP_DIR /usr/src/app
ENV METEORD_DIR /opt/meteord

COPY scripts $METEORD_DIR

RUN bash $METEORD_DIR/init.sh
RUN bash $METEORD_DIR/install_sshd.sh
RUN bash $METEORD_DIR/install_meteor.sh

RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR
VOLUME /Workspace/DockerProjects/workflow/app $APP_DIR

#RUN bash $METEORD_DIR/build_app.sh

EXPOSE 80, 22
ENTRYPOINT CMD ["/usr/sbin/sshd", "-D"]
#ENTRYPOINT bash $METEORD_DIR/run_app.sh
