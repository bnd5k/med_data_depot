module API
  module V1
    class GuidelineResource < JSONAPI::Resource

      attributes :title, :url, :recommendation

    end
  end
end
