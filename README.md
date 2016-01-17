# VestaCP-LetsEncrypt

# Generate dhparam
openssl dhparam -out /etc/nginx/dhparams.pem 4096

# Install mod do existing vesta directory IT WILL OVERRIDE EXISTING TEMPLATES!
$ git clone https://github.com/ScIT-Informatik-GmbH/VestaCP-LetsEncrypt.git .

# Add SSL_LE String to existing web configurations.
<code>
#!/bin/bash

VESTA="/usr/local/vesta"

for u in $($VESTA/bin/v-list-users | cut -f1 -d' ' | tail -n+3); do
        mv $VESTA/data/users/$u/web.conf $VESTA/data/users/$u/web.conf.bak
        while read -r line || [[ -n "$line" ]]; do
                if ! [[ $line == *"SSL_LE"* ]]; then
                        echo "$line SSL_LE=''" >> "$VESTA/data/users/$u/web.conf"
                else
                        echo $line >> "$VESTA/data/users/$u/web.conf"
                fi
        done < "$VESTA/data/users/$u/web.conf.bak"
        #rm $VESTA/data/users/$u/web.conf.bak
done
</code>
