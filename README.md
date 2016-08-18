# ng2-pgdoc
UI to display information about a postgreSQL database 

## Prerequisites:

- Backend:
 - PostgreSQL server 9.1 or higher
 - PHP 5.5 or higher

## Backend install

- Install necessary PHP modules
```sh
$ composer install
```

- copy `config.inc.php.sample` to `config.inc.php`
- copy `config.sh.sample` to `config.sh`
- edit these 2 files with the name and credentials of your database you want to display information
- run the following script, which will add a `pgdoc` schema to your database and some procedures in this schema:

```sh
$ (cd sql && ./install.sh)
```
- serve the subdirectory backend/htdocs with your preferred web server
- Apache2 configuration:
```
<VirtualHost *:80>
  [...]
  Alias /pg "/path/to/ng2-pgdoc/backend/htdocs"
  <Directory "/path/to/ng2-pgdoc/backend/htdocs">
      Options Indexes MultiViews FollowSymlinks
      AllowOverride None
      Order allow,deny
      Allow from all
      RewriteEngine on
      RewriteCond %{REQUEST_FILENAME} !-d
      RewriteCond %{REQUEST_FILENAME} !-f
      RewriteRule ^(.*)$ /pg/index.php?o=$1 [L,QSA]
  </Directory>
</VirtualHost>
```
