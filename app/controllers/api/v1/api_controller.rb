module API
  module V1
    class APIController < ActionController::API
       include JSONAPI::ActsAsResourceController

    end
  end
end
