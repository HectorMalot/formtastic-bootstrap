module FormtasticBootstrap
  module Inputs
    module Base
      module Errors

        include Formtastic::Inputs::Base::Errors

        def error_html(inline_or_block = :block)
          errors? ? send(:"error_#{builder.inline_errors}_html", inline_or_block) : ""
        end

        def error_sentence_html(inline_or_block)
          error_class = if inline_or_block == :inline
            options[:error_class] || builder.default_inline_error_class
          else
            options[:error_class] || builder.default_block_error_class
          end

          error_label = if options[:error_label].nil?
                          builder.default_with_error_label
                        else
                          options[:error_label]
                        end

          if error_label
            label_icon = template.content_tag(:i, '', :class => 'icon-exclamation-sign icon-white')
            label_tag = template.content_tag(:span, label_icon + localized_string('formtastic.error', ' Error: ', :label), :class => 'label')
          else
            label_tag = ""
          end

          template.content_tag(:span, label_tag + Formtastic::Util.html_safe(errors.to_sentence.html_safe), :class => error_class)
        end

        def error_list_html(ignore)
          super
        end

        def error_first_html(inline_or_block = :block)
          error_class = if inline_or_block == :inline
            options[:error_class] || builder.default_inline_error_class
          else
            options[:error_class] || builder.default_block_error_class
          end
          template.content_tag(:span, Formtastic::Util.html_safe(errors.first.untaint), :class => error_class)
        end

        def error_none_html(ignore)
          ""
        end

      end
    end
  end
end
