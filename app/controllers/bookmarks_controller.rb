# frozen_string_literal: true

# :nodoc:
class BookmarksController < ApplicationController
  # def new
  #   @bookmark = Bookmark.new
  # end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    # list = List.find(params[:list_id])
    # @review.list = list
    if @bookmark.save
      # @review.list = List.new(list_params)
      redirect_to list_path(params[:list_id])
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    # raise
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    bookmark_params_hash = params.require(:bookmark).permit(:comment, :movie_id)
    bookmark_params_hash[:list_id] = params[:list_id]
    bookmark_params_hash
  end

  def list_params
    params.require(:list_id).permit(:list_id)
  end
end
