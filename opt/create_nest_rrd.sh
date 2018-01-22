#!/bin/bash

rrdtool create nest.rrd \
--start N --step 300 \
DS:indoor_temp:GAUGE:600:U:U \
DS:outdoor_temp:GAUGE:600:U:U \
DS:humidity:GAUGE:600:U:U \
DS:hvac_state:GAUGE:600:U:U \
RRA:LAST:0.5:1:105192
