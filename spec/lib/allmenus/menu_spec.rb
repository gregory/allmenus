require_relative '../../spec_helper'
describe Allmenus::Menu do
  subject{ Allmenus::Menu }

  before do
    VCR.insert_cassette 'menu', record: :new_episodes
  end
  after do
    VCR.eject_cassette
  end

  describe '.find' do
    subject{ Allmenus::Menu.find(58736) }

    it 'returns a new menu with at least 1 group' do
      subject.id.must_equal 58736
    end
  end
end
