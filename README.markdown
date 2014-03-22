# Avataree

[![Build Status](https://travis-ci.org/bagwanpankaj/avataree.svg?branch=master)](https://travis-ci.org/bagwanpankaj/avataree)
[![Gem Version](https://badge.fury.io/rb/avataree.png)](http://badge.fury.io/rb/avataree)

Ruby DSL for Gravatar profile and images.

# What is it?

Again I'll repeat that it's a "Ruby DSL for "Gravatar":http://en.gravatar.com profile and images."

# Getting Started

create a dependency in your Gemfile

```ruby
gem 'avataree'
```

then run

```
bundle install
```

and you avataree will be up and running.

## How to use It

yeah that sound's a good question.

in your controller

for fetching gravatar image

```ruby
gravatar(email)
```

here are options and there possible values:

| **Options**           | **What value do they take**                                         |
|:----------------------|:--------------------------------------------------------------------|
| :extension            | extension of image to be fetched(default => jpg)                    |
| :secure               | boolean to/not to use https scheme (default => false)               |
| :s or :size           | size of image (e.g 100x100) (default => 80x80)                      |
| :d or :default        | default image to be used(e.g. 404, mm, identicon ..)                |
| :f or :forcedefault   | takes 'y' or 'n' as argument. always force to load default image    |
| :r or :rating         | image rating (e.g. g, pg, r, x)                                     |

for fetching gravatar profile

```ruby
gravatar_profile(email)
```

| **Options** | **What value do they take**                           |
|:------------|:------------------------------------------------------|
| :secure     | boolean to/not to use https scheme (default => false) |

## Credits

Credit for this gem goes to Gravatar team for making such a awesome application.

## More Info

For detailed info visit my blog "http://BagwanPankaj.com":http://bagwanpankaj.com

For more info write me at bagwanpankaj[at]gmail.com or me[at]bagwanpankaj.com

Copyright (c) 2010 Bagwan Pankaj: http://bagwanpankaj.com, released under the MIT license

## Contributing to avataree
 
Fork, Implement and then send across a pull request.

## Copyright

Copyright (c) 2010 [Bagwan Pankaj]. See LICENSE.txt for further details.