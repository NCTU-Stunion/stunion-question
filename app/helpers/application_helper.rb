module ApplicationHelper
  def bootstrap_class_for(flash_type)
    flash_type = flash_type.to_sym
    case flash_type
      when :success
        "success" # Green
      when :error
        "danger" # Red
      when :alert
        "warning" # Yellow
      when :notice
        "info" # Blue
      else
        flash_type.to_s
    end
  end
end
