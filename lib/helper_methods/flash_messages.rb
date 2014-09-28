module HelperMethods

  def error_messages_for(resource:, style: 'danger')
    if resource.errors.any?
      content_tag :div, class: "alert alert-#{styles[style]} alert-dismissible" do
        content_tag :ol do
          resource.errors.collect do |key, value|
            content_tag :li, value
          end.join.html_safe
        end
      end
    end
  end

  def flash_messages
    flash.collect do |key, value|
      content_tag :div, class: "alert alert-#{styles[key]} alert-dismissable", role: "alert" do
        [close_button, value].join.html_safe
      end unless [true, false, nil].include?(value)
    end.join.html_safe
  end

  def close_button
    content_tag :button, type: 'button', class: 'close', data: { dismiss: 'alert' } do
      content_tag(:span, '×', aria: { hidden: 'true' }) + content_tag(:span, 'Close', class: 'sr-only')
    end
  end

  def styles
    {
      'notice' => 'success',
      'alert' => 'warning',
      'success' => 'success',
      'info' => 'info',
      'warning' => 'warning',
      'danger' => 'danger'
    }
  end

end
