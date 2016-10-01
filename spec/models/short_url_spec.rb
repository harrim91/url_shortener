describe URL, type: :model do
	subject(:url) { described_class.new }

	it 'is valid with a URL' do
		url.url = 'http://www.google.com/'
		expect(url).to be_valid
	end
	
	it 'is not valid without a URL' do
		expect(url).not_to be_valid
	end
	
end