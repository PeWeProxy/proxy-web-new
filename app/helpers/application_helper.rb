module ApplicationHelper

	def nav_link(link_text, link_path, first_li = false)
  class_name = current_page?(link_path) ? 'selected' : ''
	
	if first_li
		class_name += ' firstItem'
	end
	
  content_tag(:li, :class => class_name) do
    link_to link_text, link_path
  end
end

end