# Prelude

> Style is what separates the good from the great. <br/>
> -- Bozhidar Batsov

The goal of this guide is to present a set of best practices and style
prescriptions for Ruby on Rails 3 development. It's a complementary
guide to the already existing community-driven
[Ruby coding style guide](https://github.com/bbatsov/ruby-style-guide).

While in the guide the section [Testing Rails applications](#testing-rails-applications)
is after [Developing Rails applications](#developing-rails-applications) I truly believe
that
[Behaviour-Driven Development](http://en.wikipedia.org/wiki/Behavior_Driven_Development)
(BDD) is the best way to develop software. Keep that in mind.

Rails is an opinionated framework and this is an opinionated guide. In
my mind I'm totally certain that
[RSpec](https://www.relishapp.com/rspec) is superior to Test::Unit,
[Sass](http://sass-lang.com/) is superior to CSS and
[Haml](http://haml-lang.com/) ([Slim](http://slim-lang.com/)) is
superior to Erb. So don't expect to find any Test::Unit, CSS or Erb
advice in here.

Some of the advice here is applicable only to Rails 3.1+.

You can generate a PDF or an HTML copy of this guide using
[Transmuter](https://github.com/TechnoGate/transmuter).

Translations of the guide are available in the following languages:

* [Chinese Simplified](https://github.com/JuanitoFatas/rails-style-guide/blob/master/README-zhCN.md)
* [Chinese Traditional](https://github.com/JuanitoFatas/rails-style-guide/blob/master/README-zhTW.md)

# Table of Contents

* [Developing Rails applications](#developing-rails-applications)
    * [Configuration](#configuration)
    * [Routing](#routing)
    * [Controllers](#controllers)
    * [Models](#models)
    * [Migrations](#migrations)
    * [Views](#views)
    * [Internationalization](#internationalization)
    * [Assets](#assets)
    * [Mailers](#mailers)
    * [Bundler](#bundler)
    * [Priceless Gems](#priceless-gems)
    * [Flawed Gems](#flawed-gems)
    * [Managing processes](#managing-processes)
* [Testing Rails applications](#testing-rails-applications)
    * [Cucumber](#cucumber)
    * [RSpec](#rspec)

# Developing Rails applications

## Configuration

* Put custom initialization code in `config/initializers`. The code in
  initializers executes on application startup.
* Keep initialization code for each gem in a separate file
  with the same name as the gem, for example `carrierwave.rb`,
  `active_admin.rb`, etc.
* Adjust accordingly the settings for development, test and production
  environment (in the corresponding files under `config/environments/`)
  * Mark additional assets for precompilation (if any):

        ```Ruby
        # config/environments/production.rb
        # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
        config.assets.precompile += %w( rails_admin/rails_admin.css rails_admin/rails_admin.js )
        ```

* Keep configuration that's applicable to all environments in the `config/application.rb` file.
* Create an additional `staging` environment that closely resembles
the `production` one.

## Routing

* When you need to add more actions to a RESTful resource (do you
  really need them at all?) use `member` and `collection` routes.

    ```Ruby
    # bad
    get 'subscriptions/:id/unsubscribe'
    resources :subscriptions

    # good
    resources :subscriptions do
      get 'unsubscribe', on: :member
    end

    # bad
    get 'photos/search'
    resources :photos

    # good
    resources :photos do
      get 'search', on: :collection
    end
    ```

* If you need to define multiple `member/collection` routes use the
  alternative block syntax.

    ```Ruby
    resources :subscriptions do
      member do
        get 'unsubscribe'
        # more routes
      end
    end

    resources :photos do
      collection do
        get 'search'
        # more routes
      end
    end
    ```

* Use nested routes to express better the relationship between
  ActiveRecord models.

    ```Ruby
    class Post < ActiveRecord::Base
      has_many :comments
    end

    class Comments < ActiveRecord::Base
      belongs_to :post
    end

    # routes.rb
    resources :posts do
      resources :comments
    end
    ```

* Use namespaced routes to group related actions.

    ```Ruby
    namespace :admin do
      # Directs /admin/products/* to Admin::ProductsController
      # (app/controllers/admin/products_controller.rb)
      resources :products
    end
    ```

* Never use the legacy wild controller route. This route will make all
  actions in every controller accessible via GET requests.

    ```Ruby
    # very bad
    match ':controller(/:action(/:id(.:format)))'
    ```

## Controllers

* Keep the controllers skinny - they should only retrieve data for the
  view layer and shouldn't contain any business logic (all the
  business logic should naturally reside in the model).
* Each controller action should (ideally) invoke only one method other
  than an initial find or new.
* Share no more than two instance variables between a controller and a view.

## Models

* Introduce non-ActiveRecord model classes freely.
* Name the models with meaningful (but short) names without
abbreviations.
* If you need model objects that support ActiveRecord behavior(like
  validation) use the
  [ActiveAttr](https://github.com/cgriego/active_attr) gem.

    ```Ruby
    class Message
      include ActiveAttr::Model

      attribute :name
      attribute :email
      attribute :content
      attribute :priority

      attr_accessible :name, :email, :content

      validates_presence_of :name
      validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
      validates_length_of :content, :maximum => 500
    end
    ```

    For a more complete example refer to the
    [RailsCast on the subject](http://railscasts.com/episodes/326-activeattr).

### ActiveRecord

* Avoid altering ActiveRecord defaults (table names, primary key, etc)
  unless you have a very good reason (like a database that's not under
  your control).

    ```Ruby
    # bad - don't do this if you can modify the schema
    class Transaction < ActiveRecord::Base
      self.table_name = 'order'
      ...
    end
    ```

* Group macro-style methods (`has_many`, `validates`, etc) in the
  beginning of the class definition.

    ```Ruby
    class User < ActiveRecord::Base
      # keep the default scope first (if any)
      default_scope { where(active: true) }

      # constants come up next
      GENDERS = ['male', 'female']

      # afterwards we put attr related macros
      attr_accessor :formatted_date_of_birth

      attr_accessible :login, :first_name, :last_name, :email, :password

      # followed by association macros
      belongs_to :country

      has_many :authentications, dependent: :destroy

      # and validation macros
      validates :email, presence: true
      validates :username, presence: true
      validates :username, uniqueness: { case_sensitive: false }
      validates :username, format: { with: /^[A-Za-z][A-Za-z0-9._-]{2,19}$/ }
      validates :password, format: { with: /^\S{8,128}$/, allow_nil: true}

      # next we have callbacks
      before_save :cook
      before_save :update_username_lower

      # other macros (like devise's) should be placed after the callbacks

      ...
    end
    ```

* Prefer `has_many :through` to `has_and_belongs_to_many`. Using `has_many
:through` allows additional attributes and validations on the join model.

    ```Ruby
    # using has_and_belongs_to_many
    class User < ActiveRecord::Base
      has_and_belongs_to_many :groups
    end

    class Group < ActiveRecord::Base
      has_and_belongs_to_many :users
    end

    # prefered way - using has_many :through
    class User < ActiveRecord::Base
      has_many :memberships
      has_many :groups, through: :memberships
    end

    class Membership < ActiveRecord::Base
      belongs_to :user
      belongs_to :group
    end

    class Group < ActiveRecord::Base
      has_many :memberships
      has_many :users, through: :memberships
    end
    ```

* Prefer `self[:attribute]` over `read_attribute(:attribute)`.

    ```Ruby
    # bad
    def amount
      read_attribute(:amount) * 100
    end

    # good
    def amount
      self[:amount] * 100
    end
    ```

* Always use the new
  ["sexy" validations](http://thelucid.com/2010/01/08/sexy-validation-in-edge-rails-rails-3/).

    ```Ruby
    # bad
    validates_presence_of :email

    # good
    validates :email, presence: true
    ```

* When a custom validation is used more than once or the validation is
some regular expression mapping, create a custom validator file.

    ```Ruby
    # bad
    class Person
      validates :email, format: { with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
    end

    # good
    class EmailValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        record.errors[attribute] << (options[:message] || 'is not a valid email') unless value =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
      end
    end

    class Person
      validates :email, email: true
    end
    ```

* Keep custom validators under `lib/validators`.
* Consider extracting custom validators to a shared gem if you're
  maintaining several related apps or the validators are generic
  enough.
* Use named scopes freely.

    ```Ruby
    class User < ActiveRecord::Base
      scope :active, -> { where(active: true) }
      scope :inactive, -> { where(active: false) }

      scope :with_orders, -> { joins(:orders).select('distinct(users.id)') }
    end
    ```

* Wrap named scopes in `lambdas` to initialize them lazily.

    ```Ruby
    # bad
    class User < ActiveRecord::Base
      scope :active, where(active: true)
      scope :inactive, where(active: false)

      scope :with_orders, joins(:orders).select('distinct(users.id)')
    end

    # good
    class User < ActiveRecord::Base
      scope :active, -> { where(active: true) }
      scope :inactive, -> { where(active: false) }

      scope :with_orders, -> { joins(:orders).select('distinct(users.id)') }
    end
    ```

* When a named scope defined with a lambda and parameters becomes too
complicated, it is preferable to make a class method instead which serves
the same purpose of the named scope and returns an
`ActiveRecord::Relation` object. Arguably you can define even simpler
scopes like this.

    ```Ruby
    class User < ActiveRecord::Base
      def self.with_orders
        joins(:orders).select('distinct(users.id)')
      end
    end
    ```

* Beware of the behavior of the `update_attribute` method. It doesn't
  run the model validations (unlike `update_attributes`) and could easily corrupt the model state.
* Use user-friendly URLs. Show some descriptive attribute of the model in the URL rather than its `id`.
There is more than one way to achieve this:
  * Override the `to_param` method of the model. This method is used by Rails for constructing a URL to the object.
    The default implementation returns the `id` of the record as a String. It could be overridden to include another
    human-readable attribute.

        ```Ruby
        class Person
          def to_param
            "#{id} #{name}".parameterize
          end
        end
        ```

    In order to convert this to a URL-friendly value, `parameterize` should be called on the string. The `id` of the
    object needs to be at the beginning so that it can be found by the `find` method of ActiveRecord.

  * Use the `friendly_id` gem. It allows creation of human-readable URLs by using some descriptive attribute of the model instead of its `id`.

        ```Ruby
        class Person
          extend FriendlyId
          friendly_id :name, use: :slugged
        end
        ```

        Check the [gem documentation](https://github.com/norman/friendly_id) for more information about its usage.

### ActiveResource

* When the response is in a format different from the existing ones (XML and
JSON) or some additional parsing of these formats is necessary,
create your own custom format and use it in the class. The custom format
should implement the following four methods: `extension`, `mime_type`,
`encode` and `decode`.

    ```Ruby
    module ActiveResource
      module Formats
        module Extend
          module CSVFormat
            extend self

            def extension
              'csv'
            end

            def mime_type
              'text/csv'
            end

            def encode(hash, options = nil)
              # Encode the data in the new format and return it
            end

            def decode(csv)
              # Decode the data from the new format and return it
            end
          end
        end
      end
    end

    class User < ActiveResource::Base
      self.format = ActiveResource::Formats::Extend::CSVFormat

      ...
    end
    ```

* If the request should be sent without extension, override the `element_path`
and `collection_path` methods of `ActiveResource::Base` and remove the
extension part.

    ```Ruby
    class User < ActiveResource::Base
      ...

      def self.collection_path(prefix_options = {}, query_options = nil)
        prefix_options, query_options = split_options(prefix_options) if query_options.nil?
        "#{prefix(prefix_options)}#{collection_name}#{query_string(query_options)}"
      end

      def self.element_path(id, prefix_options = {}, query_options = nil)
        prefix_options, query_options = split_options(prefix_options) if query_options.nil?
        "#{prefix(prefix_options)}#{collection_name}/#{URI.parser.escape id.to_s}#{query_string(query_options)}"
      end
    end
    ```

    These methods can be overridden also if any other modifications of the
    URL are needed.

## Migrations

* Keep the `schema.rb` (or `structure.sql`) under version control.
* Use `rake db:schema:load` instead of `rake db:migrate` to initialize
an empty database.
* Use `rake db:test:prepare` to update the schema of the test database.
* Enforce default values in the migrations themselves instead of in
  the application layer.

    ```Ruby
    # bad - application enforced default value
    def amount
      self[:amount] or 0
    end
    ```

    While enforcing table defaults only in Rails is suggested by many
    Rails developers it's an extremely brittle approach that
    leaves your data vulnerable to many application bugs.  And you'll
    have to consider the fact that most non-trivial apps share a
    database with other applications, so imposing data integrity from
    the Rails app is impossible.

* Enforce foreign-key constraints. While ActiveRecord does not support
them natively, there some great third-party gems like
[schema_plus](https://github.com/lomba/schema_plus).

* When writing constructive migrations (adding tables or columns), use
  the new Rails 3.1 way of doing the migrations - use the `change`
  method instead of `up` and `down` methods.


    ```Ruby
    # the old way
    class AddNameToPerson < ActiveRecord::Migration
      def up
        add_column :persons, :name, :string
      end

      def down
        remove_column :person, :name
      end
    end

    # the new prefered way
    class AddNameToPerson < ActiveRecord::Migration
      def change
        add_column :persons, :name, :string
      end
    end
    ```

* Don't use model classes in migrations. The model classes are
constantly evolving and at some point in the future migrations that
used to work might stop, because of changes in the models used.

## Views

* Never call the model layer directly from a view.
* Never make complex formatting in the views, export the formatting to
  a method in the view helper or the model.
* Mitigate code duplication by using partial templates and layouts.
* Add
  [client side validation](https://github.com/bcardarella/client_side_validations)
  for the custom validators. The steps to do this are:
  * Declare a custom validator which extends `ClientSideValidations::Middleware::Base`

        ```Ruby
        module ClientSideValidations::Middleware
          class Email < Base
            def response
              if request.params[:email] =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
                self.status = 200
              else
                self.status = 404
              end
              super
            end
          end
        end
        ```

  * Create a new file
    `public/javascripts/rails.validations.custom.js.coffee` and add a
    reference to it in your `application.js.coffee` file:

        ```
        # app/assets/javascripts/application.js.coffee
        #= require rails.validations.custom
        ```

  * Add your client-side validator:

        ```Ruby
        #public/javascripts/rails.validations.custom.js.coffee
        clientSideValidations.validators.remote['email'] = (element, options) ->
          if $.ajax({
            url: '/validators/email.json',
            data: { email: element.val() },
            async: false
          }).status == 404
            return options.message || 'invalid e-mail format'
        ```

## Internationalization

* No strings or other locale specific settings should be used in the views,
models and controllers. These texts should be moved to the locale files in
the `config/locales` directory.
* When the labels of an ActiveRecord model need to be translated,
use the `activerecord` scope:

    ```
    en:
      activerecord:
        models:
          user: Member
        attributes:
          user:
            name: "Full name"
    ```

    Then `User.model_name.human` will return "Member" and
    `User.human_attribute_name("name")` will return "Full name". These
    translations of the attributes will be used as labels in the views.

* Separate the texts used in the views from translations of ActiveRecord
attributes. Place the locale files for the models in a folder `models` and
the texts used in the views in folder `views`.
  * When organization of the locale files is done with additional
  directories, these directories must be described in the `application.rb`
  file in order to be loaded.

        ```Ruby
        # config/application.rb
        config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
        ```

* Place the shared localization options, such as date or currency formats, in
files
under
the root of the `locales` directory.
* Use the short form of the I18n methods: `I18n.t` instead of `I18n.translate`
and `I18n.l` instead of `I18n.localize`.
* Use "lazy" lookup for the texts used in views. Let's say we have the
following structure:

    ```
    en:
      users:
        show:
          title: "User details page"
    ```

    The value for `users.show.title` can be looked up in the template
    `app/views/users/show.html.haml` like this:

    ```Ruby
    = t '.title'
    ```

* Use the dot-separated keys in the controllers and models instead of
specifying the `:scope` option. The dot-separated call is easier to read and
trace the hierarchy.

    ```Ruby
    # use this call
    I18n.t 'activerecord.errors.messages.record_invalid'

    # instead of this
    I18n.t :record_invalid, :scope => [:activerecord, :errors, :messages]
    ```

* More detailed information about the Rails i18n can be found in the [Rails
Guides]
(http://guides.rubyonrails.org/i18n.html)

## Assets

Use the [assets pipeline](http://guides.rubyonrails.org/asset_pipeline.html) to leverage organization within
your application.

* Reserve `app/assets` for custom stylesheets, javascripts, or images.
* Use `lib/assets` for your own libraries, that doesn’t really fit into the scope of the application.
* Third party code such as [jQuery](http://jquery.com/) or [bootstrap](http://twitter.github.com/bootstrap/)
  should be placed in `vendor/assets`.
* When possible, use gemified versions of assets (e.g. [jquery-rails](https://github.com/rails/jquery-rails)).

## Mailers

* Name the mailers `SomethingMailer`. Without the Mailer suffix it
  isn't immediately apparent what's a mailer and which views are
  related to the mailer.
* Provide both HTML and plain-text view templates.
* Enable errors raised on failed mail delivery in your development environment. The errors are disabled by default.

    ```Ruby
    # config/environments/development.rb

    config.action_mailer.raise_delivery_errors = true
    ```

* Use `smtp.gmail.com` for SMTP server in the development environment
  (unless you have local SMTP server, of course).

    ```Ruby
    # config/environments/development.rb

    config.action_mailer.smtp_settings = {
      address: 'smtp.gmail.com',
      # more settings
    }
    ```

* Provide default settings for the host name.

    ```Ruby
    # config/environments/development.rb
    config.action_mailer.default_url_options = {host: "#{local_ip}:3000"}


    # config/environments/production.rb
    config.action_mailer.default_url_options = {host: 'your_site.com'}

    # in your mailer class
    default_url_options[:host] = 'your_site.com'
    ```

* If you need to use a link to your site in an email, always use the
  `_url`, not `_path` methods. The `_url` methods include the host
  name and the `_path` methods don't.

    ```Ruby
    # wrong
    You can always find more info about this course
    = link_to 'here', url_for(course_path(@course))

    # right
    You can always find more info about this course
    = link_to 'here', url_for(course_url(@course))
    ```

* Format the from and to addresses properly. Use the following format:

    ```Ruby
    # in your mailer class
    default from: 'Your Name <info@your_site.com>'
    ```

* Make sure that the e-mail delivery method for your test environment is set to `test`:

    ```Ruby
    # config/environments/test.rb

    config.action_mailer.delivery_method = :test
    ```

* The delivery method for development and production should be `smtp`:

    ```Ruby
    # config/environments/development.rb, config/environments/production.rb

    config.action_mailer.delivery_method = :smtp
    ```

* When sending html emails all styles should be inline, as some mail clients
  have problems with external styles. This however makes them harder to
  maintain and leads to code duplication. There are two similar gems that
  transform the styles and put them in the corresponding html tags:
  [premailer-rails3](https://github.com/fphilipe/premailer-rails3) and
  [roadie](https://github.com/Mange/roadie).

* Sending emails while generating page response should be avoided. It causes
  delays in loading of the page and request can timeout if multiple email are
  send. To overcome this emails can be send in background process with the help
  of [delayed_job](https://github.com/tobi/delayed_job) gem.

## Bundler

* Put gems used only for development or testing in the appropriate group in the Gemfile.
* Use only established gems in your projects. If you're contemplating
on including some little-known gem you should do a careful review of
its source code first.
* OS-specific gems will by default result in a constantly changing `Gemfile.lock`
for projects with multiple developers using different operating systems.
Add all OS X specific gems to a `darwin` group in the Gemfile, and all Linux
specific gems to a `linux` group:

    ```Ruby
    # Gemfile
    group :darwin do
      gem 'rb-fsevent'
      gem 'growl'
    end

    group :linux do
      gem 'rb-inotify'
    end
    ```

    To require the appropriate gems in the right environment, add the
    following to `config/application.rb`:

    ```Ruby
    platform = RUBY_PLATFORM.match(/(linux|darwin)/)[0].to_sym
    Bundler.require(platform)
    ```

* Do not remove the `Gemfile.lock` from version control. This is not
  some randomly generated file - it makes sure that all of your team
  members get the same gem versions when they do a `bundle install`.

## Priceless Gems

One of the most important programming principles is "Don't reinvent
the wheel!". If you're faced with a certain task you should always
look around a bit for existing solutions, before rolling your
own. Here's a list of some "priceless" gems (all of them Rails 3.1
compliant) that are useful in many Rails projects:

* [active_admin](https://github.com/gregbell/active_admin) - With ActiveAdmin
  the creation of admin interface for your Rails app is child's play. You get a
  nice dashboard, CRUD UI and lots more. Very flexible and customizable.
* [better_errors](https://github.com/charliesome/better_errors) - Better Errors replaces
  the standard Rails error page with a much better and more useful error page. It is also
  usable outside of Rails in any Rack app as Rack middleware.
* [bullet](https://github.com/flyerhzm/bullet) - The Bullet gem is designed to
  help you increase your application’s performance by reducing the number of
  queries it makes. It will watch your queries while you develop your
  application and notify you when you should add eager loading (N+1 queries),
  when you’re using eager loading that isn’t necessary and when you should use
  counter cache.
* [cancan](https://github.com/ryanb/cancan) - CanCan is an authorization gem that
  lets you restrict users access to resources. All permissions are defined in a
  single file (ability.rb) and convenient methods for checking and ensuring
  permissions are available throughout the application.
* [capybara](https://github.com/jnicklas/capybara) - Capybara aims to simplify
  the process of integration testing Rack applications, such as Rails, Sinatra
  or Merb. Capybara simulates how a real user would interact with a web
  application. It is agnostic about the driver running your tests and currently
  comes with Rack::Test and Selenium support built in. HtmlUnit, WebKit and
  env.js are supported through external gems. Works great in combination with
  RSpec & Cucumber.
* [carrierwave](https://github.com/jnicklas/carrierwave) - the ultimate file
  upload solution for Rails. Support both local and cloud storage for the
  uploaded files (and many other cool things). Integrates great with
  ImageMagick for image post-processing.
* [client_side_validations](https://github.com/bcardarella/client_side_validations) -
  Fantastic gem that automatically creates JavaScript client-side validations
  from your existing server-side model validations. Highly recommended!
* [compass-rails](https://github.com/chriseppstein/compass) - Great gem that
  adds support for some css frameworks. Includes collection of sass mixins that
  reduces code of css files and help fight with browser incompatibilities.
* [cucumber-rails](https://github.com/cucumber/cucumber-rails) - Cucumber is
  the premium tool to develop feature tests in Ruby. cucumber-rails provides
  Rails integration for Cucumber.
* [devise](https://github.com/plataformatec/devise) - Devise is full-featured
  authentication solution for Rails applications. In most cases it's preferable
  to use devise to unrolling your custom authentication solution.
* [fabrication](http://fabricationgem.org/) - a great fixture replacement
  (editor's choice).
* [factory_girl](https://github.com/thoughtbot/factory_girl) - an alternative
  to fabrication. Nice and mature fixture replacement. Spiritual ancestor of
  fabrication.
* [ffaker](https://github.com/EmmanuelOga/ffaker) - handy gem to generate dummy data
  (names, addresses, etc).
* [feedzirra](https://github.com/pauldix/feedzirra) - Very fast and flexible
  RSS/Atom feed parser.
* [friendly_id](https://github.com/norman/friendly_id) - Allows creation of
  human-readable URLs by using some descriptive attribute of the model instead
  of its id.
* [globalize3](https://github.com/svenfuchs/globalize3.git) - Globalize3 is
  the successor of Globalize for Rails and is targeted at ActiveRecord
  version 3.x. It is compatible with and builds on the new I18n API in Ruby
  on Rails and adds model translations to ActiveRecord.
* [guard](https://github.com/guard/guard) - fantastic gem that monitors file
  changes and invokes tasks based on them. Loaded with lots of useful
  extension. Far superior to autotest and watchr.
* [haml-rails](https://github.com/indirect/haml-rails) - haml-rails provides
  Rails integration for Haml.
* [haml](http://haml-lang.com) - HAML is a concise templating language,
  considered by many (including yours truly) to be far superior to Erb.
* [kaminari](https://github.com/amatsuda/kaminari) - Great paginating solution.
* [machinist](https://github.com/notahat/machinist) - Fixtures aren't fun.
  Machinist is.
* [rspec-rails](https://github.com/rspec/rspec-rails) - RSpec is a replacement
  for Test::MiniTest. I cannot recommend highly enough RSpec. rspec-rails
  provides Rails integration for RSpec.
* [simple_form](https://github.com/plataformatec/simple_form) - once you've
  used simple_form (or formtastic) you'll never want to hear about Rails's
  default forms. It has a great DSL for building forms and no opinion on
  markup.
* [simplecov-rcov](https://github.com/fguillen/simplecov-rcov) - RCov formatter
  for SimpleCov. Useful if you're trying to use SimpleCov with the Hudson
  contininous integration server.
* [simplecov](https://github.com/colszowka/simplecov) - code coverage tool.
  Unlike RCov it's fully compatible with Ruby 1.9. Generates great reports.
  Must have!
* [slim](http://slim-lang.com) - Slim is a concise templating language,
  considered by many far superior to HAML (not to mention Erb). The only thing
  stopping me from using Slim massively is the lack of good support in major
  editors/IDEs. Its performance is phenomenal.
* [spork](https://github.com/sporkrb/spork) - A DRb server for testing
  frameworks (RSpec / Cucumber currently) that forks before each run to ensure
  a clean testing state. Simply put it preloads a lot of test environment and
  as consequence the startup time of your tests in greatly decreased. Absolute
  must have!
* [sunspot](https://github.com/sunspot/sunspot) - SOLR powered full-text search
  engine.

This list is not exhaustive and other gems might be added to it along
the road. All of the gems on the list are field tested, have active
development and community and are known to be of good code quality.

## Flawed Gems

This is a list of gems that are either problematic or superseded by
other gems. You should avoid using them in your projects.

* [rmagick](http://rmagick.rubyforge.org/) - this gem is notorious for its memory consumption. Use
[minimagick](https://github.com/probablycorey/mini_magick) instead.
* [autotest](http://www.zenspider.com/ZSS/Products/ZenTest/) - old solution for running tests automatically. Far
inferior to [guard](https://github.com/guard/guard) and [watchr](https://github.com/mynyml/watchr).
* [rcov](https://github.com/relevance/rcov) - code coverage tool, not
  compatible with Ruby 1.9. Use
  [SimpleCov](https://github.com/colszowka/simplecov) instead.
* [therubyracer](https://github.com/cowboyd/therubyracer) - the use of
  this gem in production is strongly discouraged as it uses a very large amount of
  memory. I'd suggest using `node.js` instead.

This list is also a work in progress. Please, let me know if you know
other popular, but flawed gems.

## Managing processes

* If your projects depends on various external processes use
  [foreman](https://github.com/ddollar/foreman) to manage them.

# Testing Rails applications

The best approach to implementing new features is probably the BDD
approach. You start out by writing some high level feature tests
(generally written using Cucumber), then you use these tests to drive
out the implementation of the feature. First you write view specs for
the feature and use those specs to create the relevant
views. Afterwards you create the specs for the controller(s) that will
be feeding data to the views and use those specs to implement the
controller. Finally you implement the models specs and the models
themselves.

## Cucumber

* Tag your pending scenarios with `@wip` (work in progress).  These
scenarios will not be taken into account and will not be marked as
failing.  When finishing the work on a pending scenario and
implementing the functionality it tests, the tag `@wip` should be
removed in order to include this scenario in the test suite.
* Setup your default profile to exclude the scenarios tagged with
`@javascript`.  They are testing using the browser and disabling them
is recommended to increase the regular scenarios execution speed.
* Setup a separate profile for the scenarios marked with `@javascript` tag.
  * The profiles can be configured in the `cucumber.yml` file.

        ```Ruby
        # definition of a profile:
        profile_name: --tags @tag_name
        ```

  * A profile is run with the command:

        ```
        cucumber -p profile_name
        ```

* If using [fabrication](http://fabricationgem.org/) for fixtures
  replacement, use the predefined
  [fabrication steps](http://fabricationgem.org/#!cucumber-steps)
* Do not use the old `web_steps.rb` step definitions!
[The web steps were removed from the latest version of Cucumber.](http://aslakhellesoy.com/post/11055981222/the-training-wheels-came-off) Their
usage leads to the creation of verbose scenarios that do not properly
reflect the application domain.
* When checking for the presence of an element with visible text
  (link, button, etc.) check for the text, not the element id. This
  can detect problems with the i18n.
* Create separate features for different functionality regarding the same kind of objects:

    ```Ruby
    # bad
    Feature: Articles
    # ... feature  implementation ...

    # good
    Feature: Article Editing
    # ... feature  implementation ...

    Feature: Article Publishing
    # ... feature  implementation ...

    Feature: Article Search
    # ... feature  implementation ...

    ```

* Each feature has three main components
  * Title
  * Narrative - a short explanation what the feature is about.
  * Acceptance criteria - the set of scenarios each made up of individual steps.
* The most common format is known as the Connextra format.

    ```Ruby
    In order to [benefit] ...
    A [stakeholder]...
    Wants to [feature] ...
    ```

This format is the most common but is not required, the narrative can
be free text depending on the complexity of the feature.

* Use Scenario Outlines freely to keep the scenarios DRY.

    ```Ruby
    Scenario Outline: User cannot register with invalid e-mail
      When I try to register with an email "<email>"
      Then I should see the error message "<error>"

    Examples:
      |email         |error                 |
      |              |The e-mail is required|
      |invalid email |is not a valid e-mail |
    ```

* The steps for the scenarios are in `.rb` files under the
`step_definitions` directory. The naming convention for the steps file
is `[description]_steps.rb`.  The steps can be separated into
different files based on different criterias. It is possible to have
one steps file for each feature (`home_page_steps.rb`).  There also
can be one steps file for all features for a particular object
(`articles_steps.rb`).
* Use multiline step arguments to avoid repetition

    ```Ruby
    Scenario: User profile
      Given I am logged in as a user "John Doe" with an e-mail "user@test.com"
      When I go to my profile
      Then I should see the following information:
        |First name|John         |
        |Last name |Doe          |
        |E-mail    |user@test.com|

    # the step:
    Then /^I should see the following information:$/ do |table|
      table.raw.each do |field, value|
        find_field(field).value.should =~ /#{value}/
      end
    end
    ```

* Use compound steps to keep the scenario DRY

    ```Ruby
    # ...
    When I subscribe for news from the category "Technical News"
    # ...

    # the step:
    When /^I subscribe for news from the category "([^"]*)"$/ do |category|
      steps %Q{
        When I go to the news categories page
        And I select the category #{category}
        And I click the button "Subscribe for this category"
        And I confirm the subscription
      }
    end
    ```
* Always use the Capybara negative matchers instead of should_not with positive,
they will retry the match for given timeout allowing you to test ajax actions.
[See Capybara's README for more explanation](https://github.com/jnicklas/capybara)

## RSpec

* Use just one expectation per example.

    ```Ruby
    # bad
    describe ArticlesController do
      #...

      describe 'GET new' do
        it 'assigns new article and renders the new article template' do
          get :new
          assigns[:article].should be_a_new Article
          response.should render_template :new
        end
      end

      # ...
    end

    # good
    describe ArticlesController do
      #...

      describe 'GET new' do
        it 'assigns a new article' do
          get :new
          assigns[:article].should be_a_new Article
        end

        it 'renders the new article template' do
          get :new
          response.should render_template :new
        end
      end

    end
    ```

* Make heavy use of `describe` and `context`
* Name the `describe` blocks as follows:
  * use "description" for non-methods
  * use pound "#method" for instance methods
  * use dot ".method" for class methods

    ```Ruby
    class Article
      def summary
        #...
      end

      def self.latest
        #...
      end
    end

    # the spec...
    describe Article do
      describe '#summary' do
        #...
      end

      describe '.latest' do
        #...
      end
    end
    ```

* Use [fabricators](http://fabricationgem.org/) to create test
  objects.
* Make heavy use of mocks and stubs

    ```Ruby
    # mocking a model
    article = mock_model(Article)

    # stubbing a method
    Article.stub(:find).with(article.id).and_return(article)
    ```

* When mocking a model, use the `as_null_object` method. It tells the
  output to listen only for messages we expect and ignore any other
  messages.

    ```Ruby
    article = mock_model(Article).as_null_object
    ```

* Use `let` blocks instead of `before(:each)` blocks to create data for
  the spec examples. `let` blocks get lazily evaluated.

    ```Ruby
    # use this:
    let(:article) { Fabricate(:article) }

    # ... instead of this:
    before(:each) { @article = Fabricate(:article) }
    ```

* Use `subject` when possible

    ```Ruby
    describe Article do
      subject { Fabricate(:article) }

      it 'is not published on creation' do
        subject.should_not be_published
      end
    end
    ```

* Use `specify` if possible. It is a synonym of `it` but is more readable when there is no docstring.

    ```Ruby
    # bad
    describe Article do
      before { @article = Fabricate(:article) }

      it 'is not published on creation' do
        @article.should_not be_published
      end
    end

    # good
    describe Article do
      let(:article) { Fabricate(:article) }
      specify { article.should_not be_published }
    end
    ```


* Use `its` when possible

    ```Ruby
    # bad
    describe Article do
      subject { Fabricate(:article) }

      it 'has the current date as creation date' do
        subject.creation_date.should == Date.today
      end
    end

    # good
    describe Article do
      subject { Fabricate(:article) }
      its(:creation_date) { should == Date.today }
    end
    ```


* Use `shared_examples` if you want to create a spec group that can be shared by many other tests.

   ```Ruby
   # bad
    describe Array do
      subject { Array.new [7, 2, 4] }

      context "initialized with 3 items" do
        its(:size) { should eq(3) }
      end
    end

    describe Set do
      subject { Set.new [7, 2, 4] }

      context "initialized with 3 items" do
        its(:size) { should eq(3) }
      end
    end

   #good
    shared_examples "a collection" do
      subject { described_class.new([7, 2, 4]) }

      context "initialized with 3 items" do
        its(:size) { should eq(3) }
      end
    end

    describe Array do
      it_behaves_like "a collection"
    end

    describe Set do
      it_behaves_like "a collection"
    end

### Views

* The directory structure of the view specs `spec/views` matches the
  one in `app/views`. For example the specs for the views in
  `app/views/users` are placed in `spec/views/users`.
* The naming convention for the view specs is adding `_spec.rb` to the
  view name, for example the view `_form.html.haml` has a
  corresponding spec `_form.html.haml_spec.rb`.
* `spec_helper.rb` need to be required in each view spec file.
* The outer `describe` block uses the path to the view without the
  `app/views` part. This is used by the `render` method when it is
  called without arguments.

    ```Ruby
    # spec/views/articles/new.html.haml_spec.rb
    require 'spec_helper'

    describe 'articles/new.html.haml' do
      # ...
    end
    ```

* Always mock the models in the view specs. The purpose of the view is
  only to display information.
* The method `assign` supplies the instance variables which the view
  uses and are supplied by the controller.

    ```Ruby
    # spec/views/articles/edit.html.haml_spec.rb
    describe 'articles/edit.html.haml' do
    it 'renders the form for a new article creation' do
      assign(
        :article,
        mock_model(Article).as_new_record.as_null_object
      )
      render
      rendered.should have_selector('form',
        method: 'post',
        action: articles_path
      ) do |form|
        form.should have_selector('input', type: 'submit')
      end
    end
    ```

* Prefer the capybara negative selectors over should_not with the positive.

    ```Ruby
    # bad
    page.should_not have_selector('input', type: 'submit')
    page.should_not have_xpath('tr')

    # good
    page.should have_no_selector('input', type: 'submit')
    page.should have_no_xpath('tr')
    ```

* When a view uses helper methods, these methods need to be
  stubbed. Stubbing the helper methods is done on the `template`
  object:

    ```Ruby
    # app/helpers/articles_helper.rb
    class ArticlesHelper
      def formatted_date(date)
        # ...
      end
    end

    # app/views/articles/show.html.haml
    = "Published at: #{formatted_date(@article.published_at)}"

    # spec/views/articles/show.html.haml_spec.rb
    describe 'articles/show.html.haml' do
      it 'displays the formatted date of article publishing' do
        article = mock_model(Article, published_at: Date.new(2012, 01, 01))
        assign(:article, article)

        template.stub(:formatted_date).with(article.published_at).and_return('01.01.2012')

        render
        rendered.should have_content('Published at: 01.01.2012')
      end
    end
    ```

* The helpers specs are separated from the view specs in the `spec/helpers` directory.

### Controllers

* Mock the models and stub their methods. Testing the controller should not depend on the model creation.
* Test only the behaviour the controller should be responsible about:
  * Execution of particular methods
  * Data returned from the action - assigns, etc.
  * Result from the action - template render, redirect, etc.

        ```Ruby
        # Example of a commonly used controller spec
        # spec/controllers/articles_controller_spec.rb
        # We are interested only in the actions the controller should perform
        # So we are mocking the model creation and stubbing its methods
        # And we concentrate only on the things the controller should do

        describe ArticlesController do
          # The model will be used in the specs for all methods of the controller
          let(:article) { mock_model(Article) }

          describe 'POST create' do
            before { Article.stub(:new).and_return(article) }

            it 'creates a new article with the given attributes' do
              Article.should_receive(:new).with(title: 'The New Article Title').and_return(article)
              post :create, message: { title: 'The New Article Title' }
            end

            it 'saves the article' do
              article.should_receive(:save)
              post :create
            end

            it 'redirects to the Articles index' do
              article.stub(:save)
              post :create
              response.should redirect_to(action: 'index')
            end
          end
        end
        ```

* Use context when the controller action has different behaviour depending on the received params.

    ```Ruby
    # A classic example for use of contexts in a controller spec is creation or update when the object saves successfully or not.

    describe ArticlesController do
      let(:article) { mock_model(Article) }

      describe 'POST create' do
        before { Article.stub(:new).and_return(article) }

        it 'creates a new article with the given attributes' do
          Article.should_receive(:new).with(title: 'The New Article Title').and_return(article)
          post :create, article: { title: 'The New Article Title' }
        end

        it 'saves the article' do
          article.should_receive(:save)
          post :create
        end

        context 'when the article saves successfully' do
          before { article.stub(:save).and_return(true) }

          it 'sets a flash[:notice] message' do
            post :create
            flash[:notice].should eq('The article was saved successfully.')
          end

          it 'redirects to the Articles index' do
            post :create
            response.should redirect_to(action: 'index')
          end
        end

        context 'when the article fails to save' do
          before { article.stub(:save).and_return(false) }

          it 'assigns @article' do
            post :create
            assigns[:article].should be_eql(article)
          end

          it 're-renders the "new" template' do
            post :create
            response.should render_template('new')
          end
        end
      end
    end
    ```

### Models

* Do not mock the models in their own specs.
* Use fabrication to make real objects.
* It is acceptable to mock other models or child objects.
* Create the model for all examples in the spec to avoid duplication.

    ```Ruby
    describe Article do
      let(:article) { Fabricate(:article) }
    end
    ```

* Add an example ensuring that the fabricated model is valid.

    ```Ruby
    describe Article do
      it 'is valid with valid attributes' do
        article.should be_valid
      end
    end
    ```

* When testing validations, use `have(x).errors_on` to specify the attibute
which should be validated. Using `be_valid` does not guarantee that the problem
 is in the intended attribute.

    ```Ruby
    # bad
    describe '#title' do
      it 'is required' do
        article.title = nil
        article.should_not be_valid
      end
    end

    # prefered
    describe '#title' do
      it 'is required' do
        article.title = nil
        article.should have(1).error_on(:title)
      end
    end
    ```

* Add a separate `describe` for each attribute which has validations.

    ```Ruby
    describe Article do
      describe '#title' do
        it 'is required' do
          article.title = nil
          article.should have(1).error_on(:title)
        end
      end
    end
    ```

* When testing uniqueness of a model attribute, name the other object `another_object`.

    ```Ruby
    describe Article do
      describe '#title' do
        it 'is unique' do
          another_article = Fabricate.build(:article, title: article.title)
          article.should have(1).error_on(:title)
        end
      end
    end
    ```

### Mailers

* The model in the mailer spec should be mocked. The mailer should not depend on the model creation.
* The mailer spec should verify that:
  * the subject is correct
  * the receiver e-mail is correct
  * the e-mail is sent to the right e-mail address
  * the e-mail contains the required information

     ```Ruby
     describe SubscriberMailer do
       let(:subscriber) { mock_model(Subscription, email: 'johndoe@test.com', name: 'John Doe') }

       describe 'successful registration email' do
         subject { SubscriptionMailer.successful_registration_email(subscriber) }

         its(:subject) { should == 'Successful Registration!' }
         its(:from) { should == ['info@your_site.com'] }
         its(:to) { should == [subscriber.email] }

         it 'contains the subscriber name' do
           subject.body.encoded.should match(subscriber.name)
         end
       end
     end
     ```

### Uploaders

* What we can test about an uploader is whether the images are resized correctly.
Here is a sample spec of a [carrierwave](https://github.com/jnicklas/carrierwave) image uploader:

    ```Ruby

    # rspec/uploaders/person_avatar_uploader_spec.rb
    require 'spec_helper'
    require 'carrierwave/test/matchers'

    describe PersonAvatarUploader do
      include CarrierWave::Test::Matchers

      # Enable images processing before executing the examples
      before(:all) do
        UserAvatarUploader.enable_processing = true
      end

      # Create a new uploader. The model is mocked as the uploading and resizing images does not depend on the model creation.
      before(:each) do
        @uploader = PersonAvatarUploader.new(mock_model(Person).as_null_object)
        @uploader.store!(File.open(path_to_file))
      end

      # Disable images processing after executing the examples
      after(:all) do
        UserAvatarUploader.enable_processing = false
      end

      # Testing whether image is no larger than given dimensions
      context 'the default version' do
        it 'scales down an image to be no larger than 256 by 256 pixels' do
          @uploader.should be_no_larger_than(256, 256)
        end
      end

      # Testing whether image has the exact dimensions
      context 'the thumb version' do
        it 'scales down an image to be exactly 64 by 64 pixels' do
          @uploader.thumb.should have_dimensions(64, 64)
        end
      end
    end

    ```

# Further Reading

There are a few excellent resources on Rails style, that you should
consider if you have time to spare:

* [The Rails 3 Way](http://tr3w.com/)
* [Ruby on Rails Guides](http://guides.rubyonrails.org/)
* [The RSpec Book](http://pragprog.com/book/achbd/the-rspec-book)
* [The Cucumber Book](http://pragprog.com/book/hwcuc/the-cucumber-book)
* [Everyday Rails Testing with RSpec](https://leanpub.com/everydayrailsrspec)

# Contributing

Nothing written in this guide is set in stone. It's my desire to work
together with everyone interested in Rails coding style, so that we could
ultimately create a resource that will be beneficial to the entire Ruby
community.

Feel free to open tickets or send pull requests with improvements. Thanks in
advance for your help!

# License

![Creative Commons License](http://i.creativecommons.org/l/by/3.0/88x31.png)
This work is licensed under a [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/deed.en_US)

# Spread the Word

A community-driven style guide is of little use to a community that
doesn't know about its existence. Tweet about the guide, share it with
your friends and colleagues. Every comment, suggestion or opinion we
get makes the guide just a little bit better. And we want to have the
best possible guide, don't we?

Cheers,<br/>
[Bozhidar](https://twitter.com/bbatsov)
