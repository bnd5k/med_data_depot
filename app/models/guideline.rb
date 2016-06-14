class Guideline < ApplicationRecord
  
  def complete?
    text && title && condition
  end

end
