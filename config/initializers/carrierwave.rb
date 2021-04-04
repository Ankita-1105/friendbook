if Rails.env.production?
	CarrierWave.configure do |config|
		config.fog_credentials = {
			provider: 					'AWS',
			aws_access_key_id:         '1234',
			aws_secret_access_key:   	'1234',
		}
		config.storage = :fog
		config.permissions = 0666
		config.cache_dir = "#{Rails.root}/tnp"
		config.fog_directory = '1234'
		config.fog_attributes = { 'Cache-Control' => "max-age = #{365.day.to_i}" }

	end
end