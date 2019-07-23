require 'rails_helper'

describe TblAddressController, type: :controller do
  describe 'get new' do

    def request_new()
      user = create(:tbl_user)
      get :new, params: { tbl_user_id: user }
    end

    it 'get @prefs' do
      request_new
      prefs = create_list(:mst_prefecture, 47)
      expect(assigns(prefs)).to match(@prefs)
    end

    it 'get @address' do
      user = create(:tbl_user)
      get :new, params: { tbl_user_id: user }
      address = user.tbl_addresses.new()
      expect(assigns(address)).to match(@address)
    end

    it 'render new' do
      request_new
      expect(response).to render_template :new
    end

  end

  describe 'post create' do
    let(:params) { { tbl_address: attributes_for(:tbl_address) } }

    it '' do
    end

  end
end