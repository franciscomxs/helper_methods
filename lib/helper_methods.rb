# encoding: UTF-8

require "helper_methods/version"

module HelperMethods

  def error_messages_for(resource, style = :bootstrap)
    if resource.errors.any?
      
      if style == :bootstrap
        css_class = "alert alert-error"
        content = %(<button type="button" class="close" data-dismiss="alert">×</button>)
        content +=  %(<ul>)      
        resource.errors.collect do |key, value|
          content += content_tag :li, value
        end.join
        content  += %(</ul>)
        
      elsif style == :foundation
        css_class = "alert-box alert"
        
        content = %(<a href="" class="close">&times;</a>)
        content +=  %(<ul>)      
        resource.errors.collect do |key, value|
          content += content_tag :li, value
        end.join
        content  += %(</ul>)
      end      
      
    content_tag :div, content.html_safe, class: css_class
    end
  end


  def flash_messages(style = :bootstrap)
    if flash.any?
      
      if style == :bootstrap
        
        content = %(<button type="button" class="close" data-dismiss="alert">×</button>)
        flash.collect do |key, value|
          unless [true, false, nil].include?(value)
            key = :success if key == :notice
            content += value
            content_tag(:div, content.html_safe, class: "alert alert-#{key}")
          end
        end.join.html_safe
        
      elsif style == :foundation
        content = %(<a href="" class="close">&times;</a>)
        flash.collect do |key, value|
          unless [true, false, nil].include?(value)
            key = :success if key == :notice
            content += value
            content_tag(:div, content.html_safe, class: "alert-box #{key}")
          end
        end.join.html_safe
      end
      
    end
  end


  def mobile_device?
  	request.user_agent =~ /Mobile|webOS/
  end

  def youtube(video, width = 580, height = 420)
    "<iframe width='#{width}' height='#{height}' src='http://www.youtube.com/embed/#{video}' frameborder='0' allowfullscreen></iframe>".html_safe
  end
 
  def youtube_link(video)
    link_to "www.youtube.com/watch?v=#{video}", "http://www.youtube.com/watch?v=#{video}", class: 'various fancybox-media'
  end

  def icon(icon, text="", direction="l")
    return "<i class='icon-#{icon}'></i> #{text}".html_safe if direction == 'l'
    return "#{text} <i class='icon-#{icon}'></i>".html_safe if direction == 'r'
  end

  def active_link_to(*args, &block)
    if block_given?
      name          = capture(&block)
      options       = args[0] || {}
      html_options  = args[1] || {}
    else
      name          = args[0]
      options       = args[1] || {}
      html_options  = args[2] || {}
    end
    url = url_for(options)
    
    active_options  = { }
    link_options    = { }
    html_options.each do |k, v|
      if [:active, :class_active, :class_inactive, :active_disable, :wrap_tag].member?(k)
        active_options[k] = v
      else
        link_options[k] = v
      end
    end
    
    css_class = link_options.delete(:class).to_s + ' '
    css_class << active_link_to_class(url, active_options)
    css_class.strip!
    
    wrap_tag = active_options[:wrap_tag].present? ? active_options[:wrap_tag] : nil
    link_options[:class] = css_class if css_class.present? && !wrap_tag
    
    link = if active_options[:active_disable] === true && is_active_link?(url, active_options[:active])
      content_tag(:span, name, link_options)
    else
      link_to(name, url, link_options)
    end
    
    wrap_tag ? content_tag(wrap_tag, link, :class => css_class) : link
  end

  def active_link_to_class(url, options = {})
    if is_active_link?(url, options[:active])
      options[:class_active] || 'active'
    else
      options[:class_inactive] || ''
    end
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
  
  def gravatar(email, html_options = {})
    email = Digest::MD5.hexdigest(email)
    image_tag "http://www.gravatar.com/avatar/#{email}?size=48", html_options
  end

  def attachment_url(file, style = :original)
    protocol = request.ssl? ? 'https' : 'http'
    "#{protocol}//#{request.host_with_port}#{file.url(style)}"
  end

end

ActionView::Base.send :include, HelperMethods