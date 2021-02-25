require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録' do
    it "名前、メール、パスワードがあれば有効であること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "名前が無ければ無効であること" do
      user = build(:user, username: nil )
      user.valid?
      expect(user.errors[:username]).to include('を入力してください')
    end

    it "名前が30文字より多ければ無効であること" do
      user = build(:user, username: 'a'*31 )
      user.valid?
      expect(user.errors[:username]).to include('は30文字以内で入力してください')
    end

    it "メールが無ければ無効であること" do
      user = build(:user, email: nil )
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it "メールが一意で無ければ無効であること" do
      create(:user, email: 'tetete@example.com' )
      user = build(:user, email: 'tetete@example.com')
      user.valid?
      expect(user.errors[:email]).to include('はすでに存在します')
    end

    it "メールがフォーマットでなければ無効であること" do
      user = build(:user, email: 'a' )
      user.valid?
      expect(user.errors[:email]).to include('は不正な値です')
    end

    it "パスワードが無ければ無効であること" do
      user = build(:user, password_digest: nil )
      user.valid?
      expect(user.errors[:password_digest]).to include('を入力してください')
    end
  end
end
