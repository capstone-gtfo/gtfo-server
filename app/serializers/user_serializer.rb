class UserSerializer
  include JSONAPI::Serializer
  attributes :lat, :long, :phone
  set_type :users
end
