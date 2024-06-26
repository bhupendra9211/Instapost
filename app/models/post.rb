class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_one_attached :photo
  validates :photo, :description, :user_id, presence: true
  acts_as_votable
  delegate :email, to: :user, prefix: true
  def user_email
    user.email
  end

end



