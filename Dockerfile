FROM pandoc/extra:latest-ubuntu

#install plantuml filter
RUN apt update && apt install -y pandoc-plantuml-filter

#install plantuml
RUN wget https://github.com/plantuml/plantuml/releases/download/v1.2025.4/plantuml-1.2025.4.jar
RUN rm -rf /usr/share/plantuml/plantuml.jar && mv plantuml-1.2025.4.jar /usr/share/plantuml/plantuml.jar

#add the background
COPY mindit.pdf /

#create documents folder
RUN mkdir -p /documents

#workdir
WORKDIR /

COPY mindit.sh /bin/
RUN chmod +x /bin/mindit.sh

ENTRYPOINT ["/bin/mindit.sh"]
CMD [""]
