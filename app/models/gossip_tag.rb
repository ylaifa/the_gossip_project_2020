class GossipTag < ApplicationRecord
    validates :tag_id, uniqueness: { scope: :gossip_id }

    belongs_to :gossip
    belongs_to :tag 
end
