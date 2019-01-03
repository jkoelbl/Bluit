class UserProfile < ApplicationRecord
  belongs_to :user, required: true
  
  after_initialize do
    self.strength = 0
  end
end
