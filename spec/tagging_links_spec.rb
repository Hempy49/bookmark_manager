feature 'adding tags to links' do
  scenario 'adding a single tag' do
    visit '/links/new'
    fill_in('tag', :with => 'Browsers')
    click_button("Add tag")
    visit '/links'
    expect(page).to have_content("Browsers")
  end
end
