#!/bin/bash
mysql -udocker -pdocker -Dccwebdb -h127.0.0.1 -e "SELECT * FROM cm_aclg INTO OUTFILE’importdata.csv’ FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';"

