#-- copyright
#TBD
#++

require 'redmine/wiki_formatting/macros'

module Coldrye
    module OpenProject
        module Plugins
            module WikiBoxes
                Redmine::WikiFormatting::Macros.register do
                    desc "Displays a custom box. Synopsis:\n\n" +
                         "  {{box(sign=none|hint|info|alert|question|warn,bg=css-color,fg=css-color,orientation=ltr|rtl,width=css-width,align=left|center|right}}"
 
                    macro :box do |obj, args|
                        Coldrye::OpenProject::Plugins::WikiBoxes::render_box(args, default_sign="none", :sign, :bg, :fg, :orientation, :width, :align)
                    end
                end

                Redmine::WikiFormatting::Macros.register do
                    desc "Displays a box with a hint sign. Synopsis:\n\n" +
                         "  {{hint(bg=css-color,fg=css-color,orientation=ltr|rtl,width=css-width,align=left|center|right}}"
 
                    macro :hint do |obj, args|
                        Coldrye::OpenProject::Plugins::WikiBoxes::render_box(args, default_sign="hint", :bg, :fg, :orientation)
                    end
                end

                Redmine::WikiFormatting::Macros.register do
                    desc "Displays a box with a warning sign. Synopsis:\n\n" +
                         "  {{warn(bg=css-color,fg=css-color,orientation=ltr|rtl,width=css-width,align=left|center|right}}"
 
                    macro :warn do |obj, args|
                        Coldrye::OpenProject::Plugins::WikiBoxes::render_box(args, default_sign="warn", :bg, :fg, :orientation)
                    end
                end

                Redmine::WikiFormatting::Macros.register do
                    desc "Displays a box with an alert sign. Synopsis:\n\n" +
                         "  {{alert(bg=css-color,fg=css-color,orientation=ltr|rtl,width=css-width,align=left|center|right}}"
 
                    macro :alert do |obj, args|
                        Coldrye::OpenProject::Plugins::WikiBoxes::render_box(args, default_sign="alert", :bg, :fg, :orientation)
                    end
                end

                Redmine::WikiFormatting::Macros.register do
                    desc "Displays an info box. Synopsis:\n\n" +
                         "  {{info(bg=css-color,fg=css-color,orientation=ltr|rtl,width=css-width,align=left|center|right}}"
 
                    macro :info do |obj, args|
                        Coldrye::OpenProject::Plugins::WikiBoxes::render_box(args, default_sign="info", :bg, :fg, :orientation)
                    end
                end

                Redmine::WikiFormatting::Macros.register do
                    desc "Displays a box with a question mark sign. Synopsis:\n\n" +
                         "  {{question(bg=css-color,fg=css-color,orientation=ltr|rtl,width=css-width,align=left|center|right}}"
 
                    macro :question do |obj, args|
                        Coldrye::OpenProject::Plugins::WikiBoxes::render_box(args, default_sign="question", :bg, :fg, :orientation)
                    end
                end

                class << self

                    include Redmine::WikiFormatting::Macros::Definitions

                    include ActionView::Helpers::TagHelper
                    attr_accessor :output_buffer

                    def render_box(args, default_sign='none', *keys)
                        args, options = extract_macro_options(args, *keys)

                        actual_sign = options[:sign] || default_sign
                        actual_orientation = options[:orientation] || 'ltr'
                        actual_width = options[:width] || '100%'
                        actual_align = options[:align] || 'center'
                        actual_bg = options[:bg] || 'transparent'
                        actual_fg = options[:fg] || 'inherit'

                        # TODO:sanity checks: orientation / align / width / bg / fg

                        content = []
                        if actual_sign != 'none'
                            content.push(
                                content_tag(:div, '&nbsp;'.html_safe, class:['sign', actual_sign])
                            )
                        end

                        # TODO:render text as wiki markup
                        text = 'sample *wiki markup*'
                        content.push(content_tag(:div, text, class:'text'))

                        content.reverse! unless actual_orientation == 'ltr'

                        content_tag(:div, class:['wiki-boxes', actual_align, actual_sign], style:"background-color:" + actual_bg + ";color:" + actual_fg + ";max-width:" + actual_width + ";width:" + actual_width) do
                            content.collect do |c|
                                c
                            end.join.html_safe
                        end
                    end
                end
            end
        end
    end
end

