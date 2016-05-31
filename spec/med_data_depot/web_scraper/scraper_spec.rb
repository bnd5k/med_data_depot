require 'med_data_depot/web_scraper/scraper'

describe MedDataDepot::WebScraper::Scraper do
  let(:uri) { 'http://www.example.com' }
  let(:location) { '#ctl00_ContentPlaceHolder1_dlXML_ctl03_rptField_ctl00_divOuter' }

  let(:nokogiri_mock) { double(:nokogiri_mock) }
  let(:document) { double }

  let(:scraper_logger) { double(:scraper_logger) }

  subject { described_class }

  before do
    allow(Nokogiri::HTML).to receive(:any_args).and_return(nokogiri_mock)

  end
  it 'returns nil when unable to find content at location in document' do
    # allow(Nokogiri::HTML).to receive(:open).

        # found_content = doc.search('#ctl00_ContentPlaceHolder1_dlXML_ctl03_rptField_ctl00_divOuter')
    expect(subject.search_for_content(uri, location)).to be_nil
  end

  it 'returns html when finds content at location in document' do
    barf = open(uri)

    allow(nokogiri_mock).to receive(HTML).with(barf).and_return(
      document
    )

        # found_content = doc.search('#ctl00_ContentPlaceHolder1_dlXML_ctl03_rptField_ctl00_divOuter')
    expect(subject.search_for_content(uri, location)).to be_nil

  end

end
