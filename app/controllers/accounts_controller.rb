class AccountsController < ApplicationController

	before_action :authenticate_account!
	before_action :set_account, only: [:profile]


	def index

		follower_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
		follower_ids << current_account.id
		@post = Post.includes(:account).where(account_id: follower_ids).active
		@comment = Comment.new

		following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)

		following_ids << current_account.id


		@follower_suggestions = Account.where.not(id: following_ids)
	end

	def profile
		@post = @account.posts.active
	end

	def follow_account

		follower_id = params[:follow_id]
		if Follower.create!(follower_id: current_account.id, following_id: follower_id)
			flash[:success] = "Now Following user"
		else
			flash[:danger] = "Unable to add follower"
		end	
		redirect_to dashboard_path
	end

	def follower
	end

	def follower
	end

	private
	
	def set_account
		@account = Account.find_by_username(params[:username])
	end


end
