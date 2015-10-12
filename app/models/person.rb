class Person < ActiveRecord::Base
  belongs_to :organization
  validates :organization, presence: true

  with_options presence: true do |p|
    p.validates :first_name, length: { maximum: 255 }
    p.validates :last_name, length: { maximum: 255 }
  end
  validates :assessement_count, numericality: { only_integer: true, greater_then_or_equal_to: 0 }
end
