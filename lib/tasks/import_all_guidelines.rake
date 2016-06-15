require './db/seeds/seed_all_guidelines'

namespace :mdd do
  task :import_all => :environment do |t, args|

    SeedAllGuidelines.new.call

  end
end
