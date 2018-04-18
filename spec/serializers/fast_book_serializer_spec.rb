# frozen_string_literal: true

require 'rails_helper'

describe FastBookSerializer do
  context 'serialization' do
    let(:book) do
      build_stubbed(:book)
    end
    let(:book_json) do
      described_class.new(book).serialized_json
    end

    describe 'serialization' do
      it 'includes data' do
        expect(book_json).to have_json_path('data')
      end

      it 'includes data/id' do
        expect(book_json).to have_json_path('data/id')
      end

      it 'includes data/type' do
        expect(book_json).to have_json_path('data/type')
      end

      it 'includes data/attributes' do
        expect(book_json).to have_json_path('data/attributes')
      end

      it 'includes data/attributes/publisher' do
        expect(book_json)
          .to have_json_path('data/attributes/publisher')
      end

      it 'includes data/attributes/created_at' do
        expect(book_json)
          .to have_json_path('data/attributes/created_at')
      end

      it 'includes data/attributes/genre' do
        expect(book_json)
          .to have_json_path('data/attributes/genre')
      end

      it 'includes data/attributes/published_at' do
        expect(book_json)
          .to have_json_path('data/attributes/published_at')
      end

      it 'includes data/attributes/title' do
        expect(book_json)
          .to have_json_path('data/attributes/title')
      end

      it 'includes data/attributes/updated_at' do
        expect(book_json)
          .to have_json_path('data/attributes/updated_at')
      end
    end
  end
end