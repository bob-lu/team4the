module ApplicationHelper
	def get_flash_class(name)
    case name.to_s
      when "notice"
        return "alert alert-success"
      when "error"
        return "alert alert-error"
    end
  end
end
