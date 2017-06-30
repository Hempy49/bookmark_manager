feature 'signing up' do
  scenario 'signing up as a user' do
    sign_up
    expect { sign_up }.to change(User,:count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'mail@mail.com'
  end

  scenario 'password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq  '/users/new'
    expect(page).to have_content 'Password confirmation does not match'
  end
end
