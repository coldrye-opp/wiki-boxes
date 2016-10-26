# Prevent load-order problems in case openproject-plugins is listed after a plugin in the Gemfile
# or not at all

require 'open_project/plugins'
require 'coldrye/openproject/plugins/wiki_boxes/macros'

module Coldrye
    module OpenProject
        module Plugins
            module WikiBoxes
                class Engine < ::Rails::Engine
                    engine_name :coldrye_openproject_plugins_wiki_boxes

                    include ::OpenProject::Plugins::ActsAsOpEngine

                    register 'coldrye-openproject-plugins-wiki_boxes',
                        :author_url => 'http://coldrye.eu',
                        :requires_openproject => '>= 3.0.0pre13'
                end
            end
        end
    end
end

