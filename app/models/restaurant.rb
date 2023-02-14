class Restaurant < ApplicationRecord
  # associations -> has_many / belongs_to
  # validations
  # validates :column_name, validation_name: arg
  validates :name, presence: true
end
