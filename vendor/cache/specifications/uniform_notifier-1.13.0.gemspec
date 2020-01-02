# -*- encoding: utf-8 -*-
# stub: uniform_notifier 1.13.0 ruby lib

Gem::Specification.new do |s|
  s.name = "uniform_notifier".freeze
  s.version = "1.13.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/flyerhzm/uniform_notifier/issues", "changelog_uri" => "https://github.com/flyerhzm/uniform_notifier/blob/master/CHANGELOG.md", "source_code_uri" => "https://github.com/flyerhzm/uniform_notifier" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Richard Huang".freeze]
  s.date = "2019-10-05"
  s.description = "uniform notifier for rails logger, customized logger, javascript alert, javascript console, growl and xmpp".freeze
  s.email = ["flyerhzm@gmail.com".freeze]
  s.homepage = "http://rubygems.org/gems/uniform_notifier".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.0.6".freeze
  s.summary = "uniform notifier for rails logger, customized logger, javascript alert, javascript console, growl and xmpp".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<ruby-growl>.freeze, ["= 4.0"])
      s.add_development_dependency(%q<ruby_gntp>.freeze, ["= 0.3.4"])
      s.add_development_dependency(%q<xmpp4r>.freeze, ["= 0.5"])
      s.add_development_dependency(%q<slack-notifier>.freeze, [">= 1.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["> 0"])
    else
      s.add_dependency(%q<ruby-growl>.freeze, ["= 4.0"])
      s.add_dependency(%q<ruby_gntp>.freeze, ["= 0.3.4"])
      s.add_dependency(%q<xmpp4r>.freeze, ["= 0.5"])
      s.add_dependency(%q<slack-notifier>.freeze, [">= 1.0"])
      s.add_dependency(%q<rspec>.freeze, ["> 0"])
    end
  else
    s.add_dependency(%q<ruby-growl>.freeze, ["= 4.0"])
    s.add_dependency(%q<ruby_gntp>.freeze, ["= 0.3.4"])
    s.add_dependency(%q<xmpp4r>.freeze, ["= 0.5"])
    s.add_dependency(%q<slack-notifier>.freeze, [">= 1.0"])
    s.add_dependency(%q<rspec>.freeze, ["> 0"])
  end
end
