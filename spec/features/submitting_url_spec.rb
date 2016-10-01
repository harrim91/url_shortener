feature 'Submitting URL', type: :feature do

	before(:each) do
		visit '/'
		within 'form#form-url' do
			fill_in :'field-url', with: 'http://www.google.com'
		end
	end
	
	it 'saves the URL' do
		expect{ click_button 'Shorten URL' }.to change(ShortURL, :count).by 1
	end

	it 'returns a shortened URL' do
		click_button 'Shorten URL'
		expect(current_path).to eq '/'
		id = ShortURL.last.id
		expect(page).to have_content "#{(id + 1679615).to_s(36)}"
	end
end