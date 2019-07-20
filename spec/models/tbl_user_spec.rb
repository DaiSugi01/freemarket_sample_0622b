require 'rails_helper'
describe TblUser do
  describe '#create' do
    # 必須項目をすべて入力したとき
    it "is valid with all required inputs" do
      user = build(:tbl_user)
      expect(user).to be_valid
    end
    # 必須項目を入力しないとき
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
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    # 字数制限
    it "is invalid if a password less than 6" do
      user = build(:tbl_user, password: "00000")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    # 文字種制限
    it "is invalid if zenkaku in a birthday" do
      user = build(:tbl_user, birthday: "1995年2月10日")
      user.valid?
      expect(user.errors[:birthday]).to include("は半角数字とハイフンのみ使用できます")
    end
    it "is invalid if zenkaku in a phone" do
      user = build(:tbl_user, phone: "０８０１２３４５６７８")
      user.valid?
      expect(user.errors[:phone]).to include("は半角数字とハイフンのみ使用できます")
    end
  end
end