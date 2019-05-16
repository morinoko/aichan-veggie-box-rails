class VeggieBoxesController < ApplicationController
	before_action :set_veggie_box

  def edit
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
