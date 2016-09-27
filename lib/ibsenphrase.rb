require "ibsenphrase/version"
require "ibsenphrase/generator"
require "ibsenphrase/wordlist"
require "ibsenphrase/random"

module Ibsenphrase
  class << self
    def root
      @@ROOT ||= File.expand_path(File.join(File.dirname(__FILE__), '..'))
    end
  end
end
