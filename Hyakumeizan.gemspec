require_relative 'lib/Hyakumeizan/version'

Gem::Specification.new do |spec|
  spec.name          = "Hyakumeizan"
  spec.version       = Hyakumeizan::VERSION
  spec.authors       = ["willian-s123"]
  spec.email         = [""]

  spec.summary       = ['百名山の情報を簡単に取得できるようになるgem']
  spec.description   = ['百名山の情報を簡単に取得できるようになるgem']
  spec.homepage      = "https://github.com/willian-s123/Hyakumeizan"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/willian-s123/Hyakumeizan"
  spec.metadata["changelog_uri"] = "https://github.com/willian-s123/Hyakumeizan"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
