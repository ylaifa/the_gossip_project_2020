class Tag < ApplicationRecord
    has_many :gossip_tags
    has_many :gossips, through: :gossip_tags, dependent: :destroy
end
