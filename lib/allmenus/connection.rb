module Allmenus
  class Connection
    API_URL     = 'http://api.allmenus.com'
    API_VERSION = '2'

    def self.connection(faraday_adapter=Faraday.default_adapter)
      Faraday.new(url: self.url) do |faraday|
        faraday.response :logger if Allmenus.config.log_request# log the requests to stdout
        faraday.adapter faraday_adapter
      end
    end

    def self.get(params={})
      self.connection.get(self.uri(params)).tap do |response|
        response.env[:body] = response.body.gsub(/\t|\n/, '') #clean the dirty response
      end
    end

    def self.uri query_params
      params = {
        v: API_VERSION,
        api_key: ::Allmenus.config.api_key
      }
      query_params.merge! params
      q = ::Rack::Utils.build_query query_params
      "/restaurant?#{q}"
    end

    def self.url
      API_URL
    end
  end
end
