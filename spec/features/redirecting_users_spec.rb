feature 'Redirecting Users', type: :feature do
	
	def fill_in_and_submit url
		within 'form#form-url' do
			fill_in :'field-long-url', with: url
		end
		click_button 'Shorten URL'
	end

	let(:url) { 'http://www.facebook.com' }

	it 'redirects users to the long URL when the short URL is visited' do
		visit '/'
		fill_in_and_submit(url)
		short_url = page.find_field("field-short-url").value
		visit short_url
		expect(page.current_url).to match url
	end
end