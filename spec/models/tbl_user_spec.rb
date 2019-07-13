require 'rails_helper'
describe TblUser do
  describe '#create' do
    # 必須項目
    it "is invalid without a email" do
      user = build(:tbl_user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "is invalid without a password" do
      user = build(:tbl_user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "is invalid without a last_name" do
      user = build(:tbl_user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end
    it "is invalid without a first_name" do
      user = build(:tbl_user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end
    it "is invalid without a last_name_kana" do
      user = build(:tbl_user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end
    it "is invalid without a first_name_kana" do
      user = build(:tbl_user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end
    it "is invalid without a birthday" do
      user = build(:tbl_user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end
    it "is invalid without a phone" do
      user = build(:tbl_user, phone: "")
      user.valid?
      expect(user.errors[:phone]).to include("を入力してください")
    end

    # パスワード確認とパスワードが一致しない
    it "is invalid without a password_confirmation" do
      user = build(:tbl_user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とPasswordの入力が一致しません")
    end

    # 文字種制限
    it "is invalid without a birthday" do
      user = build(:tbl_user, birthday: "1995年2月10日")
      user.valid?
      expect(user.errors[:birthday]).to include("は半角数字とハイフンのみ使用できます")
    end
    it "is invalid without a phone" do
      user = build(:tbl_user, phone: "０８０１２３４５６７８")
      user.valid?
      expect(user.errors[:phone]).to include("は半角数字とハイフンのみ使用できます")
    end
  end
end