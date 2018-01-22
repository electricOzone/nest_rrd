#!/usr/bin/python3
#Author: Lane Russell
#This program performs a GET to retrieve temperature, humidity, 
#and system state from a NEST thermostat.

import requests, subprocess

thermostat_device_id = 'NEST_DEVICE_ID'   #this should be updated with the thermostat_id, beginning with a_

#read auth files
with open('/opt/nest/nest_auth', 'r') as auth_file:
	nest_auth = str(auth_file.read())
auth_file.closed
nest_auth = nest_auth.rstrip('\n')

with open('/opt/nest/wunderground_auth', 'r') as auth_file:
        wunderground_auth = str(auth_file.read())
auth_file.closed
wunderground_auth = wunderground_auth.rstrip('\n')

#build url and headers, including auth as necessary
nest_url = 'https://developer-api.nest.com/devices/thermostats/' + thermostat_device_id
nest_headers = {'Content-Type':'application/json','Authorization':'Bearer ' + nest_auth}
wunderground_url = 'http://api.wunderground.com/api/' + wunderground_auth  + '/conditions/q/STATE_CODE/CITY_NAME.json'
wunderground_headers = {'Content-Type':'application/json'}

#perform GET requests from Nest and Wunderground
nest_request = requests.get(nest_url, headers=nest_headers, allow_redirects=False)
if nest_request.status_code == 307:
	nest_request = requests.get(nest_request.headers['Location'], headers=nest_headers, allow_redirects=False)

wunderground_request = requests.get(wunderground_url, headers=wunderground_headers)

#parse variables out of json
indoor_temp = int(nest_request.json()['ambient_temperature_f'])
outdoor_temp = float(wunderground_request.json()['current_observation']['temp_f'])
indoor_humidity = int(nest_request.json()['humidity'])
hvac_state = str(nest_request.json()['hvac_state'])
hvac_state_num = 0

if (hvac_state == 'off'):
	hvac_state_num = 0
else:
	hvac_state_num = 1

rrdstring = '/usr/bin/rrdtool update /opt/nest/nest.rrd N:' + str(indoor_temp) + ':' + str(outdoor_temp) + ':' + str(indoor_humidity) + ':' + str(hvac_state_num)

subprocess.check_output(rrdstring, shell=True)
