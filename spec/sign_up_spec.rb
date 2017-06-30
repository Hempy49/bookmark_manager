feature 'signing up' do
  scenario 'signing up as a user' do
    sign_up
  end

  scenario 'password confirmation' do
    expect { sign_up(password_confirmation: 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq  '/users/new'
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "user can't sign up without entering email address" do
    expect { sign_up(email: "")}.to change(User, :count).by(0)
    expect(page).to have_content 'Email must not be blank'

  end

  scenario "user must enter valid email address" do
    expect { sign_up(email: "hempy")}.to change(User, :count).by(0)
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario "user has already signed up" do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content 'Email is already taken'
  end

end
