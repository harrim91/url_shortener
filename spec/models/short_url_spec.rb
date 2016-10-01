describe ShortURL, type: :model do
	subject(:short_url) { described_class.new }

	it 'is valid with a URL' do
		short_url.url = 'http://www.google.com/'
		expect(short_url).to be_valid
	end
	
	it 'is not valid without a URL' do
		expect(short_url).not_to be_valid
	end
	
end