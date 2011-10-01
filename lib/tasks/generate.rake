# Taken from hub
# https://github.com/defunkt/hub/blob/master/lib/hub/context.rb#L186
# Cross-platform way of finding an executable in the $PATH.
#
# which('ruby') #=> /usr/bin/ruby
def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each { |ext|
      exe = "#{path}/#{cmd}#{ext}"
      return exe if File.executable? exe
    }
  end
  return nil
end

require 'ruby_style_guide'

namespace :generate do
  task :sanity_check do
    unless which("pygmentize")
      abort "Please install pygments, sudo easy_install pygments"
    end

    unless which("wkhtmltopdf")
      abort "Please install wkhtmltopdf, if you are using linux-i386 or mac, you can install the gem wkhtmltopdf-binary"
    end
  end

  desc "Generate README.pdf"
  task :pdf => :sanity_check do
    html = RubyStyleGuide::MarkdownGenerator.process(File.read("README.md"))
    pdf = RubyStyleGuide::PdfGenerator.process(html, :stylesheets => %w(stylesheets/default.css))

    File.open('README.pdf', 'w') { |f| f.write(pdf) }
  end

  desc "Generate README.html"
  task :html => :sanity_check do
    html = RubyStyleGuide::MarkdownGenerator.process(File.read("README.md"), :stylesheets => %w(stylesheets/default.css))

    File.open('README.html', 'w') { |f| f.write(html) }
  end
end