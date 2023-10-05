class Likes < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_post_like_count
  after_destroy :update_post_like_count

  def update_post_like_count
    post.update(likes_counter: post.likes.count)
  end
end
