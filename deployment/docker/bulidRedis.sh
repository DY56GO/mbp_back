# build Redis

docker pull redis:6.0

# ports:
# - "6379:6379"

# volumes:
# - /home/projects/mbp/redis/conf/redis.conf:/etc/redis.conf
# - /home/projects/mbp/redis/data:/data


docker run --restart=on-failure:5 \
--privileged=true \
--name redis-mbp \
-p 6379:6379 \
-v /home/projects/mbp/redis/conf/redis.conf:/etc/redis/redis.conf \
-v /home/projects/mbp/redis/data:/data \
-v /etc/localtime:/etc/localtime:ro \
-d redis:6.0 redis-server /etc/redis/redis.conf --requirepass 12345678 \