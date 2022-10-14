# Uniformity

Generates an Engine for any external service you're using in a Ruby on Rails application.

This way the service is completely encapsulated and separate from the main application. The rigid Rails Engine structure makes it easy to add things, because everything is in the right place.

## Why I made this

Great use cases are:

* Postal code validation
* Weather information
* Interfaces for microservices
* Payment flow for ecommerce

The engine should contain all your code specific to the service. Now your main application is free of an untold number of implicit dependencies. Instead, it has just one: the engine that neatly sits inside the application's folder. Ditch the service by ditching _only_ the engine. Never wonder where any change in relation to the service should go.

The beauty of this approach is that the engine behaves just a regular Rails application, with all the familiar folders for models, controllers, views, jobs, etcetera. The generated engine is namespaced so that it never clashes with any official Gem provided by the service. It also follows best practices so you don't have to.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uniformity', group: :development
```

And then execute:

    $ bundle

## Usage

Imagine you want to use the fictional external service `Space Babies`. Run this command:

```
rails generate uniformity:engine space_babies
```

It generates a shiny new Rails Engine in the `engines` directory and hooks it up to the main app. Put all the code pertaining to this service in the engine. Use any Rails design pattern you need. A few empty classes using the correct namespace are generated for you as a starting point.

### Included in the engine

The engine makes the following things available:

* Routes into the engine, mounted in your main routes
* Controllers to respond to those routed requests
* Models and views as well, all namespaced under the engine
* Assets like CSS and JavaScript via the asset pipeline
* Jobs for background workers
* Mailers if you need to send mail
* Serializers for e.g. XML representations of models
* Rake tasks, also properly namespaced
* Flexible configuration class to store things like API keys
* Full localization support, also namespaced

Only built-in functionality is used; the engine does not rely
on any gem besides stock Rails.

### Dependencies

If the code inside the generated engine depends on a gem, put those in the engine's `gemspec` and not in your main app. Make sure your main app has just the one dependency on the engine. By requiring the engine, its dependencies are automatically required as well.

After generatin', you can remove Uniformity from your Gemfile if you want. The generated engine has no dependencies whatsoever, outside from Rails. There is no harm in leaving Uniformity enabled either, since it has no run-time code.

## Contributing

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/spacebabies/uniformity/blob/master/CODE_OF_CONDUCT.md).

Bug reports and pull requests are welcome on GitHub at https://github.com/spacebabies/uniformity.

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
