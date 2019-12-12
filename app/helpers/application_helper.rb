module ApplicationHelper
	def if_nil_sort_icon(instance)
		if instance == nil
			return render inline: '<i class="fas fa-slash"></i>'
		else
			return instance
		end
	end

	def if_nil_sort_one(instance)
		if instance == nil
			return 1
		else
			return instance
		end
	end

	def if_nil_sort_false(instance)
		if instance == nil
			return false
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

	def six_last_accomodation
		a = Accomodation.all.order("updated_at DESC").first(6)
		return a
	end
	def user_favorites_accomodation
		u= []
		Favorite.where(:user_id => current_user.id).each do |f| 
			u << Accomodation.find(f.accomodation_id)
		end
		return u
	end
end
