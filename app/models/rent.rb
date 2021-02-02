class Rent < ApplicationRecord
    belongs_to :user
    has_one :property
    has_one :tenant
end
