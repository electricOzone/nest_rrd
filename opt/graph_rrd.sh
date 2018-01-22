#!/bin/bash

#sleep 10

graph_layout="--width 697 \
--height 301 \
--full-size-mode"

graph_layout_short="--width 697 \
--height 130 \
--full-size-mode"

rrdtool graph /var/www/nest/images/on_off_1d.png -a PNG \
--title="Last 24 Hours" \
${graph_layout_short} \
'DEF:hvac_state=/opt/nest/nest.rrd:hvac_state:LAST' \
'VDEF:hvac_state_avg=hvac_state,AVERAGE' \
'CDEF:hvac_time=hvac_state,POP,hvac_state_avg,24,*' \
'AREA:hvac_state#009e73:HVAC On' \
'GPRINT:hvac_time:AVERAGE:%2.1lf hours \n'

rrdtool graph /var/www/nest/images/1d.png -a PNG \
--title="Last 24 Hours" \
${graph_layout} \
'DEF:indoor_temp=/opt/nest/nest.rrd:indoor_temp:LAST' \
'DEF:outdoor_temp=/opt/nest/nest.rrd:outdoor_temp:LAST' \
'DEF:humidity=/opt/nest/nest.rrd:humidity:LAST' \
'LINE2:indoor_temp#009e73:Indoor Temp    ' \
'GPRINT:indoor_temp:AVERAGE:%2.0lf F avg' \
'GPRINT:indoor_temp:MAX:%2.0lf F max' \
'GPRINT:indoor_temp:MIN:%2.0lf F min' \
'GPRINT:indoor_temp:LAST:%2.0lf F now\n' \
'LINE2:outdoor_temp#cc79a7:Outdoor Temp   ' \
'GPRINT:outdoor_temp:AVERAGE:%2.0lf F avg' \
'GPRINT:outdoor_temp:MAX:%2.0lf F max' \
'GPRINT:outdoor_temp:MIN:%2.0lf F min' \
'GPRINT:outdoor_temp:LAST:%2.0lf F now\n' \
'LINE2:humidity#56b4e9:Indoor Humidity' \
'GPRINT:humidity:AVERAGE:%2.0lf %% avg' \
'GPRINT:humidity:MAX:%2.0lf %% max' \
'GPRINT:humidity:MIN:%2.0lf %% min' \
'GPRINT:humidity:LAST:%2.0lf %% now\n'

rrdtool graph /var/www/nest/images/on_off_7d.png -a PNG \
--title="Last 7 Days" \
--start -7d \
${graph_layout_short} \
'DEF:hvac_state=/opt/nest/nest.rrd:hvac_state:LAST' \
'VDEF:hvac_state_avg=hvac_state,AVERAGE' \
'CDEF:hvac_time=hvac_state,POP,hvac_state_avg,168,*' \
'AREA:hvac_state#009e73:HVAC On' \
'GPRINT:hvac_time:AVERAGE:%2.1lf hours \n'

rrdtool graph /var/www/nest/images/7d.png -a PNG \
--title="Last 7 Days" \
--start -7d \
${graph_layout} \
'DEF:indoor_temp=/opt/nest/nest.rrd:indoor_temp:LAST' \
'DEF:outdoor_temp=/opt/nest/nest.rrd:outdoor_temp:LAST' \
'DEF:humidity=/opt/nest/nest.rrd:humidity:LAST' \
'LINE2:indoor_temp#009e73:Indoor Temp    ' \
'GPRINT:indoor_temp:AVERAGE:%2.0lf F avg' \
'GPRINT:indoor_temp:MAX:%2.0lf F max' \
'GPRINT:indoor_temp:MIN:%2.0lf F min' \
'GPRINT:indoor_temp:LAST:%2.0lf F now\n' \
'LINE2:outdoor_temp#cc79a7:Outdoor Temp   ' \
'GPRINT:outdoor_temp:AVERAGE:%2.0lf F avg' \
'GPRINT:outdoor_temp:MAX:%2.0lf F max' \
'GPRINT:outdoor_temp:MIN:%2.0lf F min' \
'GPRINT:outdoor_temp:LAST:%2.0lf F now\n' \
'LINE2:humidity#56b4e9:Indoor Humidity' \
'GPRINT:humidity:AVERAGE:%2.0lf %% avg' \
'GPRINT:humidity:MAX:%2.0lf %% max' \
'GPRINT:humidity:MIN:%2.0lf %% min' \
'GPRINT:humidity:LAST:%2.0lf %% now\n'

rrdtool graph /var/www/nest/images/30d.png -a PNG \
--title="Last 30 Days" \
--start -30d \
${graph_layout} \
'DEF:indoor_temp=/opt/nest/nest.rrd:indoor_temp:LAST' \
'DEF:outdoor_temp=/opt/nest/nest.rrd:outdoor_temp:LAST' \
'DEF:humidity=/opt/nest/nest.rrd:humidity:LAST' \
'LINE2:indoor_temp#009e73:Indoor Temp    ' \
'GPRINT:indoor_temp:AVERAGE:%2.0lf F avg' \
'GPRINT:indoor_temp:MAX:%2.0lf F max' \
'GPRINT:indoor_temp:MIN:%2.0lf F min' \
'GPRINT:indoor_temp:LAST:%2.0lf F now\n' \
'LINE2:outdoor_temp#cc79a7:Outdoor Temp   ' \
'GPRINT:outdoor_temp:AVERAGE:%2.0lf F avg' \
'GPRINT:outdoor_temp:MAX:%2.0lf F max' \
'GPRINT:outdoor_temp:MIN:%2.0lf F min' \
'GPRINT:outdoor_temp:LAST:%2.0lf F now\n' \
'LINE2:humidity#56b4e9:Indoor Humidity' \
'GPRINT:humidity:AVERAGE:%2.0lf %% avg' \
'GPRINT:humidity:MAX:%2.0lf %% max' \
'GPRINT:humidity:MIN:%2.0lf %% min' \
'GPRINT:humidity:LAST:%2.0lf %% now\n'

rrdtool graph /var/www/nest/images/360d.png -a PNG \
--title="Last 360 Days" \
--start -360d \
${graph_layout} \
'DEF:indoor_temp=/opt/nest/nest.rrd:indoor_temp:LAST' \
'DEF:outdoor_temp=/opt/nest/nest.rrd:outdoor_temp:LAST' \
'DEF:humidity=/opt/nest/nest.rrd:humidity:LAST' \
'LINE2:indoor_temp#009e73:Indoor Temp    ' \
'GPRINT:indoor_temp:AVERAGE:%2.0lf F avg' \
'GPRINT:indoor_temp:MAX:%2.0lf F max' \
'GPRINT:indoor_temp:MIN:%2.0lf F min' \
'GPRINT:indoor_temp:LAST:%2.0lf F now\n' \
'LINE2:outdoor_temp#cc79a7:Outdoor Temp   ' \
'GPRINT:outdoor_temp:AVERAGE:%2.0lf F avg' \
'GPRINT:outdoor_temp:MAX:%2.0lf F max' \
'GPRINT:outdoor_temp:MIN:%2.0lf F min' \
'GPRINT:outdoor_temp:LAST:%2.0lf F now\n' \
'LINE2:humidity#56b4e9:Indoor Humidity' \
'GPRINT:humidity:AVERAGE:%2.0lf %% avg' \
'GPRINT:humidity:MAX:%2.0lf %% max' \
'GPRINT:humidity:MIN:%2.0lf %% min' \
'GPRINT:humidity:LAST:%2.0lf %% now\n'

rrdtool graph /var/www/nest/images/on_off_yesterday.png -a PNG \
--title="Yesterday" \
--end 00:00 \
${graph_layout_short} \
'DEF:hvac_state=/opt/nest/nest.rrd:hvac_state:LAST' \
'VDEF:hvac_state_avg=hvac_state,AVERAGE' \
'CDEF:hvac_time=hvac_state,POP,hvac_state_avg,24,*' \
'AREA:hvac_state#009e73:HVAC On' \
'GPRINT:hvac_time:AVERAGE:%2.2lf hours \n'

rrdtool graph /var/www/nest/images/on_off_2d_ago.png -a PNG \
--title="2 Days Ago" \
--end 00:00-1d \
${graph_layout_short} \
'DEF:hvac_state=/opt/nest/nest.rrd:hvac_state:LAST' \
'VDEF:hvac_state_avg=hvac_state,AVERAGE' \
'CDEF:hvac_time=hvac_state,POP,hvac_state_avg,24,*' \
'AREA:hvac_state#009e73:HVAC On' \
'GPRINT:hvac_time:AVERAGE:%2.2lf hours \n'

rrdtool graph /var/www/nest/images/on_off_3d_ago.png -a PNG \
--title="3 Days Ago" \
--end 00:00-2d \
${graph_layout_short} \
'DEF:hvac_state=/opt/nest/nest.rrd:hvac_state:LAST' \
'VDEF:hvac_state_avg=hvac_state,AVERAGE' \
'CDEF:hvac_time=hvac_state,POP,hvac_state_avg,24,*' \
'AREA:hvac_state#009e73:HVAC On' \
'GPRINT:hvac_time:AVERAGE:%2.2lf hours \n'

rrdtool graph /var/www/nest/images/on_off_4d_ago.png -a PNG \
--title="4 Days Ago" \
--end 00:00-3d \
${graph_layout_short} \
'DEF:hvac_state=/opt/nest/nest.rrd:hvac_state:LAST' \
'VDEF:hvac_state_avg=hvac_state,AVERAGE' \
'CDEF:hvac_time=hvac_state,POP,hvac_state_avg,24,*' \
'AREA:hvac_state#009e73:HVAC On' \
'GPRINT:hvac_time:AVERAGE:%2.2lf hours \n'

rrdtool graph /var/www/nest/images/on_off_5d_ago.png -a PNG \
--title="5 Days Ago" \
--end 00:00-4d \
${graph_layout_short} \
'DEF:hvac_state=/opt/nest/nest.rrd:hvac_state:LAST' \
'VDEF:hvac_state_avg=hvac_state,AVERAGE' \
'CDEF:hvac_time=hvac_state,POP,hvac_state_avg,24,*' \
'AREA:hvac_state#009e73:HVAC On' \
'GPRINT:hvac_time:AVERAGE:%2.2lf hours \n'
