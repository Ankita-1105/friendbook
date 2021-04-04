module AccountsHelper

	def profile_picture account, width = 100 , height = 100
		image_path = account.image.present? ? account.image.url : "user-alt-512.webp"
		image_tag(image_path, width: width , height: height,:class =>  "profile_image")
	end

	def can_edit_profile? profile_id
		account_signed_in? && current_account.id == profile_id

	end
end
