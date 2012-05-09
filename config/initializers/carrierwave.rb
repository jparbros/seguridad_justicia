CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider => 'AWS',
    :aws_secret_access_key => 'AKIAJHR7V4YLDVFZCKRQ',
    :aws_access_key_id => 'eLtQ9szTYpBQ37mg7xrt8SWhcvH0eEHtZxzd3Iuc',
    :region => 'us-standard'
  }
  config.fog_directory = 'seguridadconjusticia'
end