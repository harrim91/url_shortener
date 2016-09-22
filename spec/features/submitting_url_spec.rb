feature 'Submitting URL' do
	
	it 'saves the URL' do
		visit '/'
		within 'form#form-url' do
			fill_in :'field-url', with: 'http://www.google.com'
			expect{ click_button 'Shorten URL' }.to change(ShortURL, :count).by 1
		end
	end
end