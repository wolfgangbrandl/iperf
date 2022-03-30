FROM registry.access.redhat.com/ubi8/ubi

ENV SUMMARY="ioperf " \
    DESCRIPTION="ioperf create, run, maintain and access a PostgreSQL DBMS server."

LABEL summary="$SUMMARY" \
      description="ioperf"

COPY rhel_dvd.repo /etc/yum.repos.d
COPY forever.bash /bin
RUN chmod a+rx /bin/forever.bash

USER root:root
# to make sure of that.
RUN dnf -y install rsync tar iperf3
CMD /bin/forever.bash
