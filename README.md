# PrexView

A composer library to use PrexView a fast, scalable and very friendly service for programatic HTML, PDF, PNG or JPG generation using JSON or XML data.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'PrexView'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install PrexView

## Quick Start

First you need download PrexView Studio, [click here for download](https://prexview.com/downloads/)

To use this gem you only need to configure the API REST integration in PrexView Studio.

You can find this using your PrexView account and going to API section, generate your token, like next image.

![API token](./img/api.png)

You can use your token by two forms, first and our recomendation is use a enviroment variable for load your token, only use a predefined name `PREXVIEW_TOKEN` :

```bash
$ export PREXVIEW_TOKEN=<token>
```
If you using this method your token is easy to change and maintain, and don't is necesary add the token param in request.

The other way is use your token embed in your request, thats way example in the next section. 

```bash
$ export MY_AWESOME_BUT_DESCRIPTIVE_NAME_ENVIROMENT=<token>
```
For create a new request:

```ruby
# Using your AWESOME BUT DESCRIPTIVE NAME ENVIROMENT
PrexView.transform({type: 'xml', design: "design-xml", text: "<xml>hello world</xml>", token: "#{ENV['MY_AWESOME_BUT_DESCRIPTIVE_NAME_ENVIROMENT']}" })
```

```ruby
# Using predefined PREXVIEW_TOKEN enviroment
PrexView.transform({type: 'xml', design: "design-xml", text: "<xml>hello world</xml>"})
```

**Design:** For use design first you add a design in PrexView Studio, go to design section and create one:

![Design](./img/design.png)

For more information please check the [documentation](https://prexview.com/docs/) or look our [examples](/examples/)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/prexview/prexview-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

