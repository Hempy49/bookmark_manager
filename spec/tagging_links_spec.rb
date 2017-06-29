feature 'adding tags to links' do
  scenario 'adding a single tag' do
    visit '/links/new'
    fill_in('url', :with => 'http://www.google.com')
    fill_in('title', :with => 'Google')
    fill_in('tag', :with => 'Browsers')
    click_button("Create link")
    visit '/links'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Browsers')
  end
  scenario 'adding multiple tags' do
    visit '/links/new'
    fill_in('url', :with => 'http://www.google.com')
    fill_in('title', :with => 'Google')
    fill_in('tag', :with => 'Browsers search')
    click_button("Create link")
    visit '/links'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Browsers','search')
  end
end

feature 'filter links by tag' do
  scenario 'find bubbles tag' do
    visit '/links/new'
    fill_in('url', :with => 'http://bubbleology.co.uk/')
    fill_in('title', :with => 'bubbleology')
    fill_in('tag', :with => 'bubbles')
    click_button("Create link")
    link = Link.first
    expect(link.tags.map(&:name)).to include 'bubbles'
  end
end
