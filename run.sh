apache2 \
    -f /dev/null \
    -C "DocumentRoot $( readlink -f .)" \
    -C 'Listen 7000' \
    -C 'PidFile /tmp/pidfile' \
    -C 'ErrorLog /dev/stdout' \
    -C 'LogFormat "%h %l %u %t \"%r\" %>s %b" common' \
    -C 'CustomLog /dev/stdout common' \
    -D FOREGROUND
