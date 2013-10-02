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
    subject{ Allmenus::Menu.find(294063) }

    it 'returns a new menu with 2 groups' do
      subject.id.must_equal 294063
      subject.groups.size.must_equal 2
    end
  end
end
