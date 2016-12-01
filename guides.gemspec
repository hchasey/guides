# coding: utf-8
# frozen_string_literal: true
Gem::Specification.new do |spec|
  spec.name          = 'guides'
  spec.version       = '0.1.0'
  spec.authors       = ['Desiring God']
  spec.email         = ['web@desiringgod.org']

  spec.summary       = 'Guides for getting things done according to Desiring God development standards.'
  spec.homepage      = 'https://github.com/desiringgod/guides'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.add_dependency 'rubocop'
end
