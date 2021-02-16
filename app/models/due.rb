class Due < ApplicationRecord
    belongs_to :due_type
    belongs_to :user
end
