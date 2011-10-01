require 'redcarpet'
require 'albino'
require 'nokogiri'

module RubyStyleGuide
  class HtmlGenerator
    class << self
      REDCARPET_OPTIONS = [:autolink, :no_intraemphasis, :fenced_code, :gh_blockcode]

      def process(markdown, options = {})
        parse_options(options)
        generate_html(markdown)
      end

      def generate_html(markdown)
        add_stylesheets syntax_highlighter(process_markdown(markdown))
      end

      def parse_options(options = {})
        options = options.dup
        @stylesheets = options.delete(:stylesheets)
        @options = options.merge!(:redcarpet_options => REDCARPET_OPTIONS)
      end

      def process_markdown(markdown)
        Redcarpet.new(markdown, *@options[:redcarpet_options]).to_html
      end

      def syntax_highlighter(html)
        doc = Nokogiri::HTML(html)
        doc.search("//pre[@lang]").each do |pre|
          pre.replace Albino.colorize(pre.text.rstrip, pre[:lang].downcase.to_sym)
        end
        doc.to_s
      end

      def get_stylesheets
        @stylesheets.collect do |f|
          File.read(f)
        end.join("\n")
      end

      def add_stylesheets(html)
        if @stylesheets && @stylesheets.any?
          css = get_stylesheets

          doc = Nokogiri::HTML(html)
          body = doc.xpath('/html/body').first
          head = Nokogiri::XML::Node.new "head", doc
          style = Nokogiri::XML::Node.new "style", doc
          style['type'] = "text/css"
          style.content = css
          style.parent = head

          body.add_previous_sibling head
          html = doc.to_s
        end

        html
      end
    end
  end
end