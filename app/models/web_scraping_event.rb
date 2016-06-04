class WebScrapingEvent < ApplicationRecord

  EVENT_TYPES = { not_found: 1, timeout: 2, no_connection: 3  }

end
