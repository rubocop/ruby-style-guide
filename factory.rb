#. Canonical factory: spec/factories/person_factory.rb
#. NOTE: "#." signifies a meta-comment.
#.
#. If your factory is complicated and requires a lot of work to make it valid, your
#. model stinks... refactor it!
FactoryGirl.define do

  factory :person do
    name 'Mitch'
    age 28
    aunt #. Use default factory for associations where possible.

    after(:create) do |person, _|
      #. Do something...
    end

    factory :admin_person do
      admin true
    end
  end

end