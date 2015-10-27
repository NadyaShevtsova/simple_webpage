class Organization < ActiveRecord::Base
  has_many :people, dependent: :destroy

  with_options presence: true do |o|
    o.validates :location
    o.validates :title, length: { maximum: 255 }
  end
end
