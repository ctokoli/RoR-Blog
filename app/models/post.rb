class Posts < ApplicationRecord
  belongs_to :user, foreign_key: :author
  has_many :comments

  after_create :update_user_post_count
  after_destroy :update_user_post_count

  private

  def update_user_post_count
    user.update(posts_count: user.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
