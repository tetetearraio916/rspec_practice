module LoginHelper
  def login
    user = create(:user)
    visit '/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
  end

  def login_as(user)
    visit '/login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_button 'ログイン'
  end
end
