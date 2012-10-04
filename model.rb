#. Canonical model: app/modes/person.rb
#. "#." signifies a meta-comment.
#.
#. If your model is longer than 250 lines, it stinks... refactor it!
#. If any method is longer than 10 lines, it stinks... refactor it!

# Person:
#
# Basic model of a human-being.
#
class Person < ActiveRecord::Base

  #. Ordering is important. Group and order models as below.

  #. Whitelist all mass-assignable attributes, ordered alphabetically
  #. List all protected attributes immediately after.
  #. Don't list attributes that exist in the db but should not be used
  #. (e.g. STI columns that don't apply to this model).
  attr_accessible :age,
                  :name,
                  :birthday
  # protected     admin
  #               state

  VERY_OLD = 28

  belongs_to :uncle
  belongs_to :aunt

  has_many :children

  extend FriendlyId
  include AnotherModule

  #. Use the "validates" form over "validates_[uniqueness]_of".
  validates :name, presence: true,      uniqueness: true
  validates :age,  numericality: true

  #. Use "must" to designate validation callbacks (e.g. "name_must_be_german")
  validate :must_be_awesome

  before_validation :initialize_state
  after_destroy :notify_aunt

  #. Other macro-type methods...
  friendly_id :name

  audited :associated_with => :uncle

  #. Use "scope" instead of scope-class-methods for one-liners (never use "scope" for multi-line scopes)

  scope :very_old, where("age > #{VERY_OLD}")
  scope :active, where(:state => 'active')

  def self.kill_oldies
    very_old.destroy_all
  end

  #. Memoize expensive methods which are not expected to change over a request.
  #.
  #. Prefer memoize over ||= to memoize.

  def predicted_lifespan
    #. Some expensive computation...
  end
  memoize :predicted_lifespan

  private

    #. Don't use protected methods unless you truly need them.

    #. Indent private methods an extra two spaces.

    def self.private_class_method
      #. ...
    end

    #. Validation, hooks, callbacks, etc., should be private.

    def must_be_awesome
      errors[:base] << 'We only allow awesome users' unless awesome?
    end

    def initialize_state
      self.state = :pending
    end

    def notify_aunt
      aunt.notify("Sorry, but #{name} has been destroyed...")
    end

end
