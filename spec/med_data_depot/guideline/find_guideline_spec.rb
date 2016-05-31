require 'med_data_depot/guideline/find_guideline'

describe MedDataDepot::Guideline::FindGuideline do
  let(:guideline_model) { double(:guideline_model) }
  let(:guideline) { double(:guideline, id: 123, url: 'www.barf.com') }


  subject { described_class.new(guideline_model) }

  it 'returns nil when unable to find guideline' do
    allow(guideline_model).to receive(:find_by_id).with(guideline.id).and_return(nil)

    expect(subject.call(guideline.id)).to be_nil
  end

  it 'returns guideline' do
    allow(guideline_model).to receive(:find_by_id).with(guideline.id).and_return(guideline)

    expect(subject.call(guideline.id)).to eq guideline
  end
end
