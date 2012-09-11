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

In your forms use:
		<%= error_messages_for @resource %>

And it will return:

    <ul class="alert alert-error">
      <li>Error description</li>
    </ul>

Optionaly, you can pass a css class for ul element:

    <%= error_messages_for @resource, 'my_css_class' %>

And it will return:

    <ul class="my_css_class">
      <li>Error description</li>
    </ul>

For using flash messages, in your layout file, do:

    <%= flash_messages %>

And in your controller, use:

    flash[:success] = "Your success message"
    flash[:notice] = "Your alert message"
    flash[:error] = "Your error message"
    flash[:info] = "Your info message"

This will return

    <p class="alert alert-success">Your success message</p>
    <p class="alert alert-notice">Your alert message</p>
    <p class="alert alert-error">Your error message</p>
    <p class="alert alert-info">Your info message</p>

Made for twitter-bootstrap.


And this helps you to manage mobile views
		mobile_device?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
