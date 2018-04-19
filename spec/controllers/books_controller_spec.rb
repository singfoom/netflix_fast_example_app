require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  context 'GET /orders' do
    context 'success' do
      let!(:books) { create_list(:book, 10) }

      it 'returns a success' do
        get :index, :as => :json
        expect(response).to have_http_status(:success)
      end

      it 'returns the orders' do
        get :index, :as => :json
        expect(json_data.length).to eq(10)
      end
    end
  end




end
