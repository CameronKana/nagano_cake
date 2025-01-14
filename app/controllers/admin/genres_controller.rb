class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def new
    @genre = Genre.new
  end


  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  # 投稿データの保存
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    redirect_to genre_path(@genre)
    end
  end

   # 投稿データのストロングパラメータ
  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
