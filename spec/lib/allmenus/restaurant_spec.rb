require_relative '../../spec_helper'
describe Allmenus::Restaurant do
  subject{ Allmenus::Restaurant }

  before do
    VCR.insert_cassette 'restaurant'
  end
  after do
    VCR.eject_cassette
  end

  describe '.find' do
    subject { Allmenus::Restaurant.find(294063) }

    it 'returns a new restaurant' do
      subject.must_be_instance_of Allmenus::Restaurant
    end

    [:name, :phone_number, :address, :city, :state, :zip_code].each do |attribute|
      it "returns a restaurant with a #{attribute}" do
        subject.must_respond_to attribute
        subject.send(attribute).wont_be_nil
      end
    end

    it 'returns a restaurant with a location' do
      subject.must_respond_to :location
      subject.location.must_be_instance_of Allmenus::Location
    end
  end
end
