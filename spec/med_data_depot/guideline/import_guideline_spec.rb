require 'med_data_depot/guideline/import_guideline'

describe MedDataDepot::Guideline::ImportGuideline do
  let(:guideline_model) { double(:guideline_model) }
  let(:guideline_record) { double(:guideline_record, id: 123, url: 'www.barf.com') }
  let(:scraper) { double(:scraper) }
  let(:guideline_title) { "<h1>Hello World!</h1>" }
  let(:condition) { "barfitis" }
  let(:recommendation_html) { "<h2>Blah Blah Blah</h2>" }

  subject { described_class.new(guideline_model, scraper) }

  it 'fails gracefully when unable to find guideline locally' do
    allow(guideline_model).to receive(:find_by_id).with(guideline_record.id).and_return(nil)

    expect(subject.call(guideline_record.id)).to be_nil
  end

  it 'fails gracefull when unable to scrape HTML file' do
    allow(guideline_model).to receive(:find_by_id).with(guideline_record.id).and_return(nil)

    allow(scraper).to receive(:search_for_title_and_content).with(
      guideline_record.url,
      described_class::GUIDELINE_TITLE_LOCATION,
      described_class::CONDITION_LOCATION,
      described_class::RECOMMENDATION_LOCATION
    ).and_return(nil)

    expect(subject.call(guideline_record.id)).to be_nil
  end

  it 'imports data from Guidelines.gov' do
    allow(guideline_model).to receive(:find_by_id).with(guideline_record.id).and_return(guideline_record)

    scraping_result = { title: guideline_title, condition: condition, recommendation: recommendation_html }

    allow(scraper).to receive(:search_for_title_and_content).with(
      guideline_record.url,
      described_class::GUIDELINE_TITLE_LOCATION,
      described_class::CONDITION_LOCATION,
      described_class::RECOMMENDATION_LOCATION
    ).and_return(scraping_result)

    allow(guideline_record).to receive(:update!).with(
      title: guideline_title,
      condition: condition,
      recommendation: recommendation_html
    ).and_return(guideline_record)

    expect(subject.call(guideline_record.id)).to eq guideline_record
  end

end
