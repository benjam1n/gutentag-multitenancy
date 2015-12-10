# Gutentag::Multitenancy

This gem extends [Gutentag](https://github.com/pat/gutentag) with multitenancy support.

Gutentag's tags are available to every user of your application; this gem scopes the tags by tenant.


## Installation

If you haven't installed Gutentag yet, [install](https://github.com/pat/gutentag#installation) it now.  You'll need to modify your Gemfile to install the latest version from HEAD:

```ruby
gem 'gutentag', github: 'pat/gutentag', ref: '51bd8f2f37f21dc4ef84a87889db4f28aa3573e2'
```

Add `gutentag_multitenancy` to your Gemfile, and `bundle install`:

```ruby
gem 'gutentag-multitenancy'
```

Now import and run the migration:

```
rake gutentag_multitenancy:install:migrations
rake db:migrate
```


## Usage

Define a `tenant_id` method in each model which can have tags.  In the following example each author has their own set of tags for articles:

```ruby
class Article < ActiveRecord::Base
  belongs_to :author

  has_many_tags  # from Gutentag

  def tenant_id
    author.id
  end
end
```

To retrieve all the tags for a tenant, use the `by_tenant_id` scope:

```ruby
Gutentag::Tag.by_tenant_id 42
```

## To Do

- Tests.


## License

Copyright 2015 Andrew Stewart.

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

