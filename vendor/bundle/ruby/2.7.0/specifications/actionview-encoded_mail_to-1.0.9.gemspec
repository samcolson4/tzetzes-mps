# -*- encoding: utf-8 -*-
# stub: actionview-encoded_mail_to 1.0.9 ruby lib

Gem::Specification.new do |s|
  s.name = "actionview-encoded_mail_to".freeze
  s.version = "1.0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick Reed".freeze]
  s.date = "2016-12-19"
  s.description = "Rails mail_to helper with encoding (removed from core in Rails 4.0)".freeze
  s.email = "reednj77@gmail.com".freeze
  s.homepage = "https://github.com/reed/actionview-encoded_mail_to".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.2.21".freeze
  s.summary = "Deprecated support for email address obfuscation within the mail_to helper method.".freeze

  s.installed_by_version = "3.2.21" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rails>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
  end
end
