class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :posts

    validates :description, :user_id, presence: true
end
