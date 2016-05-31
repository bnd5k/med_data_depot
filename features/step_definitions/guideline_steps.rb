
Given(/^an incomplete guideline$/) do
  @incomplete_guideline = Guideline.first_or_create(url: "http://www.guideline.gov/content.aspx?f=rss&id=38490")
end

When(/^I import the recommendation$/) do
  MedDataDepot::Guideline.import_guideline.call(@incomplete_guideline.id)
end

Then(/^the guideline contains data for the recommendation$/) do
  title, recommendation = MedDataDepot::Scraper.search_for_title_and_content(
    @incomplete_guideline,
    MedDataDepot::Guideline.import_guideline.class::GUIDELINE_TITLE_LOCATION,
    MedDataDepot::Guideline.import_guideline.class::RECOMMENDATION_LOCATION
  )

  @incomplete_guideline.reload

  expect(@incomplete_guideline.title).to eq title
  expect(@incomplete_guideline.recommendation).to eq recommendation

  #fixme: speed up tests by just verifying we called expected method. e.g.
  # expect(@incomplete_guideline).to receive(:update!).with(
  #   guideline.update!(recommendation: recommendation)
  # )

end
