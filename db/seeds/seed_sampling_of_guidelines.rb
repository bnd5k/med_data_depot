class SeedSamplingOfGuidelines


  def call
    urls = [
      "http://guideline.gov/content.aspx?id=46236",
      "http://guideline.gov/content.aspx?id=37959",
      "http://guideline.gov/content.aspx?id=39240",
      "http://guideline.gov/content.aspx?id=36059",
      "http://guideline.gov/content.aspx?id=36054",
      "http://guideline.gov/content.aspx?id=49538",
      "http://guideline.gov/content.aspx?id=48058"
    ]

    urls.each do |guideline_url|

      guideline = Guideline.where(url: guideline_url).first_or_create!

      unless guideline.complete?
        MedDataDepot::Guideline.import_guideline.call(guideline.id)
      end
      #It's inefficient to create the record and then update it, but this
      #process mimics apps behavior, where the import would be done off cycle

    end
  end
end
