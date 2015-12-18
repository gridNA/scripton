#!/bin/bash -l

process_id=`ps aux|grep "ruby $HOME/Projects/ios-app/ruby_1.rb"|grep -v grep | awk '{ print $2 }'`
kill -9 $process_id
