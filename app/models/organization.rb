class Organization < ActiveRecord::Base
  has_many :persons, dependent: :destroy

  with_options presence: true do |v|
    v.validates :location
    v.validates :title, length: { maximum: 255 }
  end
end
