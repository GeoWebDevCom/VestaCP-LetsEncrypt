server {
    listen      %ip%:%proxy_port%;
    server_name %domain_idn% %alias_idn%;

    location /.well-known/acme-challenge {
        alias /etc/letsencrypt/.well-known/acme-challenge;
        location ~ /.well-known/acme-challenge/(.*) {
            add_header Content-Type text/plain;
        }
    }

    location / {
        rewrite ^(.*) https://%domain_idn%$1 permanent;
    }
}
