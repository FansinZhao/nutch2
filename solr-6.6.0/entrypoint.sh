#!/usr/bin/env bash
solr start -force
solr create_core -force -c nutch -d $SOLR/server/solr/configsets/nutch/conf

tail -f $SOLR/server/logs/solr.log
 
