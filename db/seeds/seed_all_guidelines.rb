require 'rss'
require 'open-uri'

class SeedAllGuidelines

  def call
    url = 'https://www.guideline.gov/rssFiles/ngc_complete.xml'
    rss_url = open(url) 
    feed = RSS::Parser.parse(rss_url)
    items = feed.channel.items

    items.each do |item|
      if item.title && item.title.start_with?("Guideline Summary:")
        # Hate to inspect each title, but there's no easy way to determine 
        # whether the feed item is a guideline. :(

        p item.title
        import_guideline(item.link)
      end
    end
  end

  private

  def import_guideline(url)
    guideline = Guideline.where(url: url).first_or_create!

    if guideline.recommendation.nil? && guideline.title.nil?
      MedDataDepot::Guideline.import_guideline.call(guideline.id)
    end
  end

end
