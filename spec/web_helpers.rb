def sign_up(email: 'mail@mail.com', password: 'password', password_confirmation: 'password')
  visit '/users/new'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def wrong_sign_up
  visit '/users/new'
  fill_in 'email', with: 'mail@mail.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'wrongpassword'
  click_button 'Sign up'
end
