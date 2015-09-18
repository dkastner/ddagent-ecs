FROM datadog/docker-dd-agent:10.0.550

ADD conf.d/docker_daemon.yaml /etc/dd-agent/conf.d/docker_daemon.yaml

RUN sed -i -e"s/^.*collect_ec2_tags:.*$/collect_ec2_tags: yes/" /etc/dd-agent/datadog.conf && \
    sed -i -e"s/^.*collect_instance_metadata:.*$/collect_instance_metadata: yes/" /etc/dd-agent/datadog.conf
