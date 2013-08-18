$:.push File.expand_path("../lib", __FILE__)
require "urbanterror/version"

Gem::Specification.new do |s|
  s.name = 'urbanterror'
  s.summary = 'Provides a class and utilities to get informations and control Urban Terror servers via UDP queries.'
  s.description = 'Provides a class and utilities to get informations and control Urban Terror servers via UDP queries.'

  s.authors = ['Ricky Elrod']
  s.email = 'ricky@elrod.me'
  s.license = 'MIT'

  s.files = Dir.glob("lib/**/*")
  s.require_paths = ["lib"]

  s.version = UrbanTerror::VERSION
end
