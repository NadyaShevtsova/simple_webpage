class PersonSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :assessement_count
  has_one :organization
end
