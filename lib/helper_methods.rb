require 'helper_methods/version'

module HelperMethods
  require 'action_view'
  require 'active_support/core_ext/object'
  include ActionView::Helpers::AssetTagHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper

  require 'helper_methods/bootstrap'
  require 'helper_methods/flash_messages'
  require 'helper_methods/gravatar'
  require 'helper_methods/mobile'
  require 'helper_methods/qr_code'
  require 'helper_methods/youtube'
end

ActionView::Base.send :include, HelperMethods
