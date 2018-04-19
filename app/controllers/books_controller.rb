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

  def create
    book = Book.new(book_params)
    if book.save
      render :json => FastBookSerializer.new(book).serialized_json
    else
      render :json => {:error => "something"}
    end
  end

  private

  def book_params
    restify_param(:book).require(:book).permit(
      :title,
      :publisher,
      :genre,
      :published_at
    )
  end

end
