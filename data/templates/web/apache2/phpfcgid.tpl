<VirtualHost %ip%:%web_port%>

    ServerName %domain_idn%
    %alias_string%
    ServerAdmin %email%
    DocumentRoot %docroot%
    ScriptAlias /cgi-bin/ %home%/%user%/web/%domain%/cgi-bin/
    Alias /vstats/ %home%/%user%/web/%domain%/stats/
    Alias /error/ %home%/%user%/web/%domain%/document_errors/
    Alias /.well-known/acme-challenge /etc/letsencrypt/.well-known/acme-challenge
    SuexecUserGroup %user% %group%
    CustomLog /var/log/%web_system%/domains/%domain%.bytes bytes
    CustomLog /var/log/%web_system%/domains/%domain%.log combined
    ErrorLog /var/log/%web_system%/domains/%domain%.error.log
    <Directory %docroot%>
        AllowOverride All
        Options +Includes -Indexes +ExecCGI
        <Files *.php>
          SetHandler fcgid-script
        </Files>
        FCGIWrapper %home%/%user%/web/%domain%/cgi-bin/fcgi-starter .php
    </Directory>
    <Directory %home%/%user%/web/%domain%/stats>
        AllowOverride All
    </Directory>
    IncludeOptional %home%/%user%/conf/web/%web_system%.%domain%.conf*

</VirtualHost>

