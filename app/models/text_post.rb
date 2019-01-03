class TextPost < ApplicationRecord
  belongs_to :user_profile, required: true

  after_initialize do
    self.upvotes = 0
    self.downvotes = 0
  end
end
