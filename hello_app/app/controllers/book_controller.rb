class BookController < ApplicationController

  def index
    @books = Book.find(:all)
  end

  def show
    @book = Book.find(params[:id])
  end
end
