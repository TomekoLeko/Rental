class Tenant < ApplicationRecord
    belongs_to :user
    has_one :rent
end
