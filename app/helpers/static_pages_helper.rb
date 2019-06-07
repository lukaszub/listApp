module StaticPagesHelper
	
	def title_method(page_title = '')
		title = "ListApp"

		if page_title.empty?
			title
		else
			title + " | " + page_title 
		end	
	end

	def footer_method
		
	end
end
