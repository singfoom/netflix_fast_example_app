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

  def show
    book = Book.find(params[:id])
    render :json => FastBookSerializer.new(book).serialized_json
  end

  def slow_show
    book = Book.find(params[:id])
    render :json => ActiveModelSerializers::SerializableResource.new(book,
                                                       :adapter => :json_api).to_json
  end

end
