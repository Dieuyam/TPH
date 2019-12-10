module ApplicationHelper
	def if_nil_sort_icon(instance)
		if instance == nil
			return render inline: '<i class="fas fa-slash"></i>'
		else
			return instance
		end
	end
	def admin_to_check_icon(is_admin)
		if is_admin == true
			return render inline: '<i class="fas fa-check"></i>'
		else
			return render inline: '<i class="fas fa-times"></i>'
		end
	end
end
