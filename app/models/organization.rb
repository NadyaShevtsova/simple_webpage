class Organization < ActiveRecord::Base
  with_options presence: true do |v|
    v.validates :location
    v.validates :title, length: { maximum: 255 }
  end
end
