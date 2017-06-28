feature 'adding tags to links' do
  scenario 'adding a single tag' do
    visit '/links/new'
    fill_in('url', :with => 'http://www.google.com')
    fill_in('title', :with => 'Google')
    fill_in('tag', :with => 'Browsers')
    click_button("Create link")
    visit '/links'
    expect(page).to have_content("Browsers")
  end
end
