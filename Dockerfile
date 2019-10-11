FROM nginx:1.17.4
COPY ssl.conf /etc/nginx/conf.d
COPY ca.crt ca.key client1.crt client2.crt clientcerts.crt /etc/nginx/
COPY index.html /usr/share/nginx/html/
