# Prelude
Invoca Ruby Style Guide initially forked from https://github.com/bbatsov/ruby-style-guide.

The contents of this styleguide are to be enforced by (rubocop)[https://github.com/bbatsov/rubocop]
and automated in the code review process by (HoundCI)[https://houndci.com/]

Any adjustments to this styleguide should be captured in the `.rubocop.yml` config.

## Table of Contents

* [Source Code Layout](#source-code-layout)
* [Syntax](#syntax)
* [Naming](#naming)
* [Comments](#comments)
* [Annotations](#annotations)
* [Classes](#classes)
* [Exceptions](#exceptions)
* [Collections](#collections)
* [Strings](#strings)
* [Regular Expressions](#regular-expressions)
* [Metaprogramming](#metaprogramming)
* [Misc](#misc)

## Source Code Layout

### Use two **spaces** per indentation level. No hard tabs.

```ruby
# good
def some_method
  do_something
end

# bad - four spaces
def some_method
    do_something
end
```

### Use spaces around operators and `=>`, after commas, colons and semicolons, around `{`
  and before `}`.  (But there is no need for spaces inside the empty hash `{}`.)

```ruby
a, b = 1, 2 + 3
location = { :city => 'Santa Barbara', :state => 'CA' }
size > 10 ? 'large' : 'small'
[1, 2, 3].each { |e| puts e }
params = {}
```

The only exception is when using the exponent operator:

```ruby
# bad
e = M * c ** 2

# good
e = M * c**2
```

### No spaces after `(`, `[` or before `]`, `)`.

```ruby
some(arg).other
[1, 2, 3].length
collection = []
```

### Indent `when` as deep as `case`. I know that many would disagree.
  with this one, but it's the style established in both the "The Ruby
  Programming Language" and "Programming Ruby".

```ruby
case
when song.name == 'Misty'
  puts 'Not again!'
when song.duration > 120
  puts 'Too long!'
when Time.now.hour > 21
  puts "It's too late"
else
  song.play
end

kind = case year
       when 1850..1889 then 'Blues'
       when 1890..1909 then 'Ragtime'
       when 1910..1929 then 'New Orleans Jazz'
       when 1930..1939 then 'Swing'
       when 1940..1950 then 'Bebop'
       else 'Jazz'
       end
```

### Use empty lines between `def`s and to break up a method into logical paragraphs.

```ruby
def some_method
  data = initialize(options)

  data.manipulate!

  data.result
end

def some_method
  result
end
```

### Align the parameters of a method call if they span over multiple lines using normal indent.

```ruby
# starting point (line is too long)
def send_mail(source)
  Mailer.deliver(to: 'bob@example.com', from: 'us@example.com', subject: 'Important message', body: source.text)
end

# good (normal indent)
def send_mail(source)
  Mailer.deliver(
    to: 'bob@example.com',
    from: 'us@example.com',
    subject: 'Important message',
    body: source.text)
end

# bad (double indent)
def send_mail(source)
  Mailer.deliver(
      to: 'bob@example.com',
      from: 'us@example.com',
      subject: 'Important message',
      body: source.text)
end

# bad
def send_mail(source)
  Mailer.deliver(to: 'bob@example.com',
                 from: 'us@example.com',
                 subject: 'Important message',
                 body: source.text)
end
```

### Use RDoc and its conventions for API documentation.
  Don't put an empty line between the comment block and the `def`.

### Avoid lines longer than 120 characters.

### Avoid trailing whitespace.

### Use `UTF-8` as the source file encoding when you need more than plain ASCII.

## Syntax

### Prefer parentheses around arguments in method declaration.
 Omit the parentheses when the method doesn't accept any arguments.

```ruby
def some_method
  ...
end

def some_method_with_arguments(arg1, arg2)
  ...
end
```

### Never use `for`, unless you know exactly why.
Most of the time iterators should be used instead. `for` is implemented in terms of `each` (so
you're adding a level of indirection), but with a twist - `for`
doesn't introduce a new scope (unlike `each`) and variables defined
in its block will be visible outside it.

```ruby
arr = [1, 2, 3]

# bad
for elem in arr do
  puts elem
end

# good
arr.each { |elem| puts elem }
```

### Never use `then` for multi-line `if/unless`.

```ruby
# bad
if some_condition then
  ...
end

# good
if some_condition
  ...
end
```

### Use one expression per branch in a ternary operator.
This also means that ternary operators must not be nested. Prefer
`if/else` constructs in these cases.
Avoid multi-line ternary; use `if/unless` instead.

```ruby
# bad
some_condition ? (nested_condition ? nested_something : nested_something_else) : something_else

# good
if some_condition
  nested_condition ? nested_something : nested_something_else
else
  something_else
end
```

### Use `&&/||` for boolean expressions, `and/or` for control flow.

```ruby
# boolean expression
if document.text_changed? || document.settings_changed?
  document.save!
end

# control flow
document.saved? or document.save!
```

Beware: `and/or` have lower precedence than `=`!

```ruby
flag = top_of_page? or reset_page

# is equivalent to
(flag = top_of_page?) or reset_page

```

### Only use trailing `if/unless` when they are rare footnotes that can be ignored in the usual, "go-right" case.
That is, the statement you start with should almost always execute.
  (A good alternative for assertions and other one-line code that rarely executes is control-flow `and/or`.)

```ruby
# bad -- the raise rarely executes
raise ArgumentError, "name must be provided" unless name.present?

# good
name.present? or raise ArgumentError, "name must be provided"

# good -- the unless is a rare footnote
format(page) unless page.already_formatted?

# good -- the if is almost always true
send_notification(users) if users.any?
```

### Never use `unless` with `else`. Rewrite these with the positive case first.

```ruby
# bad
unless success?
  puts 'failure'
else
  puts 'success'
end

# good
if success?
  puts 'success'
else
  puts 'failure'
end
```

### Don't use parentheses around the condition of an `if/unless/while`, unless the condition contains an assignment.
(see "Using the return value of `=`" below).

```ruby
# bad
if (x > 10)
  ...
end

# good
if x > 10
  ...
end

# ok
if (x = self.next_value)
  ...
end
```

### Favor modifier `while/until` usage when you have a single-line body.

```ruby
# bad
while some_condition
  do_something
end

# good
do_something while some_condition
```

### Favor `until` over `while` for negative conditions.

```ruby
# bad
do_something while !some_condition

# good
do_something until some_condition
```

### Omit parentheses around parameters for methods that are part of an internal DSL
(e.g. Rake, Rails, RSpec), methods that are with
"keyword" status in Ruby (e.g. `attr_reader`, `puts`) and attribute
access methods. It is preferred to use parentheses around the arguments of all other
method invocations.

```ruby
class Person
  attr_reader :name, :age

  ...
end

temperance = Person.new('Temperance', 30)
temperance.name

puts temperance.age

x = Math.sin(y)
array.delete(e)
```

### Prefer `{...}` over `do...end` for single-line blocks.  
Avoid using `{...}` for multi-line blocks (multiline chaining is always
ugly). Always use `do...end` for "control flow" and "method
definitions" (e.g. in Rakefiles and certain DSLs).  Avoid `do...end`
when chaining.

```ruby
names = ['Bozhidar', 'Steve', 'Sarah']

# good
names.each { |name| puts name }

# bad
names.each do |name|
  puts name
end

# good
names.select { |name| name.start_with?('S') }.map { |name| name.upcase }

# bad
names.select do |name|
  name.start_with?('S')
end.map { |name| name.upcase }
```

Some will argue that multiline chaining would look OK with the use of {...}, but they should
ask themselves: is this code really readable and can't the blocks contents be extracted into
nifty methods?

### Avoid `return` where not needed for flow of control. Prefer `if`/`else` or `&&`/`||`.
(Omitting `return` is more succinct and declarative, and your code will still work if you refactor it into a block later.)

```ruby
# bad
def some_method(some_arr)
  return some_arr.size
end

# good
def some_method(some_arr)
  some_arr.size
end

# bad
def click_url
  return "http://#{click_domain}/c" if click_domain.nonblank?
  return click_url_for_hostname(vanity_domain) if vanity_domain.nonblank?
  click_url_for_hostname(CLICK_URL_DEFAULT_DOMAIN)
end

# good
def click_url
  if click_domain.nonblank?
    "http://#{click_domain}/c"
  elsif vanity_domain.nonblank?
    click_url_for_hostname(vanity_domain)
  else
    click_url_for_hostname(CLICK_URL_DEFAULT_DOMAIN)
  end
end

# bad
def should_redirect?
  return false unless rendered?
  return true if redirect_location.nonblank?
  return true if global_redirect?
  return false
end

# good
def should_redirect?
  !rendered && (redirect_location.nonblank? || global_redirect?)
end

# better still
def have_redirect?
  redirect_location.nonblank? || global_redirect?
end

def should_redirect?
  !rendered && have_redirect?
end
```

### Only use `self` when required for calling a self write accessor.

```ruby
# bad
def ready?
  if self.last_reviewed_at > self.last_updated_at
    self.worker.update(self.content, self.options)
    self.status = :in_progress
  end
  self.status == :verified
end

# good
def ready?
  if last_reviewed_at > last_updated_at
    worker.update(content, options)
    self.status = :in_progress
  end
  status == :verified
end
```

### As a corollary, avoid shadowing methods with local variables unless they are both equivalent.

```ruby
class Foo
  attr_accessor :options

  # ok
  def initialize(options)
    self.options = options
    # both options and self.options are equivalent here
  end

  # bad
  def do_something(options = {})
    unless options[:when] == :later
      output(self.options[:message])
    end
  end

  # good
  def do_something(params = {})
    unless params[:when] == :later
      output(options[:message])
    end
  end
end
```

### Use spaces around the `=` operator when assigning default values to method parameters:

```ruby
# bad
def some_method(arg1=:default, arg2=nil, arg3=[])
  # do something...
end

# good
def some_method(arg1 = :default, arg2 = nil, arg3 = [])
  # do something...
end
```

While several Ruby books suggest the first style, the second is much more prominent
in practice (and arguably a bit more readable).

### Avoid line continuation (\\) unless absolutely required.

```ruby
# bad
result = 1 \
         - 2

# better
result = 1 -
         2
```

### Using the return value of `=` (an assignment) is OK.
But surround the assignment with parentheses to make it clear you are not mistakenly using `=` when you meant `==`.

```ruby
# good - shows intended use of assignment
if (v = array.grep(/foo/)) ...

# bad
if v = array.grep(/foo/) ...

# also good - shows intended use of assignment and has correct precedence.
if (v = next_value) == 'hello' ...
```

### Don't use `||=` to initialize boolean variables.
(Consider what would happen if the current value happened to be `false`.)

```ruby
# bad - would set enabled to true even if it was false
enabled ||= true

# good
enabled = true if enabled.nil?
```

### Avoid using Perl-style special variables (like `$0-9`, `$``, etc. ).
They are cryptic and global.

### Never put a space between a method name and the opening parenthesis.

```ruby
# bad
f (3 + 2) + 1

# good
f(3 + 2) + 1
```

### Ruby 1.9 hash literal syntax is preferred when the hash keys are symbols.

```ruby
# bad
hash = { :one => 1, :two => 2 }

# good
hash = { one: 1, two: 2 }
```

### `->` / `lambda` are preferred over `proc`/`Proc.new`.

This is because `lambda`s enforce argument list cardinality and have unsurprising `return` semantics.
(Only use `proc` if you really need a return statement that returns from the enclosing code.)
More details [here](http://en.wikibooks.org/wiki/Ruby_Programming/Syntax/Method_Calls#Understanding_blocks.2C_Procs_and_methods).

### `->` (stabby lambda) syntax is preferred when there are arguments.

This is because stabby lambda arguments are treated just like regular method arguments. For example, these special arguments work for stabby lambda but not `lambda` or `Proc.new`:
* default arguments
* keyword arguments
* block (`&`) argument

```ruby
# bad
lam = lambda { |a, b| a + (b || 0) }
lam.call(1, 2)

# good
lam = ->(a, b = 0) { a + b }
lam.call(1, 2)
```

### Use `_` for unused block parameters.

```ruby
# bad
result = hash.map { |k, v| v + 1 }

# good
result = hash.map { |_, v| v + 1 }
```

## Naming

### Use `snake_case` for methods and variables.

### Use `CamelCase` for classes and modules. Keep acronyms like HTTP, RFC, XML uppercase when possible. (Upper case words cause problems for rails routes.)

### Use `SCREAMING_SNAKE_CASE` for other constants.

### The names of predicate methods (methods that return a boolean value) should end in a question mark.
  (e.g. `Array#empty?`)

### The names of potentially "dangerous" or surprising methods should end in an exclamation mark!
(e.g. methods that have side-effects like mutating a variable or changing the process flow)

### Prefer
  * `map` over `collect`
  * `reduce` over `inject`
  * `find` over `detect`
  * `select` over `find_all`
  * `size` over `length`

### Company names with capitals in the middle (e.g. RingRevenue) should drop the inner capitalization so that rails string helpers don't insert underscores in the middle
Examples:
* RingRevenue: Constantize: Ringrevenue, underscored: ringrevenue
* HubSpot     => Hubspot hubspot
* HubspotIntegration => hubspot_integration

## Comments

> Good code is its own best documentation. As you're about to add a
> comment, ask yourself, "How can I improve the code so that this
> comment isn't needed?" Improve the code and then document it to make
> it even clearer. <br/>
> -- Steve McConnell

### Enough said.


## Classes

### Try to make your classes as [SOLID](http://en.wikipedia.org/wiki/SOLID_(object-oriented_design\)) as possible.

### Use @ class variables when you want separate values per subclass.
Use @@ variables when you want process-wide globals (such as for a process-wide cache).

```ruby
class Parent
  @@class_var = 'parent'

  def self.print_class_var
    puts @@class_var
  end
end

class Child < Parent
  @@class_var = 'child'
end

Parent.print_class_var # => will print "child"
```

As you can see all the classes in a class hierarchy actually share one
class variable. Class instance variables should usually be preferred
over class variables.

### Assign proper visibility levels to methods (`private`, `protected`) in accordance with their intended usage.

### Indent the `public`, `protected`, and `private` methods as much the method definitions they apply to. Leave one blank line above and below them.

```ruby
class SomeClass
  def public_method
    ...
  end

  private

  def private_method
    ...
  end
end
```

### Use `class << self` or `def self.method` to define singleton methods so you don't have to repeat the class name (Don't Repeat Yourself).

```ruby
class TestClass
  # bad
  def TestClass.some_method
    ...
  end

  # good
  def self.some_other_method
    ...
  end

  # best
  # this form lets you define many class methods,
  # and public/private
  # and attr_reader work as expected.
  class << self
    def first_method
      ...
    end

    private

    def second_method_etc
      ...
    end
  end
end
```

## Exceptions

### Never return from an `ensure` block.
If you explicitly return from a
method inside an `ensure` block, the return will take precedence over
any exception being raised, and the method will return as if no
exception had been raised at all. In effect, the exception will be
silently thrown away.

```ruby
def foo
  begin
    fail
  ensure
    return 'very bad idea'
  end
end
```

### Use *implicit begin blocks* when possible.

```ruby
# bad
def foo
  begin
    # main logic goes here
  rescue
    # failure handling goes here
  end
end

# good
def foo
  # main logic goes here
rescue
  # failure handling goes here
end
```

### Mitigate the proliferation of `begin` blocks by using *contingency methods* (a term coined by Avdi Grimm).

```ruby
# bad
begin
  something_that_might_fail
rescue IOError
  # handle IOError
end

begin
  something_else_that_might_fail
rescue IOError
  # handle IOError
end

# good
def with_io_error_handling
   yield
rescue IOError
  # handle IOError
end

with_io_error_handling { something_that_might_fail }

with_io_error_handling { something_else_that_might_fail }
```

### Don't suppress exceptions.

```ruby
# bad
begin
  # an exception occurs here
rescue SomeError
  # the rescue clause does absolutely nothing
end

# bad
do_something rescue nil
```

### Don't use exceptions for flow of control.

```ruby
# bad
begin
  n / d
rescue ZeroDivisionError
  puts 'Cannot divide by 0!'
end

# good
if d.zero?
  puts 'Cannot divide by 0!'
else
  n / d
end
```

### Avoid rescuing the `Exception` class.  This will trap signals and calls to `exit`, requiring you to `kill -9` the process.

```ruby
# bad
begin
  # calls to exit and kill signals will be caught (except kill -9)
  exit
rescue Exception
  puts "you didn't really want to exit, right?"
  # exception handling
end

# good
begin
  # a blind rescue rescues from StandardError, not Exception as many
  # programmers assume.
rescue => e
  # exception handling
end

# also good
begin
  # an exception occurs here

rescue StandardError => e
  # exception handling
end
```

### Put more specific exceptions higher up the rescue chain, otherwise they'll never be rescued from.

```ruby
# bad
begin
  # some code
rescue Exception => e
  # some handling
rescue StandardError => e
  # some handling
end

# good
begin
  # some code
rescue StandardError => e
  # some handling
rescue Exception => e
  # some handling
end
```

### Release external resources obtained by your program in an ensure block.

```ruby
f = File.open('testfile')
begin
  # .. process
rescue
  # .. handle error
ensure
  f.close unless f.nil?
end
```

### Use exceptions from the standard library for simple cases so you can avoid introducing new exception classes.

### If you create a custom exception class, always inherit from `StandardError` not `Exception`

## Collections

### Use `Set` instead of `Array` when dealing with unique elements.
`Set` implements a collection of unordered values with no duplicates. This
is a hybrid of `Array`'s intuitive inter-operation facilities and
`Hash`'s fast lookup.

### Avoid the use of mutable object as hash keys.

### Rely on the fact that hashes in 1.9 are ordered.

### Never modify a collection while traversing it.

### Don't use the `%w()` syntax for defining arrays
Define them as `['a', 'b']` or `'a b'.split(' ')` 

## Strings

### Prefer string interpolation instead of string concatenation:

```ruby
# bad
email_with_name = user.name + ' <' + user.email + '>'

# good
email_with_name = "#{user.name} <#{user.email}>"
```

### `String#<<` performs better by mutating the string in place.
`String#+`, avoids mutation (which is good in a functional way) but therefore runs slower since it creates a new string object.

```ruby
# faster
html = ''

paragraphs.each do |paragraph|
  html << "<p>#{paragraph}</p>"
end

# more functional but slower
html = ''

paragraphs.each do |paragraph|
  html += "<p>#{paragraph}</p>"
end

# most functional
html = paragraphs.map do |paragraph|
  "<p>#{paragraph}</p>"
end.join
```

## Regular Expressions

### Don't use a regular expression when a plain string will do:

```ruby
# bad
if command[/quit/]
  ...
end

# good
if command['quit']
  ...
end
```

### For simple constructions you can use regexp directly through string index.

```ruby
match = string[/regexp/]             # get content of matched regexp
first_group = string[/text(grp)/, 1] # get content of captured group
string[/text (grp)/, 1] = 'replace'  # string => 'text replace'
```

### Avoid using $1-9 as it can be hard to track what they contain and they live globally. Numbered indexes or named groups can be used instead.

```ruby
# bad
/\A(https?):/ =~ url
...
setup_connection($1)

# good
protocol = url[/\A(https?):/, 1]
...
setup_connection(protocol)

# good
/\A(?<protocol>https?):/ =~ url
...
setup_connection(protocol)
```

### Be careful not to use `^` and `$` for anchors (like in other languages) because in Ruby they also match newlines.
For anchors, use `\A` and `\z` (not to be confused with `\Z` which is the equivalent of `/\n?\z/`).

```ruby
string = "some injection\nusername"
string[/^username$/]   # matches
string[/\Ausername\z/] # don't match
```

### Use `x` modifier for complex regexps so that you can use whitespace and comments to make them more readable.
Just be careful as spaces are ignored.

```ruby
regexp = %r{
  start         # some text
  \s            # white space char
  (group)       # first group
  (?:alt1|alt2) # some alternation
  end
}x
```

### For complex replacements `sub`/`gsub` can be used with a block or hash.

## Metaprogramming

### Only use metaprogramming when necessary.
For example, `deliver_<mail_message>` in TMail was completely
unnecessary since it was equivalent to simply `deliver(:mail_message)`.

### Do not monkey patch core classes unless you really need to change their behavior.
Generally across all code in the process including other gems and libraries (separation of concerns!):

```ruby
# bad
class Fixnum
  def days
    ...
  end
end
```

### The block form of `class_eval` is preferable to the string-interpolated form.
  - when you use the string-interpolated form, always supply `__FILE__` and `__LINE__`, so that your backtraces make sense:

```ruby
class_eval 'def use_relative_model_naming?; true; end', __FILE__, __LINE__
```

  - `define_method` is preferable to `class_eval { def ... }`

### Avoid `method_missing` if possible.
Backtraces become messy; the behavior is not listed in `#methods`; misspelled method calls might silently work (`nukes.launch_state = false`).
Consider using delegation, proxy, or `define_method` instead.  If you must, use `method_missing`,
  - be sure to [also define `respond_to_missing?`](http://blog.marc-andre.ca/2010/11/methodmissing-politely.html)
  - only catch methods with a well-defined prefix, such as `find_by_*` -- make your code as assertive as possible.
  - call `super` at the end of your statement
  - delegate to a reusable, testable, non-magical method:

```ruby
# bad
def method_missing?(meth, *args, &block)
  if /^find_by_(?<prop>.*)/ =~ meth
    # ... lots of code to do a find_by
  else
    super
  end
end

# good
def method_missing?(meth, *args, &block)
  if /^find_by_(?<prop>.*)/ =~ meth
    find_by(prop, *args, &block)
  else
    super
  end
end

# best of all, though, would be to define_method as each findable attribute is declared
```

## Misc

### Write `ruby -w` safe code when practical.
Try an editor that will show you these when you save.

### When code patterns are repeated, use separate lines and extra whitespace when practical to align columns so that the code is tabular.
This makes the patterns obvious which helps to spot/prevent bugs.

```ruby
# bad
PROMOTIONAL_METHODS = [
                [ 'review_site', 'Content / Review Site'],
                [ 'coupon_site', 'Discount / Coupon Site' ],
                [ 'display', 'Display' ],
                [ 'email', 'Email' ],
                [ 'rewards', 'Rewards / Incentive' ],
                [ 'leads', 'Lead Form / Co Reg' ],
                [ 'search', 'Search' ],
                [ 'social_media', 'Social Media' ],
                [ 'software', 'Software' ],
                [ 'other', 'Other' ]
              ],
...
# good
  PROMOTIONAL_METHODS = [
                [ 'review_site',  'Content / Review Site'],
                [ 'coupon_site',  'Discount / Coupon Site' ],
                [ 'display',      'Display' ],
                [ 'email',        'Email' ],
                [ 'rewards',      'Rewards / Incentive' ],
                [ 'leads',        'Lead Form / Co Reg' ],
                [ 'search',       'Search' ],
                [ 'social_media', 'Social Media' ],
                [ 'software',     'Software' ],
                [ 'other',        'Other' ]
              ],
...
# bad
      params = {
        'phone' => calling_phone_number.to_param,
        'LastName' => last_name,
        'FirstName' => first_name,
        'Address' => primary_address,
        'ApartmentNum' => secondary_address,
        'City' => city_name,
        'State' => state,
        'Zipcode' => zip
      }
...
# good
      params = {
        'phone'         => calling_phone_number.to_param,
        'LastName'      => last_name,
        'FirstName'     => first_name,
        'Address'       => primary_address,
        'ApartmentNum'  => secondary_address,
        'City'          => city_name,
        'State'         => state,
        'Zipcode'       => zip
      }
```

### Prefer code written in the functional style
avoid side-effects like object mutation unless required by performance concerns.
 Mutating arguments is a side-effect so don't do it unless that is the sole purpose of the method.
* Don't put required parameters into options hashes.

### Try to keep methods to 10 lines of code or less.
Ideally, most methods will be shorter than 5 lines of code. Comments and empty lines do not count.

### Try to keep parameter lists limited to three or four parameters.

### Avoid `alias` when `alias_method` will do.

### Use `OptionParser` for parsing complex command line options and
`ruby -s` for trivial command line options.
