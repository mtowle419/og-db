
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "og-db/version"

Gem::Specification.new do |spec|
  spec.name          = "og-db"
  spec.version       = OGDB::VERSION
  spec.authors       = ["TL Michael"]
  spec.email         = ["mtowle419@gmail.com"]

  spec.summary       = "Rain rain go away/That's what all my haters say"
  spec.description   = "Tools for OG data"
  spec.homepage      = "https://github.com/mtowle419/og-db"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.glob "{bin,lib}/**/*"
  spec.executables   << "console" << "setup" << "og"
end
