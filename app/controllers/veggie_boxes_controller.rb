class VeggieBoxesController < ApplicationController
	before_action :set_veggie_box, except: :new
  before_action :require_login

  def new
    @veggie_box = VeggieBox.new
    render layout: "admin"
  end

  def create
    @veggie_box = VeggieBox.new(veggie_box_params)

    if @veggie_box.save
      redirect_to root_path
    else
      flash.now[:error] = "error!"
      render :new
    end
  end

  def edit
    render layout: "admin"
  end

  def update
  	if @veggie_box.update(veggie_box_params)
  		redirect_to root_path
  	else
  		flash.now[:error] = "error!"
  		render :edit
  	end
  end

  private

  def veggie_box_params
  	params.require(:veggie_box).permit(:title_ja, :title_en, :description_ja, :description_en, :photo)
  end

  def set_veggie_box
  	@veggie_box = VeggieBox.first
  end
end
