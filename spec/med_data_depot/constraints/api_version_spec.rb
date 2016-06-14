require 'med_data_depot/constraints/api_version'

describe MedDataDepot::Constraints::APIVersion do
  let(:version) { 1 }

  def request(accept_headers = '')
    headers = {
      "Accept" => accept_headers
    }
    double(:request, headers: headers)
  end

  subject { described_class.new(version) }

  it 'uses a default version if no version specified in request' do
    expect(subject.matches?(request)).to be_truthy
  end

  it 'uses a default version if no version specified in request' do
    req =  request("application/json")
    expect(subject.matches?(request)).to be_truthy
  end

  it 'uses a default version if version specified' do
    req =  request("application/vnd.api+json")
    expect(subject.matches?(req)).to be_truthy
  end

end

