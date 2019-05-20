class PostsController < ApplicationController
	before_action :require_login, except: %w{index show}
	before_action :set_post, only: %w{show edit update destroy}

	def index
		@posts = Post.all
	end

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
		if @post.update(post_params)
			redirect_to post_path(@post)
		else
			render :edit, layout: "admin"
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end

	def set_post
		@post = Post.find_by(id: params[:id])
	end
end
