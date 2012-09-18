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

  def icon(icon, text="", direction="l")
    return "<i class='icon-#{icon}'></i> #{text}".html_safe if direction == 'l'
    return "#{text} <i class='icon-#{icon}'></i>".html_safe if direction == 'r'
  end

  def nav_link_to(text, path, css_class=nil, li_properties = {}, a_properties = {})
    lp = li_properties.collect do |k, v|
      %( #{k}="#{v}") unless k == :class
    end.join
    
    ap = a_properties.collect do |k, v|
      %( #{k}="#{v}") unless k == :class
    end.join

    tag_class = %( class="#{css_class unless css_class.nil? }#{' ' if current_page? path and  !css_class.nil?}#{'active' if current_page? path}") if current_page? path or !css_class.nil?

    %(<li#{tag_class}#{lp}>#{link_to text, path, a_properties}</li>).html_safe
  end

  def is_active_link?(url, condition = nil)
    url = url_for(url).sub(/\?.*/, '') # ignore GET params
    case condition
    when :inclusive, nil
      !request.fullpath.match(/^#{Regexp.escape(url)}(\/.*|\?.*)?$/).blank?
    when :exclusive
      !request.fullpath.match(/^#{Regexp.escape(url)}\/?(\?.*)?$/).blank?
    when Regexp
      !request.fullpath.match(condition).blank?
    when Array
      controllers = [*condition[0]]
      actions     = [*condition[1]]
      (controllers.blank? || controllers.member?(params[:controller])) &&
      (actions.blank? || actions.member?(params[:action]))
    when TrueClass
      true
    when FalseClass
      false
    end
  end

end

ActionView::Base.send :include, HelperMethods