module HelperMethods

  def error_messages_for(resource, style = 'danger')
    if resource.errors.any?
      content_tag :div, class: "alert alert-#{style} alert-dismissable" do
        content_tag :ol do
          resource.errors.collect do |key, value|
            content_tag :li, value
          end.join.html_safe
        end
      end
    end
  end

  def flash_messages
    if flash.any?
      content_tag :div, class: "alert alert-success alert-dismissable" do
        content_tag :ul do
          flash.collect do |key, value|
            unless [true, false, nil].include?(value)
              content_tag :li, value
            end
          end.join.html_safe
        end
      end
    end
  end

end
