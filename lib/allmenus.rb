require 'rack'
require 'faraday'
require 'json'
Dir[File.dirname(__FILE__) + '/allmenus/*.rb'].each do |file|
  require file
end

module Allmenus
  class<<self
    attr_accessor :config
  end

  def self.configure
    self.config = Allmenus::Configuration.new.tap do |configuration|
      yield(configuration)
    end
  end
end
