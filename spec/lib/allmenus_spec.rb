require_relative '../spec_helper'

describe Allmenus do
  subject { Allmenus }

  describe '.configure' do
    let(:app_key) { 'THE_APP_KEY' }

    before do
      subject.configure do |config|
        config.app_key = app_key
      end
    end

    it 'has an appropriate app_key' do
      subject.config.app_key.must_equal app_key
    end
  end
end
