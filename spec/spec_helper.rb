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

MiniTest::Spec.before :each do
  Allmenus.configure do |c|
    c.api_key = ENV['ALLMENUS_API_KEY']
  end
end
