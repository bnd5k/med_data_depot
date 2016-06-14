module API
  module V1
    class GuidelineResource < JSONAPI::Resource

      attributes :title, :condition, :url, :recommendation

    end
  end
end
