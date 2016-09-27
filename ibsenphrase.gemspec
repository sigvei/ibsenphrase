# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ibsenphrase/version'

Gem::Specification.new do |spec|
  spec.name          = "ibsenphrase"
  spec.version       = Ibsenphrase::VERSION
  spec.authors       = ["Sigve Indregard"]
  spec.email         = ["sigve@indregard.no"]

  spec.summary       = "Generates diceware passphrases with words from Ibsen."
  spec.description   = "Passphrases with random words picked from a large wordlist are safer and easier to remember than random characters. This gem lets you create such passphrases with words from harvested from the writings of playwright Henrik Ibsen."
  spec.homepage      = "https://github.com/sigvei/ibsenphrase"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://rubygems.org"
    spec.metadata['yard_run'] = 'yri'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug", "~> 9.0"
  spec.add_development_dependency "yard", "~> 0.9"

  spec.add_dependency 'unicode', '~> 0.4'
end
