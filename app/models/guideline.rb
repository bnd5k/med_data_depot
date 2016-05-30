class Guideline < ApplicationRecord
  
  def complete?
    text && title
  end

end
