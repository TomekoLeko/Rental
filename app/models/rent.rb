class Rent < ApplicationRecord
    belongs_to :property
    belongs_to :tenant
    belongs_to :user
end
