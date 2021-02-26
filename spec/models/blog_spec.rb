require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe 'バリデーション' do
    it "タイトル、本文、公開フラグが存在すれば有効であること" do
      blog = build(:blog)
      expect(blog).to be_valid
    end

    it "タイトルが存在しなければ無効であること" do
      blog = build(:blog, title: nil)
      blog.valid?
      expect(blog.errors[:title]).to include('を入力してください')
    end

    it "タイトルが20文字より多ければ無効であること" do
      blog = build(:blog, title: 'a'*21)
      blog.valid?
      expect(blog.errors[:title]).to include('は20文字以内で入力してください')
    end

    it "本文が存在しなければ無効であること" do
      blog = build(:blog, content: nil)
      blog.valid?
      expect(blog.errors[:content]).to include('を入力してください')
    end

    it '本文が100文字より多ければ無効であること' do
      blog = build(:blog, content: 'a'*101)
      blog.valid?
      expect(blog.errors[:content]).to include('は100文字以内で入力してください')
    end

    it '公開フラグが存在しなければ無効であること' do
      blog = build(:blog, read: nil)
      blog.valid?
      expect(blog.errors[:read]).to include('は数値で入力してください')
    end

    it '公開フラグが公開未公開で設定された数字以外が存在すれば無効であること' do
      blog = build(:blog, read: 3)
      blog.valid?
      expect(blog.errors[:read]).to include("は一覧にありません", "は1以下の値にしてください")
    end

  end

end
