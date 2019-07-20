require 'rails_helper'
describe TblAddress do
  describe '#create' do
    # 必須項目をすべて入力したとき
    it "is valid with all required inputs" do
      address = build(:tbl_address)
      expect(address).to be_valid
    end
    # 必須項目を入力しないとき
    it "is invalid without a full_name" do
      user = build(:tbl_address, full_name: "")
      user.valid?
      expect(user.errors[:full_name]).to include("を入力してください")
    end
    it "is invalid without a full_name_kana" do
      user = build(:tbl_address, full_name_kana: "")
      user.valid?
      expect(user.errors[:full_name_kana]).to include("を入力してください")
    end
    it "is invalid without a zip" do
      user = build(:tbl_address, zip: "")
      user.valid?
      expect(user.errors[:zip]).to include("を入力してください")
    end
    it "is invalid without a mst_prefecture_id" do
      user = build(:tbl_address, mst_prefecture_id: "")
      user.valid?
      expect(user.errors[:mst_prefecture_id]).to include("を入力してください")
    end
    it "is invalid without a address" do
      user = build(:tbl_address, address: "")
      user.valid?
      expect(user.errors[:address]).to include("を入力してください")
    end
    it "is invalid without a phone" do
      user = build(:tbl_address, phone: "")
      user.valid?
      expect(user.errors[:phone]).to include("を入力してください")
    end

    # 文字種制限
    it "is invalid if zenkaku in a zip" do
      user = build(:tbl_address, zip: "１３５の００１２")
      user.valid?
      # expect(user.errors[:zip]).to include("は半角数字のみ使用できます===")
    end
    it "is invalid if zenkaku in a phone" do
      user = build(:tbl_address, phone: "０８０１２３４５６７８")
      user.valid?
      expect(user.errors[:phone]).to include("は半角数字とハイフンのみ使用できます")
    end
  end
end