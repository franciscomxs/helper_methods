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

	On your forms, use:
		<%= error_messages_for %>

	On your layout file, use:
		<%= flash_messages %>

	And this helps you to crete mobile views
		<%= mobile_device? %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
