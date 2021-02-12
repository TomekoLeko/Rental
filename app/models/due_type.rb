class DueType < ApplicationRecord
    belongs_to :user
    has_many :due
end
