def sign_up
  visit '/users/new'
  fill_in 'email', with: 'mail@mail.com'
  fill_in 'password', with: 'password'
  click_button 'Sign up'
end
