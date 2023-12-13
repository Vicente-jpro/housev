class Plan < ApplicationRecord
    has_rich_text :description
    has_many :plans_selected
end
