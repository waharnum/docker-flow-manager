FROM kaspermarkus/universal:review3

COPY start.sh /usr/local/bin/start.sh

RUN chmod 755 /usr/local/bin/start.sh

EXPOSE 8081

ENTRYPOINT ["/usr/local/bin/start.sh"]
