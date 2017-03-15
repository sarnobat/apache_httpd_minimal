cat << EOF > here.conf; apache2 -f $PWD/here.conf  -c "DocumentRoot $PWD" -k restart; #sleep 1; rm here.conf;
LockFile $PWD/accept.lock

PidFile $PWD/http.pid

Timeout 300

KeepAlive On

MaxKeepAliveRequests 100

KeepAliveTimeout 5

<IfModule mpm_prefork_module>
    StartServers          5
    MinSpareServers       5
    MaxSpareServers      10
    MaxClients          150
    MaxRequestsPerChild   0
</IfModule>

<IfModule mpm_worker_module>
    StartServers          2
    MinSpareThreads      25
    MaxSpareThreads      75 
    ThreadLimit          64
    ThreadsPerChild      25
    MaxClients          150
    MaxRequestsPerChild   0
</IfModule>

<IfModule mpm_event_module>
    StartServers          2
    MinSpareThreads      25
    MaxSpareThreads      75 
    ThreadLimit          64
    ThreadsPerChild      25
    MaxClients          150
    MaxRequestsPerChild   0
</IfModule>

User sarnobat
Group sarnobat

AccessFileName .htaccess

DefaultType None

HostnameLookups Off

ErrorLog $PWD/error.log

LogLevel debug

Listen 8080

LogFormat "%v:%p %h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" vhost_combined
LogFormat "%h %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined
LogFormat "%h %l %u %t \"%r\" %>s %O" common
LogFormat "%{Referer}i -> %U" referer
LogFormat "%{User-agent}i" agent
EOF
