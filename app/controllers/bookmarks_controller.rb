class BookmarksController < ApplicationController
  before_action :set_list
  def new
    @bookmark = Bookmark.new
    # create a new booking instance (empty, for the form)
    # find the list by the list id
  end

  def create
    # create a new bookmark
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
