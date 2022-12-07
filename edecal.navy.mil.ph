map $uri $pretty_url {
    ~/(.*)$    $1;
}

server {

	root /var/www/edecal.navy.mil.ph;

	# Add index.php to the list if you are using PHP
	index index.html index.php;

	server_name edecal.navy.mil.ph;
	
	error_page 403 /403.php;
	error_page 404 /404.php;


	location / {
		try_files $uri $uri/ @extensionless-php;
	}
	
	location ^~ /robots.txt {
        	 alias /var/www/edecal.navy.mil.ph/robots.txt;
    	}

		
	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
		fastcgi_param PHP_VALUE "auto_prepend_file=/var/www/edecal.navy.mil.ph/waf.php";
	}

	location @extensionless-php {
        	if ( -f $document_root$uri.php ) {
            		rewrite ^ $uri.php last;
        	}
			rewrite ^/view/([0-9]+)/([A-Za-z0-9-=]+)/?$ /view.php?id=$1&from=$2 last;	
			rewrite ^/decal-mgmt/download/([0-9]+)/?$ /decal-mgmt/download.php?decalid=$1 last;
			rewrite ^/decal-mgmt/view/([0-9]+)/([A-Za-z0-9-=]+)/?$ /decal-mgmt/view-request.php?id=$1&from=$2 last;
			rewrite ^/decal-mgmt/view-user/([0-9]+)/?$ /decal-mgmt/view-user.php?id=$1 last;
			rewrite ^/decal-mgmt/edit-admin/([0-9]+)/?$ /decal-mgmt/edit.admin.account.php?id=$1 last;
    }
	

	location ~ /\.ht {
		deny all;
	}

    add_header 'Access-Control-Allow-Origin' 'edecal.navy.mil.ph' always;
    add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS' always;
    add_header 'Access-Control-Allow-Headers' 'DNT,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Range' always;
 
    
    add_header Permissions-Policy "camera=()";
    add_header Referrer-Policy "strict-origin";
    add_header X-Frame-Options "SAMEORIGIN" always;
    add_header X-Content-Type-Options "nosniff" always;
    add_header X-Download-Options "noopen" always;
    add_header X-Permitted-Cross-Domain-Policies "none" always;
    add_header X-Robots-Tag "none" always;
    add_header X-XSS-Protection "1; mode=block" always;
    add_header Strict-Transport-Security "max-age=15768000; includeSubDomains; preload;" always;
    add_header Expect-CT 'enforce; max-age=7776000';    
       
    listen 443; 
	ssl on;
	ssl_protocol TLSv1 TLSv1.1 TLSv1.2;
    ssl_certificate /etc/ssl/live/edecal.navy.mil.ph/fullchain.pem; 
    ssl_certificate_key /etc/ssl/live/edecal.navy.mil.ph/privkey.pem; 
    
}


server {
    if ($host = edecal.navy.mil.ph) {
        return 301 https://$host$request_uri;
    } 


	listen 80;
	listen [::]:80;

	server_name edecal.navy.mil.ph;
    return 404; 


}
