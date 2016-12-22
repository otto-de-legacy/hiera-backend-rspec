hiera-backend-rspec
============

[![Gem Version](https://badge.fury.io/rb/hiera-backend-rspec.svg)](http://badge.fury.io/rb/hiera-backend-rspec) [![travis-ci](https://travis-ci.org/otto-de/hiera-backend-rspec.png?branch=master)](https://travis-ci.org/otto-de/hiera-backend-rspec) [![Code Climate](https://codeclimate.com/github/otto-de/hiera-backend-rspec/badges/gpa.svg)](https://codeclimate.com/github/otto-de/hiera-backend-rspec) [![Test Coverage](https://codeclimate.com/github/otto-de/hiera-backend-rspec/badges/coverage.svg)](https://codeclimate.com/github/otto-de/hiera-backend-rspec)

This gem provides a hiera backend for setting up hiera data in tests. At the time if this writing, hiera-backend-rspec is meant to interface with Hiera version 3.2.0.

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'hiera-backend-rspec'
```

And then run:

```shell
$ bundle install
```

Alternatively, if you wish to just use the gem in a script, you can run:

```shell
$ gem install hiera-backend-rspec
```

Finally, just add `require 'hiera-backend-rspec'` to the top of the file using this gem.

Usage
-----

Put this into your spec_helper.rb:

```ruby
RSpec.configure do |c|
  c.before(:each) do
    Thread.current[:rspec_hiera_data] = hiera_data if respond_to?(:hiera_data)
  end
    
  c.after(:each) do
    Thread.current[:rspec_hiera_data] = nil
  end
end
```

In your specs you can now set up simple hiera data.

```ruby
let(:hiera_data) do
  {
      'hiera::key' => 'value'
  }
end
```


Contributing
------------

Please fork and send pull request.
Make sure to have test cases for your changes.

License
-------

This program is licensed under the MIT license. See LICENSE for details.
