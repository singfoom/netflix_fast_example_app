require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let!(:books) { create_list(:book, 10) }

  context 'GET /books' do
    context 'success' do
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


  context 'GET /books/slow' do
    context 'success' do
      it 'returns a success' do
        get :slow_index, :as => :json
        expect(response).to have_http_status(:success)
      end

      it 'returns the books' do
        get :slow_index, :as => :json
        expect(json_data.length).to eq(10)
      end
    end
  end

  context 'GET /books/:id' do
      let!(:book) {books.first}

      it 'returns a success' do
        get :show, :params => {:id => book.id}, :as => :json
        expect(response).to have_http_status(:success)
      end

      it 'returns the book' do
        get :show, :params => {:id => book.id}, :as => :json
        expect(json_data.dig('id')).to eq(book.id)
        expect(json_data.dig('attributes', 'title')).to eq(book.title)
      end
  end

  context 'GET /books/:id' do
      let!(:book) {books.first}

      it 'returns a success' do
        get :show, :params => {:id => book.id}, :as => :json
        expect(response).to have_http_status(:success)
      end

      it 'returns the books' do
        get :show, :params => {:id => book.id}, :as => :json
        expect(json_data.dig('id')).to eq(book.id)
        expect(json_data.dig('attributes', 'title')).to eq(book.title)
      end
  end

  context 'GET /books/slow_show/:id' do
      let!(:book) {books.first}

      it 'returns a success' do
        get :slow_show, :params => {:id => book.id}, :as => :json
        expect(response).to have_http_status(:success)
      end

      it 'returns the books' do
        get :slow_show, :params => {:id => book.id}, :as => :json
        expect(json_data.dig('id')).to eq(book.id)
        expect(json_data.dig('attributes', 'title')).to eq(book.title)
      end
  end

  context 'POST /books' do
    let(:create_params) do
      {
        :data => {
          :type => 'books',
          :attributes => {
            :title => 'The Wheel of Time',
            :publisher => 'Tor',
            :genre => 'Fantasy',
            :published_at => Time.now,
          }
        }
      }
    end

    it 'responds with a created status' do
      post :create, :params => create_params, :as => :json
      expect(response).to have_http_status(:success)
    end

    it 'creates a new book' do
      expect { post :create, :params => create_params, :as => :json }.to change { Book.count }.by(1)
    end
  end
end
