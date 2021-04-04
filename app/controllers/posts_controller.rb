class PostsController < ActionController::Base

	before_action :authenticate_account!
	before_action :set_post, only: [:show]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.account_id = current_account.id if account_signed_in?

		if @post.save
			
			redirect_to dashboard_path, flash: { success: "Post was created"}
		else
			redirect_to new_post_path, flash: { success: "Post was not created"}
		end
	end

	def show
		@comment = Comment.new

	end

	def set_post
		@post = Post.find(params[:id]) if params[:id].present?

	end

	private

		def post_params
			params.require(:post).permit(:description,:image, :image_cache)
		end 

end