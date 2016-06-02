Rails.application.routes.draw do

  namespace :api, defaults: { format: 'json' } do
    constraints MedDataDepot::Constraints::APIVersion.new(1) do
      scope :module => :v1 do
        resources :guidelines
      end
    end
  end

  root to: "welcome#index"


end
