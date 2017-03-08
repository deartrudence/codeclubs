module ApplicationHelper
	def link_to_add_fields(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		fields = f.fields_for(association, new_object, child_index: id) do |builder|
			render(association.to_s.singularize + "_fields", f: builder)
		end
		link_to(name, '#', class: 'add_fields custom-color-text', data: {id: id, fields: fields.gsub("\n", "")})
	end

	def en_provinces
		['All','British Columbia', 'Alberta', 'Saskatchewan', 'Manitoba', 'Ontario', 'Quebec', 'Nova Scotia','Newfoundland and Labrador', 'Prince Edward Island', 'North West Territories', 'Nunavut', 'Yukon']
	end

	def fr_provinces
		['Alberta', 'Colombie-Britannique', 'Manitoba', 'Nouveau-Brunswick', 'Terre-Neuve et Labrador', 'Territoires du Nord-Ouest', 'Nouvelle-Écosse', 'Nunavut', 'Ontario', 'Île-du-Prince-Édouard', 'Québec', 'Saskatchewan', 'Yukon']
	end
end
