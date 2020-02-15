class Comment < ApplicationRecord
    validates :content, presence: true
    
    belongs_to :gossip
    belongs_to :user
    has_many :sub_comments
    has_many :likes, as: :likable
end
