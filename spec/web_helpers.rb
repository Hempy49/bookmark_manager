def sign_up
  visit '/users/new'
  fill_in 'email', with: 'mail@mail.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button 'Sign up'
end

def wrong_sign_up
  visit '/users/new'
  fill_in 'email', with: 'mail@mail.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'wrongpassword'
  click_button 'Sign up'
end
