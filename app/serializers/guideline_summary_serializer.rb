class GuidelineSummarySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :url, :title

  def url
    guideline_url(object)
  end

end
