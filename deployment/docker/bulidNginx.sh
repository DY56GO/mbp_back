# build Nginx

docker pull nginx

# ports:
# - "80:80"
# - "443:443"

# volumes:
# - /home/projects/mbp/nginx/conf:/etc/nginx/
# - /home/projects/mbp/nginx/logs:/var/log/nginx
# - /home/projects/mbp/nginx/html:/usr/share/nginx/html

docker run --restart=on-failure:5 \
--name nginx-mbp \
-p 80:80 \
-p 443:443 \
-v /home/projects/mbp/nginx/conf:/etc/nginx \
-v /home/projects/mbp/nginx/conf/nginx.conf:/etc/nginx/nginx.conf \
-v /home/projects/mbp/nginx/logs:/var/log/nginx \
-v /home/projects/mbp/code/mbp_front:/usr/share/nginx/html \
-d nginx \
