feature 'Submitting URL', type: :feature do

	before(:each) do
		visit '/'
		within 'form#form-url' do
			fill_in :'field-long-url', with: 'http://www.test.com'
		end
	end
	
	it 'saves the URL' do
		expect{ click_button 'Shorten URL' }.to change(URL, :count).by 1
	end

	it 'returns a shortened URL' do
		click_button 'Shorten URL'
		expect(current_path).to eq '/'
		expect(page.find_field("field-short-url").value).to match "#{URL.last.id.to_s(36)}"
	end
end