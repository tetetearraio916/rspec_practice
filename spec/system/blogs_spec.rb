require 'rails_helper'

RSpec.describe "Blogs", type: :system do
  let!(:user){ create(:user)}
  let!(:my_blog){create(:blog, user: user)}

  describe 'ブログ一覧' do
    context 'フラグが公開であれば' do
      it "ブログが存在すること" do

      end
    end

    context 'フラグが未公開であれば' do
      it "他のユーザーのブログ一覧に存在しないこと" do

      end

      it '自分のブログ一覧に存在すること' do

      end
    end

  end

  describe 'ブログ投稿' do
    context '入力情報が正しければ' do
      it "ブログが投稿できること" do
        login_as(user)
        visit '/blogs/new'
        fill_in 'タイトル', with: 'dragonball'
        fill_in '本文', with: 'dragonballZ'
        click_on '投稿'
        expect(current_path).to eq '/blogs'
        expect(page).to have_content('投稿に成功しました')
      end
    end

    context  '入力情報に誤りがあれば' do
      it 'ブログが投稿できないこと' do
        login_as(user)
        visit '/blogs/new'
        fill_in 'タイトル', with: ''
        fill_in '本文', with: ''
        click_on '投稿'
        expect(current_path).to eq '/blogs'
        expect(page).to have_content('投稿に失敗しました')
      end
    end
  end

  describe 'ブログ更新' do
    it "自分のブログに編集ボタンが表示されること" do

    end

    it "他人のブログに編集ボタンが表示されないこと" do

    end

    it "ブログの更新ができること" do

    end
  end

  describe 'ブログ削除' do
    it "自分のブログに削除ボタンが表示されること" do

    end

    it "他人のブログに削除ボタンが表示されないこと" do

    end

    it "ブログの削除ができること" do

    end

  end

  describe 'ブログ詳細' do
    it "ブログの詳細画面が閲覧できる" do

    end

  end

end
