feature 'signing in' do
  let!(:user) do
    User.create(email: 'mail@mail.com',
                password: 'password',
                password_confirmation: 'password')
  end

  scenario 'User can sign in' do
    sign_in
    expect(page).to have_content "mail@mail.com"
  end

end
