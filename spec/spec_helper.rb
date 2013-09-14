require 'rubygems'
require 'bundler/setup'
Bundler.require(:test)

require_relative '../lib/allmenus'
require 'minitest/autorun'
require 'minitest/pride'
require 'webmock/minitest'

Turn.config do |c|
  c.format  = :outline
  c.natural = true
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/allmenus_cassettes'
  c.hook_into :webmock
end
