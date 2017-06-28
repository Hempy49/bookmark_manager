feature 'adding tags to links' do
  scenario 'adding a single tag' do
    visit '/links/new'
    fill_in('url', :with => 'http://www.google.com')
    fill_in('title', :with => 'Google')
    fill_in('tag', :with => 'Browsers')
    click_button("Create link")
    visit '/links'
    link = Link.first
    expect(link.tags.map(&:tag)).to include('Browsers')
  end
end
