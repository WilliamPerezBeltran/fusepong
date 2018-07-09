module VotersHelper
	def form_title
		@voter.new_record? ? "Nuevo voter" : "Editar voter"
		
	end
end
