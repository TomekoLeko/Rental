class Tenant < ApplicationRecord
    belongs_to :user
    belongs_to :rent
end
