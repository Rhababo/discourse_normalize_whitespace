# frozen_string_literal: true

# name: optional-normalize-whitespace
# about: add option to disable removing non standard spaces (U+0020) from posts
# version: 0.1
# authors: Rhababo
# url: https://github.com/Rhababo/discourse_normalize_whitespace.git
# transpile_js: true

enabled_site_setting :discourse_normalize_whitespace

after_initialize do

  # overrides the default normalize_whitespaces function in discourse/lib/text_cleaner.rb
  # adds discourse_normalize_whitespace setting (defaults to false)
  # when true, normalize_whitespace runs as normal
  # when false, it does nothing, which allows for persistence of non-default whitespace.
    class ::TextCleaner
    module Optional_normalize_whitespace
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
    singleton_class.prepend Optional_normalize_whitespace
  end
end

