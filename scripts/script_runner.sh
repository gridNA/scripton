#!/bin/bash -l

eval "$(/usr/local/bin/rbenv init -)"
/usr/local/bin/rbenv local 2.2.3

ruby $HOME/Projects/Scripton/script.rb
