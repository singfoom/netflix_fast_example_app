class BooksController < ApplicationController

  def index
    books = Book.all
    render :json => FastBookSerializer.new(books).serialized_json
  end

  def slow_index
    books = Book.all
    render :json => ActiveModelSerializers::SerializableResource.new(books,
                                                       :adapter => :json_api).to_json
  end

end
