require 'rails_helper'

RSpec.describe "User", type: :system do
  describe 'ユーザー登録' do
    context '入力情報が正しい場合' do
      it "ユーザー登録ができること" do
        visit '/users/new'
        fill_in 'ユーザー名', with: 'tetete'
        fill_in 'メールアドレス', with: 'tetete@example.com'
        fill_in '年齢', with: 23
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード確認', with: 'password'
        click_on '登録'
        expect(current_path).to eq '/login'
        expect(page).to have_content('登録に成功しました')
      end
    end

    context '入力情報に誤りがある場合' do
      it "ユーザー登録ができないこと" do
        visit new_user_path
        fill_in 'ユーザー名', with: ''
        fill_in 'メールアドレス', with: ''
        fill_in '年齢', with: ''
        fill_in 'パスワード', with: ''
        fill_in 'パスワード確認', with: ''
        click_on '登録'
        expect(page).to have_content('ユーザー名を入力してください')
        expect(page).to have_content('メールアドレスを入力してください')
        expect(page).to have_content('パスワードは3文字以上で入力してください')
        expect(page).to have_content('パスワード確認を入力してください')
        expect(page).to have_content('登録に失敗しました')
      end
    end
  end
end
