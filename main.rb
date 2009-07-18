#!/usr/bin/env ruby
require 'optparse'
require 'rubygems'
require 'ruby-station'; RubyStation.parse_argv
require 'ramaze'

$LOAD_PATH.unshift __DIR__("./")
require 'controller/init.rb'
require 'model/init.rb'

#module LifeLog
#  VERSION = File.read(__DIR__("./VERSION"))
#end

Ramaze.start :port => RubyStation.port,
             :root => __DIR__('./')
