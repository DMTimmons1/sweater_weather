class WeatherSerializer
  include JSONAPI::Serializer
  attributes :summary, :temperature
end