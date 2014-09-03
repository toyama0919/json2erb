# Json2erb

Embed the JSON IN ERB

## Installation

Add this line to your application's Gemfile:

    gem 'json2erb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install json2erb

## Usage sample

### json data is @data

### simple usage
```bash
cat test.erb
#=> Hello <%= @data['hoge'] %>
```

```bash
echo '{"hoge":"fuga"}' | json2erb -i -e test.erb
#=> Hello fuga
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/json2erb/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
