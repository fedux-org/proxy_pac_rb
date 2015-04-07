RSpec::Matchers.define :be_downloaded_via do |expected|
  match do |actual|
    proxy_pac.find(actual) == expected
  end

  failure_message do |actual|
    format(%(expected that url "%s" is downloaded via "%s", but it is downloaded via "%s".), actual, expected, proxy_pac.find(actual))
  end

  failure_message_when_negated do |actual|
    format(%(expected that url "%s" is not downloaded via "%s", but it is downloaded via "%s".), actual, expected, proxy_pac.find(actual))
  end
end
