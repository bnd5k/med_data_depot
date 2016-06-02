############# Helpers

def validate_guideline(data)
  expect(data["url"]).to be_a_kind_of(String)
  expect(data["title"]).to be_a_kind_of(String)
  expect(data["recommendation"]).to be_a_kind_of(String)
end

############# given

Given(/^an incomplete guideline$/) do
  @incomplete_guideline = Guideline.first_or_create(url: "http://www.guideline.gov/content.aspx?f=rss&id=38490")
end

Given(/^the system contains the following guidelines:$/) do |table|
  table.hashes.each do |hsh|

    Guideline.where(
      url: hsh["url"],
      title: hsh["title"],
      recommendation: hsh["recommendation"]
    ).first_or_create
  end
end

############# when

When(/^I import the recommendation$/) do
  MedDataDepot::Guideline.import_guideline.call(@incomplete_guideline.id)
end


When(/^the client requests a list of (.*?)s?$/) do |type|
  get_api_resource(type)
end

When(/^the client requestes the ([^"]*) containing the URL "([^"]*)"$/) do |type, url|
  guideline = Guideline.find_by_url(url)

  get_api_resource(type, id: guideline.id)
end

############ then

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

Then(/^the response contains (#{CAPTURE_INT}) (.*?)s?$/) do |count, type|
  response_body  = MultiJson.load(last_response.body)
  validate_list(response_body["data"], of: type, count: count)
end


Then(/(#{CAPTURE_INT}) (?:.*?) ha(?:s|ve) the following attributes:$/) do |count, table|

  expected_item = table.hashes.each_with_object({}) do |row, hash|
    name, value, type = row["attribute"], row["value"], row["type"]
    hash[name.tr(" ", "_").camelize(:lower)] = value #.to_type(type.constantize)
  end

  data = MultiJson.load(last_response.body)["data"]
  matched_items = data.select { |item| item["attributes"] == expected_item }
  expect(matched_items.count).to eq(count)
end
