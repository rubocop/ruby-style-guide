require 'spec_helper'

describe HtmlGenerator do
  subject { HtmlGenerator }

  it { should respond_to(:process) }

  it "should require markdown" do
    -> { subject.process }.should raise_error ArgumentError
  end

  it "should allow setting of the stylesheets via the options" do
    options = {:stylesheets => ['/path/to/file.css']}
    subject.stubs(:generate_html).returns(true)
    subject.expects(:parse_options).with(options)

    subject.process("test", options)
  end

  it "should set @stylesheets" do
    options = {:stylesheets => ['/path/to/file.css']}
    subject.stubs(:generate_html).returns(true)

    subject.process("test", options)
    subject.instance_variable_get("@stylesheets").should == options[:stylesheets]
  end

  it "should set @options[:redcarpet_options]" do
    subject.stubs(:generate_html).returns(true)

    subject.process("test")
    subject.instance_variable_get("@options")[:redcarpet_options].should == subject.singleton_class.const_get(:REDCARPET_OPTIONS)
  end

  it "should render simple markdown" do
    markdown = '# heading1 tag'
    subject.process(markdown).should match(%r(<h1>heading1 tag</h1>))
  end

  it "should render markdown with stylsheets" do
    markdown = '# heading1 tag'

    subject.stubs(:get_stylesheets).returns('h1 { color: #000; }')
    subject.process(markdown, :stylesheets => ["/path/to/file"]).should
      match(%r(<html>.*<head>.*<style [^>]*>h1 { color: #000; }.*</style>.*</head>.*<body>)m)
  end

  it "should reads the stylesheets from the specified files" do
    markdown = '# heading1 tag'

    File.expects(:read).with('/path/to/file').once
    subject.process(markdown, :stylesheets => ["/path/to/file"]).should
      match(%r(<html>.*<head>.*<style [^>]*>h1 { color: #000; }.*</style>.*</head>.*<body>)m)
  end
end