class URL
	include DataMapper::Resource

	property :id,			Serial
	property :url,		Text, required: true, format: :url, unique: true
	property :visits, Integer, default: 0

end
