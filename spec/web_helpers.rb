def sign_up
  visit '/users/new'
  fill_in 'email', with: 'mail@mail.com'
  fill_in 'password', with: 'password'
  fill_in 'confirm_password', with: 'password'
  click_button 'Sign up'
end

def wrong_sign_up
  visit '/users/new'
  fill_in 'email', with: 'mail@mail.com'
  fill_in 'password', with: 'password'
  fill_in 'confirm_password', with: 'wrongpassword'
  click_button 'Sign up'
end
