require 'spec_helper'

describe PdfGenerator do
  subject { PdfGenerator }

  it { should respond_to(:process) }

  it "should require html" do
    lambda do
      subject.process
    end.should raise_error ArgumentError
  end

  it "should allow setting of the stylesheets via the options" do
    options = {:stylesheets => ['/path/to/file.css']}
    subject.stubs(:generate_pdf).returns(true)
    subject.expects(:parse_options).with(options)

    subject.process("test", options)
  end

  it "should set @stylesheets" do
    options = {:stylesheets => ['/path/to/file.css']}
    subject.stubs(:generate_pdf).returns(true)

    subject.process("test", options)
    subject.instance_variable_get("@stylesheets").should == options[:stylesheets]
  end

  it "should create an object with pdfkit, page_size default to letter" do
    html = '<h1>heading1 tag</h1>'
    pdf = stub(:to_pdf => true)
    PDFKit.expects(:new).with(html, :page_size => 'Letter').once.returns(pdf)

    subject.process(html)
  end
end