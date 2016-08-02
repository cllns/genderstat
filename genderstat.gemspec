$:.push File.expand_path("../lib", __FILE__)
require "genderstat/version"

Gem::Specification.new do |s|
  s.name                  = 'genderstat'
  s.version               = Genderstat::VERSION
  s.date                  = '2014-08-23'
  s.summary               = "A gendered language frequency calculator"
  s.description           = "Calculate the relative frequencies of gendered language in a file or on the web"
  s.authors               = ["Sean Collins"]
  s.email                 = 'sean@cllns.com'
  s.files                 = `git ls-files`.split($/)
  s.executables           = 'genderstat'
  s.required_ruby_version = '>= 2.0'
  s.homepage              = 'http://github.org/cllns/genderstat'
  s.license               = 'MIT'

  s.add_runtime_dependency 'open_uri_redirections'
end
