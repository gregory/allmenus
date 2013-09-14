require_relative '../spec_helper'

describe Allmenus do
  subject { Allmenus }

  describe '.configure' do
    let(:api_key) { 'THE_api_key' }

    before do
      subject.configure do |config|
        config.api_key = api_key
      end
    end

    it 'has an appropriate api_key' do
      subject.config.api_key.must_equal api_key
    end
  end
end
