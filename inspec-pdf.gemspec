Gem::Specification.new do |spec|
  spec.name          = "inspec-pdf"
  spec.version       = "0.1.5"
  spec.authors       = ["Nick Schwaderer"]
  spec.email         = ["nicholas.schwaderer@gmail.com"]
  spec.summary       = "Inspec plugin for PDF generation"
  spec.description   = "InSpec plugin for PDF generation."
  spec.homepage      = "https://github.com/schwad/inspec-pdf"
  spec.license       = "MIT"
  spec.require_paths = ["lib"]

  spec.files =
    Dir.glob("{{lib}/**/*,inspec-pdf.gemspec}").reject { |f| File.directory?(f) }


    spec.add_dependency "prawn", "~> 0.2"
end
