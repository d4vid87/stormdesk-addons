ARG BUILD_FROM
FROM ${BUILD_FROM}

# The published image runs as uid 1000 and never touches root, which is right everywhere except
# here: the Supervisor creates the add-on's /data owned by root, and a server that cannot write
# its archive starts, serves the page, and quietly stores nothing. So this starts as root purely
# to hand /data over, then drops back to the same unprivileged user the plain image uses.
USER root
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT []
CMD ["/run.sh"]
