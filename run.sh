apache2 \
    -f /dev/null \
    -C "DocumentRoot $( readlink -f .)" \
    -C 'Listen 7000' \
    -C 'PidFile /tmp/pidfile' \
    -C 'ErrorLog /dev/stdout' \
    -D FOREGROUND
