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
      response = self.connection.get(self.uri(params))
      self.handle_response(response)
    end

    def self.handle_response(response)
      response_body = response.body.gsub(/\t|\n/, ' ') # Hack around the bad json response
      ::JSON.parse(response_body) if response.status == 200
    end

    def self.uri query_params
      params = {
        v: API_VERSION,
        api_key: ::Allmenus.config.api_key
      }
      params.merge! query_params
      q = ::Rack::Utils.build_query params
      "/restaurant?#{q}"
    end

    def self.url
      API_URL
    end
  end
end
