# build RabbitMq

docker pull rabbitmq:3.8.5

# ports:
# - "15672:15672"
# - "5672:5672"

# volumes:
# - /home/projects/mbp/rabbitmq/data:/var/lib/rabbitmq

docker run --restart=on-failure:5 \
--privileged=true \
--name rabbitmq-mbp \
-p 15672:15672 \
-p 5672:5672 \
-v /home/projects/mbp/rabbitmq/data:/var/lib/rabbitmq \
-v /etc/localtime:/etc/localtime:ro \
-d rabbitmq:3.8.5 \