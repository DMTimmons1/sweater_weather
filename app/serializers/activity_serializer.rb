class ActivitySerializer
  include JSONAPI::Serializer 

  set_type :activities
  set_id { nil }

  attributes :destination, :forecast, :activities
end