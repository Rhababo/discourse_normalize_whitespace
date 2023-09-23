# frozen_string_literal: true

# name: normalize-whitespace-optional
# about: stop removing extra whitespace from posts
# version: 0.1
# authors: Rhababo
# url: none
# transpile_js: true

enabled_site_setting :discourse_normalize_whitespace

after_initialize do

  class ::TextCleaner
    module NormalizeNormalize_whitespace
      def title_options
        options = super
        options[:normalize_whitespace_opt] = SiteSetting.discourse_normalize_whitespace
        options
      end
      def normalize_whitespaces(text)
        options = title_options
        if(options[:normalize_whitespace_opt])
          text = super(text)
        end
        text
      end
    end
    singleton_class.prepend NormalizeNormalize_whitespace
  end
end

