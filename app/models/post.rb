class Post < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  validates :photo, :description, :user_id, presence: true
  
  has_many :comments, dependent: :destroy
end

