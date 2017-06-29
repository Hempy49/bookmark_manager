feature 'signing up' do
  scenario 'signing up as a user' do
    visit '/users/new'
    fill_in 'email', with: 'mail@mail.com'
    fill_in 'password', with: 'password'
    click_button 'Sign up'
    expect { sign_up }.to change(User.all.count).by(1)
    expect(current_path).to be '/links'
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'mail@mail.com'
  end
end
