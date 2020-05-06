module InspecPlugins
  module Pdf
    class Plugin < Inspec.plugin(2)

      plugin_name :'inspec-pdf'

      reporter :pdf do
        require_relative 'reporter.rb'
        InspecPlugins::Pdf::Reporter
      end
    end
  end
end
