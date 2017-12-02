class Section < ApplicationRecord
    belongs_to :event
    has_many :hours
end
