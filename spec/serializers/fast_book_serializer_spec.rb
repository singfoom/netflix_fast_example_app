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

    end
  end
end