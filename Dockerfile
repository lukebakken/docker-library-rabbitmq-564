FROM rabbitmq:3.10.5-management

COPY --chown=rabbitmq:rabbitmq --chmod=0400 ./erlang.cookie /var/lib/rabbitmq/.erlang.cookie
COPY --chown=rabbitmq:rabbitmq ./enabled_plugins /etc/rabbitmq/
COPY --chown=rabbitmq:rabbitmq ./rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

COPY --chown=rabbitmq:rabbitmq --chmod=0400 ./tls-gen/basic/result/ca_certificate.pem /etc/rabbitmq/ca_certificate.pem
COPY --chown=rabbitmq:rabbitmq --chmod=0400 ./tls-gen/basic/result/server_localhost_certificate.pem /etc/rabbitmq/server_localhost_certificate.pem
COPY --chown=rabbitmq:rabbitmq --chmod=0400 ./tls-gen/basic/result/server_localhost_key.pem /etc/rabbitmq/server_localhost_key.pem

EXPOSE 4369 5671 5672 15671 15672 25672 35672-35682
