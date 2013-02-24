# HelperMethods

Simple help methods that helps you to DRY.

## Installation

Add this line to your application's Gemfile:

    gem 'helper_methods'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install helper_methods

## Usage

Included helpers:

    error_messages_for @resource
    flash_messages
    mobile_device?
    youtube('z8WXgoBGRb4')
    youtube('z8WXgoBGRb4', 720, 480)
    youtube_link('z8WXgoBGRb4')
    icon('th-large icon-white')
    active_link_to 'some string', some_path
    attachment_url file, :style # return full url for attachment
    qr_code_for 'url', 'size in pixels'

### Youtube helpers

In your views, use:

    youtube('z8WXgoBGRb4')

And it will become:

    <iframe width='580' height='420'
        src='http://www.youtube.com/embed/z8WXgoBGRb4'
        frameborder='0'
        allowfullscreen>
    </iframe>

You can pass width and height to.

   youtube('z8WXgoBGRb4', 720, 480)

If you want the complete link, use:

    youtube_link('z8WXgoBGRb4')

To return
    
    http://www.youtube.com/watch?v=z8WXgoBGRb4

### Form helpers

In your forms use:

    <%= error_messages_for @resource %>

And it will return:

    <div class="alert alert-error">
      <button type="button" class="close" data-dismiss="alert">×</button>
      <p>Error description 1</p>
      <p>Error description 2</p>
    </div>

Optionaly, you can pass a css class for ul element:

    <%= error_messages_for @resource, 'my_css_class' %>

And it will return:

    <div class="my_css_class">
      <button type="button" class="close" data-dismiss="alert">×</button>
      <p>Error description 1</p>
      <p>Error description 2</p>
    </div>

### View helpers

For using flash messages, in your layout file, do:

    <%= flash_messages %>

And in your controller, use:

    flash[:success] = "Your success message"
    flash[:notice] = "Your alert message"
    flash[:error] = "Your error message"
    flash[:info] = "Your info message"

This will return

    <p class="alert alert-success">Your success message is green</p>
    <p class="alert alert-notice">Your alert message is yellow</p>
    <p class="alert alert-error">Your error message is red</p>
    <p class="alert alert-info">Your info message is blue</p>

In your views, use

    icon('th-large icon-white')
    icon('th-large icon-white', 'Some text')

This will return

    <i class="th-large icon-white"></i>
    <i class="th-large icon-white"></i> Some text
    
Made for twitter-bootstrap.

### Mobile helpers

And this helps you to manage mobile views

    mobile_device?

We have also a copy of active_link_to gem inside. If you want to use the original gem, please, visit: http://rubygems.org/gems/active_link_to

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
