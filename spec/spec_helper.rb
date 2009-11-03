# require File.dirname(__FILE__) + '/../../../../spec/spec_helper'
require 'rubygems'
require 'active_support'
require 'active_record'
require 'spec'

require 'invision_bridge'
require File.expand_path(File.dirname(__FILE__) + "/blueprints")

TEST_DATABASE_FILE = File.join(File.dirname(__FILE__), '..', 'test.sqlite3')

File.unlink(TEST_DATABASE_FILE) if File.exist?(TEST_DATABASE_FILE)
ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3", "database" => TEST_DATABASE_FILE
)

RAILS_DEFAULT_LOGGER = Logger.new(File.join(File.dirname(__FILE__), "debug.log"))

load(File.dirname(__FILE__) + '/schema.rb')

$: << File.join(File.dirname(__FILE__), '..', 'lib')
require File.join(File.dirname(__FILE__), '..', 'init')