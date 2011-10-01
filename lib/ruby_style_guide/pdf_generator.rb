require 'pdfkit'

module RubyStyleGuide
  class PdfGenerator
    class << self

      def process(html, options = {})
        parse_options(options)
        generate_pdf(html)
      end

      def parse_options(options = {})
        options = options.dup
        @stylesheets = options.delete(:stylesheets)
        @options = options.merge!(:page_size => 'Letter')
      end

      def generate_pdf(html)
        kit = PDFKit.new(html, :page_size => @options[:page_size])
        if @stylesheets
          @stylesheets.each do |f|
            kit.stylesheets << f
          end
        end

        kit.to_pdf
      end
    end
  end
end