require 'med_data_depot/guideline/list'

describe MedDataDepot::Guideline::List do
  let(:guideline_model) { double(:guideline_model) }
  let(:guideline) { double(:guideline, id: 123, url: 'www.barf.com') }


  subject { described_class.new(guideline_model) }

  it 'returns an array of guidelines' do
    allow(guideline_model).to receive(:all).and_return([guideline, guideline])

    expect(subject.call).to eq [guideline, guideline]
  end
end
