class Due < ApplicationRecord
    belongs_to :due_type
    belongs_to :user

    enum status: [:Recent, :Close, :Delayed, :Paid]
end
