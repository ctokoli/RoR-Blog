class Comments < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_post_comment_count
    post.update(comments_counter: post.comments.count)
  end
end
