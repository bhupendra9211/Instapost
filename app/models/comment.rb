class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :post

    validates :description, :user_id, presence: true
    delegate :email, to: :user, prefix: true
end
