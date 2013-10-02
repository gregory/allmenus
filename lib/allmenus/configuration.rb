module Allmenus
  class Configuration < Struct.new(:api_key, :log_request)
    def log_request
      self[:log_request] || false
    end
  end
end
