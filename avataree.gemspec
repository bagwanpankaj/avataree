# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{avataree}
  s.version = "0.6.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bagwan Pankaj"]
  s.date = %q{2016-01-26}
  s.description = %q{Ruby DSL for Gravatar profile and images}
  s.email = %q{bagwanpankaj@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.markdown"
  ]
  s.files = [
    "LICENSE.txt",
    "VERSION",
    "lib/avataree.rb",
    "lib/avataree/helper.rb",
    "lib/avataree/image.rb",
    "lib/avataree/profile.rb",
    "lib/avataree/railtie.rb",
    "lib/avataree/switch.rb"
  ]
  s.homepage = %q{http://github.com/bagwanpankaj/avataree}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby DSL for Gravatar profile and images}
  s.test_files = [
    "spec/avataree_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency 'activesupport', '>= 2.3.5'
      s.add_runtime_dependency 'json', '> 0'
    else
      s.add_runtime_dependency 'activesupport', '>= 2.3.5'
      s.add_runtime_dependency 'json', '> 0'
    end
  else
    s.add_runtime_dependency 'activesupport', '>= 2.3.5'
    s.add_runtime_dependency 'json', '> 0'
  end
end

