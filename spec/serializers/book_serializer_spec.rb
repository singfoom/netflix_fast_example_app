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

  end
end