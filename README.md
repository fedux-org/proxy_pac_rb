# Proxy Pac Rb

`proxy_pac_rb` is a gem to parse [proxy auto-config](http://en.wikipedia.org/wiki/Proxy_auto-config) files.
`proxy_pac_rb` uses a JavaScript runtime to evaulate a proxy auto-config file the same way a browser does to determine what proxy (if
any at all) should a program use to connect to a server. You must install on of the supported JavaScript runtimes:
therubyracer, therubyrhino

Big thanks to [sstephenson](https://github.com/sstephenson)'s [execjs](https://github.com/sstephenson/execjs) for the
runtime wrapper code and to
[samuelkadolph](https://github.com/samuelkadolph/ruby-pac)'s
[ruby-pac](https://github.com/samuelkadolph/ruby-pac) for the foundation of this gem.

## Installing

Add this line to your application's Gemfile:

    gem 'proxy_pac_rb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install proxy_pac_rb


## Requirements

After installing the `proxy_pac_rb` gem you must install a JavaScript runtime. Compatible runtimes include:

* [therubyracer](https://rubygems.org/gems/therubyracer) Google V8 embedded within Ruby
* [therubyrhino](https://rubygems.org/gems/therubyrhino/) Mozilla Rhino embedded within JRuby

## Usage

### Command Line

```
parsepac https://github.com/dg-vrnetze/proxy_pac_rb/raw/master/files/sample.pac https://github.com
parsepac https://github.com/dg-vrnetze/proxy_pac_rb/raw/master/files/sample.pac http://ruby-lang.com
parsepac https://github.com/dg-vrnetze/proxy_pac_rb/raw/master/files/sample.pac http://samuel.kadolph.com
```

### Ruby

```ruby
require "rubygems"
require "pac"

pac = PAC.load('https://github.com/dg-vrnetze/proxy_pac_rb/raw/master/files/sample.pac')
pac.find('https://github.com')        # => "PROXY proxy:8080"
pac.find('http://ruby-lang.com')      # => "PROXY proxy:8080; DIRECT"
pac.find('http://samuel.kadolph.com') # => "DIRECT"

pac = PAC.read("sample.pac")

pac = PAC.source <<-JS
  function FindProxyForURL(url, host) {
    return "DIRECT";
  }
JS
pac.find('http://localhost') # => "DIRECT"
```

## Available JavaScript Functions

* isPlainHostName(host)
* dnsDomainIs(host, domain)
* localHostOrDomainIs(host, hostdom)
* isResolvable(host)
* isInNet(host, pattern, mask)
* dnsResolve(host)
* myIpAddress()
* dnsDomainLevels(host)
* shExpMatch(str, shexp)
* weekdayRange(wd1, wd2, gmt)
* dateRange(*args)
* timeRange(*args)

## Developers

### Contributing

If you want to contribute: fork, branch & pull request.

### Running Tests

```
bundle install
rake test:rspec
rake test:rubyracer
rake test:rubyrhino
```
