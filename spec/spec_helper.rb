# require File.dirname(__FILE__) + '/../../../../spec/spec_helper'
require 'rubygems'
require 'active_support'
require 'active_record'
require 'spec'

TEST_DATABASE_FILE = File.join(File.dirname(__FILE__), '..', 'test.sqlite3')

File.unlink(TEST_DATABASE_FILE) if File.exist?(TEST_DATABASE_FILE)
ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3", "database" => TEST_DATABASE_FILE
)

RAILS_DEFAULT_LOGGER = Logger.new(File.join(File.dirname(__FILE__), "debug.log"))

load(File.dirname(__FILE__) + '/schema.rb')

$: << File.join(File.dirname(__FILE__), '..', 'lib')
require File.join(File.dirname(__FILE__), '..', 'init')

# InvisionUser.blueprint do
#   name { Faker::Internet.user_name }
#   mgroup { 1 }
#   email { Faker::Internet.email }
#   converge { InvisionUserConverge.make }
#   member { nil }
#   persistence_token { 'b18f1a5dc276001e6fe20139d5522755e414cdee' }
# end
# InvisionUser.blueprint(:admin) do
#   mgroup { 4 }
# end
# 
# InvisionUserConverge.blueprint do
#   converge_pass_hash { '9c4acc137217b795b4d487bba53f5e7d' } # pass!word salted with 'salt'
#   converge_pass_salt { 'salt' }
# end