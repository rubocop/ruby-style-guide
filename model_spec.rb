#. Canonical model spec: spec/models/person_spec.rb
#. "#." signifies a meta-comment.
#.
#. If your spec requires a lot of setup, or if it's hard to write, your model stinks... refactor it!
require 'spec_helper'

describe Person do

  #. Always specify that a model has a valid factory.
  it 'has a valid factory' do
    #. Use "build" and "create" instead of "FactoryGirl.build(/create)"
    build(:person).should be_valid
  end

  #. Use a describe block for each method.
  #. "." signifies class methods.
  describe '.kill_oldies' do
    #. ...
  end

  #. "#" signifies instance methods;
  describe '#predicted_lifespan' do

    #. Use before instead of before(:each)
    before do
      @person = create(:person)
    end

    #. Use contexts to group sets of pre-conditions.
    #. A context message should summarize those pre-conditions, and should
    #. read like a condition (when ..., with ..., etc).
    context 'when less than 27 years old' do

      before do
        @person.stub(:age => 26)
      end

      #. "it" statements should read like a sentence, *including* the "it".
      #. Don't start the statement with "should", instead always start it with a
      #. verb.
      it 'is 5' do
        @person.predicted_lifespan.should == 5
      end
    end

    context 'when really old' do
      #. ...
    end
  end

  describe '#awesome?' do

    #. Prefer "let" and "subject" over before blocks when appropriate.

    let(:user) { create(:user, :age => age) }

    subject { user.awesome? }

    context 'when 28 years old' do
      let(:age) { 28 }
      it { should be_true }
    end

    context 'when over 30 years old' do
      let(:age) { 31 }
      it { should be_false }
    end

  end

end