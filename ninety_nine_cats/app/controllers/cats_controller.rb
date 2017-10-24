class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    if @cat
      render :show
    else
      render json: @cat.errors.full_messages
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.create(cat_params)
    if @cat
      render json: @cat
    else
      render json: @cat.errors.full_messages
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update

    cat = Cat.find(params[:id])
    cat.update(cat_params)
    if cat
      render json: cat
    else
      render json: cat.errors.full_messages
    end
  end

  private

  def cat_params
    params[:cat].permit(:name, :sex, :color, :description, :birth_date)
  end
end
