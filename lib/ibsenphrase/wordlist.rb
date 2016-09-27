module Ibsenphrase
  class Wordlist
    # A new wordlist object. It loads the file from disk on instantiation.
    # @param filename [String] The filename without path. The file is looked
    #   for in data/wordlists.
    def initialize(filename)
      @words = []
      load_words(filename)
    end

    # Picks a random word from the wordlist
    #
    # @return [String] A word
    def draw_word
      @words.sample(random: Ibsenphrase::Random.prng)
    end

    # @return [Array<String>] All the words in the wordlist
    def words
      @words
    end

    # @return [Integer] Number of words in wordlist
    def num_words
      @words.size
    end

    private

    def load_words(filename)
      path = File.join(Ibsenphrase.root, 'data', 'wordlists', filename)

      File.foreach path do |l|
        @words << l.strip
      end
    end
  end
end
