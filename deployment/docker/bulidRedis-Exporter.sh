# build redis-exporter

docker pull oliver006/redis_exporter

# ports:
# - "9121:9121"

docker run --restart=on-failure:5 \
--privileged=true \
--name redis_exporter \
-p 9121:9121 \
-v /etc/localtime:/etc/localtime:ro \
-d oliver006/redis_exporter --redis.addr redis://localhost:6379 --redis.password "12345678" \
