Rails.application.routes.draw do

  scope :module => :api, defaults: { format: 'json' } do
    constraints MedDataDepot::Constraints::APIVersion.new(1) do
     scope :module => :v1 do
       jsonapi_resources :guidelines
      end
    end
  end

  root to: "welcome#index"

end
