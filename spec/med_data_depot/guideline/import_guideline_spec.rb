require 'med_data_depot/guideline/import_guideline_recommendation'

describe MedDataDepot::Guideline::ImportGuidelineRecommendation do
  let(:guideline_model) { double(:guideline_model) }
  let(:guideline_record) { double(:guideline_record, id: 123, url: 'www.barf.com') }
  let(:scraper) { double(:scraper) }
  let(:recommendation_html) { "<h1>Hello World!</h1>" }

  subject { described_class.new(guideline_model, scraper) }

  it 'fails gracefully when unable to find guideline locally' do
    allow(guideline_model).to receive(:find_by_id).with(guideline_record.id).and_return(nil)

    expect(subject.call(guideline_record.id)).to be_nil
  end

  it 'fails gracefull when unable to scrape HTML file' do
    allow(guideline_model).to receive(:find_by_id).with(guideline_record.id).and_return(nil)

    allow(scraper).to receive(:search_for_content).with(
      guideline_record.url,
      described_class::RECOMMENDATION_LOCATION
    ).and_return(nil)

    expect(subject.call(guideline_record.id)).to be_nil
  end

  it 'imports data from Guidelines.gov' do
    allow(guideline_model).to receive(:find_by_id).with(guideline_record.id).and_return(guideline_record)

    allow(scraper).to receive(:search_for_content).with(
      guideline_record.url,
      described_class::RECOMMENDATION_LOCATION
    ).and_return(recommendation_html)

    allow(guideline_record).to receive(:update!).with(
      recommendation: recommendation_html
    ).and_return(guideline_record)

    expect(subject.call(guideline_record.id)).to eq guideline_record
  end

end
