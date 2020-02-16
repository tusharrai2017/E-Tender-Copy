module PageSets
	extend ActiveSupport::Concern
	def after_sign_in_path_for(resource)
    	pages_home_url
  	end

	def after_sign_out_path_for(resource)
    	root_url
  	end
end