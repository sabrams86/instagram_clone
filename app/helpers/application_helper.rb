module ApplicationHelper
  def alert_for(flash_type)
    {
      :success => 'alert_success',
      :error => 'alert_danger',
      :alert => 'alert_warning',
      :notice => 'alert_info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
