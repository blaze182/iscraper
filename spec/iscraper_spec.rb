require 'spec_helper'

describe Iscraper do
  it 'has a version number' do
    expect(Iscraper::VERSION).not_to be nil
  end

  it 'returns warranty status and date', :vcr do
    warranty = Iscraper.get_warranty_status '013977000323877'
    expect(warranty[:warranty_status]).to eq true
    expect(warranty[:expiration_date]).to be >= Date.today
  end

  it 'returns expired status', :vcr do
    warranty = Iscraper.get_warranty_status '013896000639712'
    expect(warranty[:warranty_status]).to eq false
  end

  it 'returns error for invalid imei', :vcr do
    warranty = Iscraper.get_warranty_status "12345"
    expect(warranty[:error]).to include("Incorrect IMEI")
  end
end
