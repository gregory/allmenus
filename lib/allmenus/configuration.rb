module Allmenus
  class Configuration < Struct.new(:api_key, :log_request)
    def initialize
      @log_request = false
    end
  end
end
