class Tweet < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  def liked?(user)
    return false if user.nil?
    likes.exists?(user_id: user.id)
  end

  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike(user)
    likes.find_by(user_id: user.id)&.destroy
  end
end