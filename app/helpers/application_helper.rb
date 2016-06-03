module ApplicationHelper
  def alert_for(flash_type)
    {
      :success => 'alert_success',
      :error => 'alert_danger',
      :alert => 'alert_warning',
      :notice => 'alert_info'
    }[flash_type.to_sym] || flash_type.to_s
  end
  def form_image_select(post)
    return image_tag post.image.url(:medium),
                     id: 'image-preview',
                     class: 'img-responsive' if post.image.exists?
    image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
  end
end
