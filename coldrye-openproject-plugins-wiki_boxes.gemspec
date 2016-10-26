# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

require 'coldrye/openproject/plugins/wiki_boxes/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "coldrye-openproject-plugins-wiki_boxes"
  s.version     = Coldrye::OpenProject::Plugins::WikiBoxes::VERSION
  s.authors     = "coldrye"
  s.email       = "trancesilken@gmail.com"
  s.homepage    = "https://github.com/coldrye-opp/wiki-boxes"
  s.summary     = 'Wiki Boxes'
  s.description = 'Suite of wiki macros that provide boxes'
  s.license     = 'Apache License 2.0'

  s.files = Dir["{app,config,db,lib}/**/*"] + %w(CHANGELOG.md README.md)

  s.add_dependency "rails", "~> 4.2.7"
end
