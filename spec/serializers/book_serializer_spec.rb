# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookSerializer do
  context 'serialization' do
    let(:book) { build_stubbed(:book) }
    let(:serialization) do
      ActiveModelSerializers::SerializableResource.new(book,
                                                       :adapter => :json_api)
    end

    it 'includes data' do
      expect(serialization.to_json).to have_json_path('data')
    end

    it 'includes data/type' do
      expect(serialization.to_json).to have_json_path('data/type')
    end

    it 'includes data/attributes' do
      expect(serialization.to_json).to have_json_path('data/attributes')
    end

    it 'includes data/attributes/publisher' do
      expect(serialization.to_json)
        .to have_json_path('data/attributes/publisher')
    end

    it 'includes data/attributes/created_at' do
      expect(serialization.to_json)
        .to have_json_path('data/attributes/created_at')
    end

    it 'includes data/attributes/genre' do
      expect(serialization.to_json)
        .to have_json_path('data/attributes/genre')
    end

    it 'includes data/attributes/published_at' do
      expect(serialization.to_json)
        .to have_json_path('data/attributes/published_at')
    end

    it 'includes data/attributes/title' do
      expect(serialization.to_json)
        .to have_json_path('data/attributes/title')
    end

    it 'includes data/attributes/updated_at' do
      expect(serialization.to_json)
        .to have_json_path('data/attributes/updated_at')
    end

  end
end