module HelperMethods

  def bootstrap_icon(name:, text: nil, config: :default)
    icon = content_tag(:span, nil, class: "glyphicon glyphicon-#{name}")
    label = content_tag(:span, text, class: "glyphicon-text")

    opts = {
      default: "#{icon}#{(label if text)}",
      text_first: "#{(label if text)}#{icon}"
    }

    opts[config].html_safe
  end

  def bootstrap_label(text:, style: :default)

    labels = {
      default: 'label-default',
      primary: 'label-primary',
      success: 'label-success',
      info: 'label-info',
      warning: 'label-warning',
      danger: 'label-danger'
    }

    content_tag :span, text, class: "label #{labels[style]}".html_safe
  end

  def bootstrap_badge(text:, style:'')
    content_tag(:span, text, class: "badge #{style}").html_safe
  end

end
