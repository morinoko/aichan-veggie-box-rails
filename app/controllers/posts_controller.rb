class PostsController < ApplicationController
	before_action :set_post, only: %w{show edit update}

	def show
	end

	def new
		@post = Post.new
		render layout: "admin"
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to post_path(@post)
		else
			render :new, layout: "admin"
		end
	end

	def edit
		render layout: "admin"
	end

	def update
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def set_post
		@post = Post.find_by(id: params[:id])
	end
end
