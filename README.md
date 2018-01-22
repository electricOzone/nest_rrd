# nest_rrd
Pulls data from Nest &amp; Wunderground APIs and graphs it using RRD.

1. Place all scripts in /opt/nest
2. Run create_nest_rrd.sh to create RRD file
3. Create files for API keys in /opt/nest:
   - nest_auth
   - wunderground_auth

4. Create directory /var/www/nest and /var/www/nest/images
5. Place index.html and history.html in /var/www/nest
6. Ensure apache2 is installed
7. Place 001-nest.conf in /etc/apache2/sites-available/001-nest.conf
8. Enable site using a2ensite 001-nest.conf

Screenshots:

![alt text](https://raw.githubusercontent.com/electricOzone/nest_rrd/master/nest_rrd_home.png)

![alt text](https://raw.githubusercontent.com/electricOzone/nest_rrd/master/nest_rrd_history.png)
