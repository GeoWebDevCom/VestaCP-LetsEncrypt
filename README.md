# VestaCP-LetsEncrypt

Generate dhparam
$ openssl dhparam -out /etc/nginx/dhparams.pem 4096

Install mod do existing vesta directory IT WILL OVERRIDE EXISTING TEMPLATES!
$ git clone https://github.com/ScIT-Informatik-GmbH/VestaCP-LetsEncrypt.git .

Add SSL_LE String to existing web configurations.
