require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  let(:user) { create(:user) }

  describe 'ログイン' do
    context '認証情報が正しい場合' do
      it 'ログインできること' do
        visit login_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'password'
        click_button 'ログイン'
        expect(current_path).to eq root_path
        expect(page).to have_content 'ログインしました'
      end
    end

    context '認証情報に誤りがある場合' do
      it 'ログインできないこと' do
        visit login_path
        fill_in 'Email', with: user.email
        fill_in 'Password', with: 'tetete'
        click_button 'ログイン'
        expect(current_path).to eq login_path
        expect(page).to have_content 'ログインに失敗しました'
      end
    end
  end

  describe 'ログアウト' do
    before do
      login
    end
    it 'ログアウトできること' do
      click_on 'LOGOUT'
      expect(current_path).to eq login_path
      expect(page).to have_content 'ログアウトしました'
    end
  end
end
