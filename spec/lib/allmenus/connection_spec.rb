require_relative '../../spec_helper'

describe Allmenus::Connection do
  subject { Allmenus::Connection }

  describe '.url' do
    it 'returns the url of the api' do
      subject.url.must_equal 'http://api.allmenus.com'
    end
  end

  describe '.uri' do
    let(:api_key) { ENV['ALLMENUS_API_KEY'] }
    let(:params) do
      {
        restaurant_id: 12345,
        type:          'request_type',
        return_type:   'json'
      }
    end

    before do
      Allmenus.configure do |c|
        c.api_key = api_key
      end
    end

    it 'contains the required parameters in the uri' do
      uri = subject.uri(params)

      uri.must_match %r{restaurant\?}
      uri.must_match Regexp.new("type=#{params[:type]}")
      uri.must_match Regexp.new("restaurant_id=#{params[:restaurant_id]}")
      uri.must_match Regexp.new("v=#{subject::API_VERSION}")
      uri.must_match Regexp.new("api_key=#{api_key}")
    end
  end

  describe '.connection(faraday_adapter)' do
    let(:faraday_adapter) { Faraday::Adapter::NetHttp }

    it 'returns a Faraday::Connection with the right params' do
      connection = subject.connection(Faraday.default_adapter)
      connection.must_be_instance_of Faraday::Connection
      connection.builder.handlers.must_include faraday_adapter
    end

    it 'returns a Faraday::Connection with a default adapter' do
      subject.connection.builder.handlers.must_include faraday_adapter
    end

    it "wont log the request by default" do
      subject.connection.builder.handlers.wont_include Faraday::Response::Logger
    end
  end

  describe '.get(params)' do
    before do
      VCR.insert_cassette 'restaurant', record: :new_episodes
    end
    after do
      VCR.eject_cassette
    end

    let(:params) do
      {
        restaurant_id: 294063,
        type:          'info',
        return_type:   'json'
      }
    end

    it 'return a response form allmenus' do
      response = subject.get(params)
    end
  end
end
