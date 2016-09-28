module Ibsenphrase
  # This encapsulates the pseudo-random number generator (PRNG), essentially
  # turning it into a singleton class. This is done to avoid instantiating a
  # new PRNG every time we need it, as that would make us dependent on the
  # randomness of the operating system's seed, instead of the random number
  # generator code in Ruby.
  class Random
    def self.prng
      @@rng ||= ::Random.new
    end
  end
end
