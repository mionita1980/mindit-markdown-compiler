FROM pandoc/extra:3.8-debian

#install graphviz and plantuml filter
RUN apt update && \
    apt install -y --no-install-recommends graphviz pandoc-plantuml-filter && \
    apt autoremove -y && \
    rm -rf /config/.cache /var/lib/apt/lists/* /var/tmp/* /tmp/*

#install plantuml
RUN wget https://github.com/plantuml/plantuml/releases/download/v1.2026.1/plantuml-1.2026.1.jar
RUN rm -rf /usr/share/plantuml/plantuml.jar && mv plantuml-1.2026.1.jar /usr/share/plantuml/plantuml.jar

#add the background
COPY mindit.pdf /
COPY mindit-title.pdf /

#create documents folder
RUN mkdir -p /documents

#workdir
WORKDIR /documents

COPY mindit.sh /bin/
RUN chmod +x /bin/mindit.sh

ENTRYPOINT ["/bin/mindit.sh"]
CMD [""]
