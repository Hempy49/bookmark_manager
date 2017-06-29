feature 'signing up' do
  scenario 'signing up as a user' do
    sign_up
    expect { sign_up }.to change(User,:count).by(1)
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'mail@mail.com'
  end
end
