FROM texlive/texlive:latest-full

#install pandoc
RUN apt update && apt install -y pandoc pandoc-plantuml-filter

#add the templates
RUN mkdir -p /usr/share/pandoc/data/templates/
COPY templates /usr/share/pandoc/data/templates/

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
