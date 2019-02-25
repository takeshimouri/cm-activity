#!/bin/bash
mysql -udocker -pdocker -Dccwebdb -h127.0.0.1 -e "LOAD DATA LOCAL INFILE "importdata.csv" INTO TABLE cm_aclg FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';"
