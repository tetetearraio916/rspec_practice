require 'rails_helper'

RSpec.describe "Blogs", type: :system do
  let!(:user){ create(:user)}
  let!(:my_blog){create(:blog, user: user)}
  let!(:other_blog){create(:blog)}
  let!(:my_unpublished_blog){ create(:blog, :unpublished, user: user)}
  let!(:unpublished_blog){ create(:blog, :unpublished)}



  describe 'ブログ一覧' do
    context 'フラグが公開であれば' do
      it "自分のブログが存在すること" do
        login_as(user)
        visit '/'
        expect(page).to have_content(my_blog.content)
      end
    end

    context 'フラグが未公開であれば' do
      before do
        login_as(user)
      end
      it "ブログ一覧に他のユーザーの未公開フラグのブログが存在しないこと" do
        visit '/'
        expect(page).to have_content(my_blog.content)
        expect(page).to_not have_content(unpublished_blog.content)
      end

      it '自分のブログが一覧に存在すること' do
        visit '/'
        expect(page).to have_content(my_unpublished_blog.content)
        expect(page).to have_content(my_blog.content)
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
    before do
      login_as(user)
    end
    it "自分のブログに編集ボタンが表示されること" do
      visit '/'
      within "#blog-#{my_blog.id}" do
        expect(page).to have_css '.edit-button'
      end
    end

    it "他人のブログに編集ボタンが表示されないこと" do
      visit '/'
      within "#blog-#{other_blog.id}" do
        expect(page).to_not have_css '.edit-button'
      end
    end

    it "ブログの更新ができること" do
      visit "/blogs/#{my_blog.id}/edit"
      fill_in 'タイトル', with: 'update'
      fill_in '本文', with: 'update'
      click_on '投稿'
      expect(current_path).to eq '/'
      expect(page).to have_content('投稿を更新しました')
    end

    it "ブログの更新ができないこと" do
      visit "/blogs/#{my_blog.id}/edit"
      fill_in 'タイトル', with: ''
      fill_in '本文', with: ''
      click_on '投稿'
      expect(current_path).to eq "/blogs/#{my_blog.id}"
      expect(page).to have_content('更新に失敗しました')
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
      login_as(user)
      visit "/blogs/#{my_blog.id}"
      expect(current_path).to eq "/blogs/#{my_blog.id}"
    end

  end

end
