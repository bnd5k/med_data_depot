
Given(/^an incomplete guideline$/) do
  @incomplete_guideline = Guideline.first_or_create(url: "http://www.guideline.gov/content.aspx?f=rss&id=38490")
end

When(/^I import the recommendation$/) do
  MedDataDepot::Guideline.import_guideline_recommendation.call(@incomplete_guideline.id)
end

Then(/^the guideline contains data for the recommendation$/) do
  recommendation = MedDataDepot::Scraper.search_for_content(
    @incomplete_guideline,
    MedDataDepot::Guideline.import_guideline_recommendation.class::RECOMMENDATION_LOCATION
  )

  @incomplete_guideline.reload

  expect(@incomplete_guideline.recommendation).to eq recommendation

  #fixme: speed up tests by just verifying we called expected method. e.g.
  # expect(@incomplete_guideline).to receive(:update!).with(
  #   guideline.update!(recommendation: recommendation)
  # )

end
