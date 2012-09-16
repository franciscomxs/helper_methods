require "helper_methods/version"

module HelperMethods

  def error_messages_for(resource, css_class = "alert alert-error")
    if resource.errors.any?
      error_list = resource.errors.collect do |key, value|
        content_tag :li, value
      end.join

      %(<ul class="#{css_class}">#{error_list}</ul>).html_safe
    end
  end

  def flash_messages
    flash.collect do |key, value|
      content_tag(:p, value, :class => "alert alert-#{key}")
    end.join.html_safe
  end

  def mobile_device?
  	request.user_agent =~ /Mobile|webOS/
  end

  def youtube(video)
    "<iframe width='580' height='420' src='http://www.youtube.com/embed/#{video}' frameborder='0' allowfullscreen></iframe>".html_safe
  end
 
  def youtube_link(video)
    link_to "www.youtube.com/watch?v=#{video}", "http://www.youtube.com/watch?v=#{video}", class: 'various fancybox-media'
  end

  def textilize(text)
    RedCloth.new(text).to_html.html_safe
  end

  def icon(icon, text="", direction="l")
    return "<i class='icon-#{icon}'></i> #{text}".html_safe if direction == 'l'
    return "#{text} <i class='icon-#{icon}'></i>".html_safe if direction == 'r'
  end

end

ActionView::Base.send :include, HelperMethods