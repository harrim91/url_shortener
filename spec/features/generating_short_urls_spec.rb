feature 'Generating Short URL', type: :feature do
	
	def fill_in_and_submit url
		within 'form#form-url' do
			fill_in :'field-long-url', with: url
		end
		click_button 'Shorten URL'
	end
	
	let(:url) { 'http://www.test.com' }
	let(:url_no_http) { 'www.test.com' }
	let(:url_slash) { 'www.test.com/' }
	let(:url_whitespace) { ' www.test.com/ ' }
	let(:url_mixed_case) { ' wWw.TeSt.CoM/ ' }

	it 'returns a shortened URL' do
		visit '/'
		fill_in_and_submit(url)
		expect(current_path).to eq '/'
		expect(page.find_field("field-short-url").value).to match "#{URL.last('url' => url).id.to_s(36)}"
	end

	context 'url has already been saved' do
		
		before(:each) do
			visit '/'
			fill_in_and_submit(url)
		end
		
		it 'doesn\'t create dupes' do
			fill_in_and_submit(url)
			expect(page.find_field("field-short-url").value).to match "#{URL.first('url' => url).id.to_s(36)}"
		end

		it 'works with urls without http' do
			fill_in_and_submit(url_no_http)
			expect(page.find_field("field-short-url").value).to match "#{URL.first('url' => url).id.to_s(36)}"
		end

		it 'works with urls with trailing slash' do
			fill_in_and_submit(url_slash)
			expect(page.find_field("field-short-url").value).to match "#{URL.first('url' => url).id.to_s(36)}"
		end

		it 'works with urls with trailing whitespace' do
			fill_in_and_submit(url_whitespace)
			expect(page.find_field("field-short-url").value).to match "#{URL.first('url' => url).id.to_s(36)}"
		end

		it 'works with urls with mixed cases' do
			fill_in_and_submit(url_mixed_case)
			expect(page.find_field("field-short-url").value).to match "#{URL.first('url' => url).id.to_s(36)}"
		end
	end


end