require_relative '../../spec_helper'

describe Allmenus::Connection do
  subject { Allmenus::Connection }
  describe '.api_url' do
    it 'return the url of the api' do
      subject.api_url.must_equal 'http://api.allmenus.com'
    end
  end
end
