require 'unicode'

module Ibsenphrase
  # A generator for passphrases
  class Generator
    # Generates a passphrase of words
    # @num_words [Integer] Number of words in passphrase
    # @opts (see #initialize)
    def self.passphrase(num_words=7, opts={})
      gen = Generator.new(opts)
      gen.passphrase(num_words)
    end

    # Initialize a generator instance
    #
    # @option opts [String] :wordlist 'words' The wordlist (in data/wordslists)
    # @option opts [Symbol] :separation ':space' The type of separation, either
    #   :space (for lists like this: 'word word word') or :capitalize (
    #   WordWordWord).
    def initialize(opts={})
      default_options = { wordlist: 'words', separation: :space }
      @options = default_options.merge(opts)

      unless [:space, :capitalize].include?(@options[:separation])
        raise ArgumentError, 'option :separation must be :space or :capitalize'
      end

      @wordlist = Wordlist.new(@options[:wordlist])
    end

    # Generate a passphrase, that is, a sequence of words.
    # Please note that the method generates a new passphrase each time it
    # is called.
    #
    # Whether to use space-separated or capitalized passphrases is determined
    # by options passed.
    #
    # @param num_words [Integer] Number of words in passphrase
    # @return [String] The passphrase
    def passphrase(num_words=7)
      unless num_words.is_a?(Numeric) && num_words.to_i > 0
        raise ArgumentError, 'num_words must be integer > 0'
      end

      words = Array.new(num_words).map{ @wordlist.draw_word }

      if @options[:separation] == :space
        words.join(' ')
      else
        words.map{|w| Unicode::capitalize(w)}.join
      end
    end

  end
end
