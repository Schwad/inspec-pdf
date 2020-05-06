module InspecPlugins::Pdf
  class Reporter < Inspec.plugin(2, :reporter)
    def render
      require 'prawn'
      data = run_data # `run_data` does not pass into the Prawn block on its own

      Prawn::Document.generate("inspec-report-#{Time.now.strftime("%H%M%S%L")}.pdf") do
        text "<b>Version:</b> #{data[:version]}", inline_format: true
        text "<b>Platform:</b> #{data[:platform][:name]} | #{data[:platform][:release]}", inline_format: true
        text "<b>Duration:</b> #{data[:statistics][:duration]}", inline_format: true
        move_down 20
        text "<u><b>Profiles</b></u>", inline_format: true, size: 18
        move_down 10
        data[:profiles].each do |p|
          text "Name: #{p[:name]}", inline_format: true, size: 14
          move_down 10
          text "Controls:", inline_format: true
          move_down 5
          p[:controls].each do |c|
            text "<b>Name:</b> #{c[:title]}", inline_format: true
            text "<b>Desc:</b> #{c[:desc]}", inline_format: true
            text "Results:", inline_format: true
            c[:results].each do |r|
              text "<b>*</b> #{r[:code_desc]} | <u>#{r[:status]}</u>", inline_format: true
            end
            move_down 5
          end
        end
      end
    end
  end
end
