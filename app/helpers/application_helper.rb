module ApplicationHelper
	def logout_helper
		if current_user
    		link_to "Logout",destroy_user_session_path,method: :delete
		end
	end

	def find_department(doc)
		$department = User.where(id: Tender.where(id: doc.tender_id).select(:user_id)).pluck(:department).join
	end

	def get_ref_id(doc)
		Tender.where(id: doc.tender_id).pluck(:ref_id).join		
	end

	def set_tender_type(doc)
		if doc.type_of_tender == 0
			"Equipment"
		elsif doc.type_of_tender == 1
			"Quantity"
		elsif doc.type_of_tender == 2
			"Furniture"
		else
			"Others"
		end
	end

	def percent_estimated_cost(cost)
		0.02*cost
	end
				
end
