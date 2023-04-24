class SalarySerializer
  include JSONAPI::Serializer
  attributes :title, :min_salary, :max_salary
end