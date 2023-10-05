class Posts < ApplicationRecord
  belong_to :author, className: 'User'
  has_many :comments
  has_many :likes

  after_create :update_user_post_count
  after_destroy :update_user_post_count

  private

  def update_user_post_count
    user.update(posts_counter: user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
