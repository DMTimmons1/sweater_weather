class SalarySerializer
  include JSONAPI::Serializer
  attributes :title, :min, :max
end