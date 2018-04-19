require 'rails_helper'
require 'fast_jsonapi'
require 'factory_bot'

describe FastJsonapi::ObjectSerializer, performance: true do

  before(:all) { GC.disable }
  after(:all) { GC.enable }

  context 'testing performance of serialization' do
    context '1000 records' do
      let!(:created_books) { FactoryBot.create_list(:book, 1000) }
      context 'FastBookSerializer' do

        it 'creates a hash of 1000 records in less than 120 ms' do
          expect { FastBookSerializer.new(created_books).serializable_hash }.to perform_under(120).ms
        end

        it 'serialize 1000 records to jsonapi in less than 170 ms' do
          expect { FastBookSerializer.new(created_books).serialized_json }.to perform_under(170).ms
        end

      end

      context 'AMS BookSerializer' do
        it 'creates a hash of 1000 records in less than 500 ms' do
          expect { ActiveModelSerializers::SerializableResource.new(created_books).serializable_hash }.to perform_under(500).ms
        end

        it 'serialize 1000 records to jsonapi in less than 580 ms' do
          expect { ActiveModelSerializers::SerializableResource.new(created_books,
                                                        :adapter => :json_api).to_json }.to perform_under(580).ms
        end
      end
    end

    context '1 record' do
      let!(:book) { FactoryBot.create(:book) }

      context 'FastBookSerializer' do
        it 'creates a hash of 1 record in less than 5 ms' do
          expect { FastBookSerializer.new(book).serializable_hash }.to perform_under(5).ms
        end

        it 'serialize 1 records to jsonapi in less than 7 ms' do
          expect { FastBookSerializer.new(book).serialized_json }.to perform_under(7).ms
        end
      end

      context 'AMS BookSerializer' do
        it 'creates a hash of 1 record in less than 5 ms' do
          expect { ActiveModelSerializers::SerializableResource.new(book,
                                                        :adapter => :json_api).to_json }.to perform_under(20).ms
        end

        it 'serialize 1 records to jsonapi in less than 7 ms' do
          expect { ActiveModelSerializers::SerializableResource.new(book,
                                                        :adapter => :json_api).to_json }.to perform_under(25).ms
        end
      end
    end


  end
end