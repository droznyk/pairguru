class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  
  scope :count_users_comments, lambda {
                                        includes(:user)
                                        .group(:user_id)
                                        .count(:movie_id)
                                        .first(10)
                                      }
                                  
  validates :content, presence: true
end
