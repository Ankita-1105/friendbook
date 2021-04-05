module AccountsHelper
	attr_accessor :friend_request
	def profile_picture account, width = 100 , height = 100
		image_path = account.image.present? ? account.image.url : "user-alt-512.webp"
		image_tag(image_path, width: width , height: height,:class =>  "profile_image")
	end

	def can_edit_profile? profile_id
		account_signed_in? && current_account.id == profile_id

	end
	def get_follower(account_id)
		name= []
		@follower_id=Follower.where(following_id:account_id)
   		@follower_id.each do |f|
      		name<<Account.find_by(id:f.follower_id).full_name()
     	 end
     	 
     	 name.join('<br><br><hr> ').html_safe
     	 
   	end

   	def get_following(account_id)
		name= []
		@following_id=Follower.where(follower_id:account_id)
   		@following_id.each do |f|
      		name<<Account.find_by(id:f.following_id).full_name()
     	 end
     	 
     	 name.join('<br><br><hr> ').html_safe
     	 
   	end
end




