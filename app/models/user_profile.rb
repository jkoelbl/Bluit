class UserProfile < ApplicationRecord
  belongs_to :user, required: true
  has_many :text_posts
  before_destroy :destroy_text_posts
  
  after_initialize do
    self.strength = 0
  end

  private
  
  def destroy_text_posts
    if posts = self.text_posts
      posts.destroy_all
    end
  end
end
