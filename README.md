# Gutentag::Multitenancy

This gem extends [Gutentag](https://github.com/pat/gutentag) with multitenancy support.

Gutentag's tags are available to every user of your application; this gem scopes the tags by tenant.


## Installation

If you haven't installed Gutentag yet, [install](https://github.com/pat/gutentag#installation) it now.  You'll need to modify your Gemfile to install the latest version from HEAD:

```ruby
gem 'gutentag', github: 'pat/gutentag', ref: '51bd8f2f37f21dc4ef84a87889db4f28aa3573e2'
```

Now run the following migration (TODO: make a generator for this!):

```ruby
add_column :gutentag_tags, :tenant_id, :integer, null: false

remove_index :gutentag_tags, :name
add_index :gutentag_tags, [:name, :tenant_id], unique: true
```

Add this line to your application's Gemfile:

```ruby
gem 'gutentag-multitenancy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gutentag-multitenancy


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


## License

Copyright 2015 Andrew Stewart.

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

