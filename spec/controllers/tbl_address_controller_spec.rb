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
    let(:tbl_user) { create(:tbl_user) }

    context 'can save' do
      let(:params) { attributes_for(:tbl_address).merge( tbl_address: { mst_prefecture_id: 1 }, tbl_user_id: tbl_user.id) }
      subject {
        post :create, params: params
      }

      it 'count up tbl_address' do
        expect{ subject }.to change(TblAddress, :count).by(1)
      end

      it 'redirect to top' do
        subject
        expect(response).to redirect_to(root_path)
      end

    end

    context 'can not save' do
      let(:params) { attributes_for(:tbl_address, address: nil).merge( tbl_address: { mst_prefecture_id: 1 }, tbl_user_id: tbl_user.id) }
      subject {
        post :create, params: params
      }

      it 'does not count up' do
        expect{ subject }.not_to change(TblAddress, :count)
      end

      it 'render new' do
        subject
        expect(response).to render_template :new
      end

    end

  end
end