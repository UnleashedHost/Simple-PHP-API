# Simple-PHP-API

Simple-PHP-API is a as simple-as-possible server-side script execution interface.
It works by utilising PHP and its exec function. When you navigate your browser to **/php/sample.php**
it essentially executes a shell script located in **/sh**.

#### Attention ! Make sure you set-up your permissions accordingly as some scripts may require root access to run

In here there are a few preconfigured endpoints:

⋅⋅* Disk Usage report (df -h)
⋅⋅* Pterodactyl daemon (start and stop via systemctl)
⋅⋅* Pterodactyl panel (php artisan up & down)
⋅⋅* Portainer create and start
⋅⋅* Nginx restart

#### If you want to use nginx with it and hide the .php extension please edit your site configuration
#### to include this:

```location / {
    try_files $uri $uri.html $uri/ @extensionless-php;
    index index.html index.htm index.php;
}

location ~ \.php$ {
    try_files $uri =404;
}

location @extensionless-php {
    rewrite ^(.*)$ $1.php last;
}
```

### Contributing

Feel free to fork it or open a pull request with your changes etc..