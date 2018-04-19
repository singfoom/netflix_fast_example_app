require 'rails_helper'
require 'fast_jsonapi'
require 'factory_bot'

describe FastJsonapi::ObjectSerializer, performance: true do

  before(:all) { GC.disable }
  after(:all) { GC.enable }

  context 'testing performance of serialization' do
    let!(:created_books) { FactoryBot.create_list(:book, 1000) }
    context 'FastBookSerializer' do

      it 'creates a hash of 1000 records in less than 50 ms' do
        expect { FastBookSerializer.new(created_books).serializable_hash }.to perform_under(120).ms
      end

      it 'serialize 1000 records to jsonapi in less than 60 ms' do
        expect { FastBookSerializer.new(created_books).serialized_json }.to perform_under(170).ms
      end

    end

    context 'BookSerializer' do
      it 'creates a hash of 1000 records in less than 480 ms' do
        expect { ActiveModelSerializers::SerializableResource.new(created_books).serializable_hash }.to perform_under(500).ms
      end

      it 'serialize 1000 records to jsonapi in less than 60 ms' do
        expect { ActiveModelSerializers::SerializableResource.new(created_books,
                                                       :adapter => :json_api).to_json }.to perform_under(580).ms
      end
    end
  end
end