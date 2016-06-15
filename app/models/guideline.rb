class Guideline < ApplicationRecord
  
  def complete?
    title && condition && recommendation
  end

end
