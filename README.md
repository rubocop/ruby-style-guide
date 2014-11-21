
# The Grouper Ruby Style Guide

  The purpose of this document is to prevent us from wasting time arguing about things that don't matter. If there are any portions of the codebase that don't follow these rules, feel free to fix them.

## Table of Contents

* [Coding Style](#coding-style)
* [Documentation](#documentation)
* [Whitespace](#whitespace)
* [Syntax](#syntax)
* [Naming](#naming)
* [Classes](#classes--modules)
* [Exceptions](#exceptions)
* [Collections](#collections)
* [Strings](#strings)
* [Regular Expressions](#regular-expressions)
* [Percent Literals](#percent-literals)
* [Specs](#specs)

## Coding Style

* Use soft-tabs with two **spaces** per indentation level.

* Prefer a single-line format for class definitions with no body.

    ```Ruby
    # bad
    class FooError < StandardError
    end

    # okish
    class FooError < StandardError; end

    # good
    FooError = Class.new(StandardError)
    ```

* No spaces after `(`, `[` or before `]`, `)`.

    ```Ruby
    some(arg).other
    [1, 2, 3].length
    ```

* Use spaces around `{` and before `}`.

  ```Ruby
  [1, 2, 3].each { |e| puts e }
  ```

* No space after `!`.

    ```Ruby
    # good
    !array.include?(thing)
    ```

* Indent `when` as deep as `case`. I know that many would disagree
  with this one, but it's the style established in both "The Ruby
  Programming Language" and "Programming Ruby".

    ```Ruby
    # bad
    case
      when song.name == "Misty"
        puts "Not again!"
      when song.duration > 120
        puts "Too long!"
      when Time.now.hour > 21
        puts "It's too late"
      else
        song.play
    end

    # good
    case
    when song.name == "Misty"
      puts "Not again!"
    when song.duration > 120
      puts "Too long!"
    when Time.now.hour > 21
      puts "It's too late"
    else
      song.play
    end
    ```

* Use empty lines between `def`s also to break up a method into logical
  paragraphs internally.

    ```Ruby
    def some_method
      data = initialize(options)

      data.manipulate!

      data.result
    end

    def some_method
      result
    end
    ```

* Use spaces around the `=` operator when assigning default values to method parameters:

    ```Ruby
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

* Avoid line continuation `\` where not required. In practice, avoid using
  line continuations for anything but string concatenation.

    ```Ruby
    # bad
    result = 1 - \
             2

    # good (but still ugly as hell)
    result = 1 \
             - 2

    long_string = "First part of the long string" \
                  " and second part of the long string"
    ```

* Single indent the parameters of a method call if they span more than one
  line.

    ```Ruby
    # starting point (line is too long)
    def send_mail(source)
      Mailer.deliver(to: "bob@example.com", from: "us@example.com", subject: "Important message", body: source.text)
    end

    # bad (too much indentation)
    def send_mail(source)
      Mailer.deliver(to: "bob@example.com",
                     from: "us@example.com",
                     subject: "Important message",
                     body: source.text)
    end

    # good (normal indent)
    def send_mail(source)
      Mailer.deliver(
        to: "bob@example.com",
        from: "us@example.com",
        subject: "Important message",
        body: source.text
      )
    end
    ```

## Documentation

* Capitalize the first letter of comments but omit periods at the end of statements.

* Use the minimum viable tomdoc format.

    ```Ruby
    # Duplicate some text an arbitrary number of times
    #
    # Returns the duplicated String
    def multiplex(text, count)
      text * count
    end
    ```

## Whitespace

* Limit lines to 80 characters.
* End each file with a blank newline.
* Remove all trailing spaces using
[https://github.com/SublimeText/TrailingSpaces](Trailing Spaces) (but don't use the annoying live-highlighting)

    ```json
    {
      "trailing_spaces_enabled" : false,
      "trailing_spaces_trim_on_save": true
    }
    ```

### Newlines

Newlines are our friends, but they are also a complicated matter.
The simplest rules for consistent newlines are the following:

* Never have 2 newlines in a row
* No newlines immediately after an increase, or immediately before a decrease in indentation.
* No newlines around class declarations (that reside in their own file)
* No newlines between comments and their related methods
* Separate class/module macros from methods of groups of macros using a newline (`attr_accessor`, `private` etc)
* Add newlines to separate `if else` and similar blocks within methods

This applies for specs and config files as well.

If you are tempted to use more than 1 line of separation, take it as an
indicator that the file/class you are working might be too big.

```ruby

# Class comment (notice empty line at the start of the file)

class Bad

  # Method comment

  def public_method
    if bad
      ...
    else
      ...
    end
    fail
  end

  private
  def private_method
  end

end
```

```ruby
# Class comment (if you _really_ need one)
class Good
  attr_accessor :no_line

  def public_method
    if much_better
      ...
    else
      ...
    end

    succeed
  end

  private

  def private_method
  end
end
```

## Syntax

* Use `def` with parentheses when there are arguments. Omit the
  parentheses when the method doesn't accept any arguments.

     ```Ruby
     # bad
     def some_method()
       # body omitted
     end

     # good
     def some_method
       # body omitted
     end

     # bad
     def some_method_with_arguments arg1, arg2
       # body omitted
     end

     # good
     def some_method_with_arguments(arg1, arg2)
       # body omitted
     end
     ```

* Favor the ternary operator(`?:`) over `if/then/else/end` constructs.
  It's more common and obviously more concise.

    ```Ruby
    # bad
    result = if some_condition then something else something_else end

    # good
    result = some_condition ? something : something_else
    ```

* Use one expression per branch in a ternary operator. This
  also means that ternary operators must not be nested. Prefer
  `if/else` constructs in these cases.

    ```Ruby
    # bad
    some_condition ? (nested_condition ? nested_something : nested_something_else) : something_else

    # good
    if some_condition
      nested_condition ? nested_something : nested_something_else
    else
      something_else
    end
    ```

* Use `!` instead of `not`.

    ```Ruby
    # bad - braces are required because of op precedence
    x = (not something)

    # good
    x = !something
    ```

* Avoid the use of `!!`.

    ```Ruby
    # bad
    x = "test"
    # obscure nil check
    if !!x
      # body omitted
    end

    x = false
    # double negation is useless on booleans
    !!x # => false

    # good
    x = "test"
    unless x.nil?
      # body omitted
    end
    ```

* The `and` and `or` keywords are banned. It's just not worth
  it. Always use `&&` and `||` instead.

* Favor modifier `if/unless` usage when you have a single-line
  body. Another good alternative is the usage of control flow `&&/||`.

    ```Ruby
    # bad
    if some_condition
      do_something
    end

    # good
    do_something if some_condition
    ```

* Never use `unless` with `else`. Rewrite these with the positive case first.

    ```Ruby
    # bad
    unless success?
      puts "failure"
    else
      puts "success"
    end

    # good
    if success?
      puts "success"
    else
      puts "failure"
    end
    ```

* Don't use parentheses around the condition of an `if/unless/while`.

    ```Ruby
    # bad
    if (x > 10)
      # body omitted
    end

    # good
    if x > 10
      # body omitted
    end
    ```

* Omit parentheses around parameters for methods that are part of an
  internal DSL (e.g. Rake, Rails, RSpec), methods that have
  "keyword" status in Ruby (e.g. `attr_reader`, `puts`) and attribute
  access methods. Use parentheses around the arguments of all other
  method invocations.

    ```Ruby
    class Person
      attr_reader :name, :age

      # omitted
    end

    temperance = Person.new("Temperance", 30)
    temperance.name

    puts temperance.age

    x = Math.sin(y)
    array.delete(e)

    bowling.score.should == 0
    ```

* Omit the outer braces around an implicit options hash.

    ```Ruby
    # bad
    user.set({ name: "John", age: 45, permissions: { read: true } })

    # good
    User.set(name: "John", age: 45, permissions: { read: true })
    ```

* Omit parentheses for method calls with no arguments.

* Avoid `return` where not required for flow of control.

* Avoid `self` where not required. (It is only required when calling a self write accessor.)

* Don't use the return value of `=` (an assignment) in conditional
  expressions unless the assignment is wrapped in parentheses. This is
  a fairly popular idiom among Rubyists that's sometimes referred to as
  *safe assignment in condition*.

    ```Ruby
    # bad
    if v = array.grep(/foo/)
      do_something(v)
      ...
    end

    # good
    if (v = array.grep(/foo/))
      do_something(v)
      ...
    end
    ```

* Use `||=` freely to initialize variables.

    ```Ruby
    # set name to Bozhidar, only if it's nil or false
    name ||= "Bozhidar"
    ```

* Don't use `||=` to initialize boolean variables. (Consider what
would happen if the current value happened to be `false`.)

    ```Ruby
    # bad - would set enabled to true even if it was false
    enabled ||= true

    # good
    enabled = true if enabled.nil?
    ```

* Avoid use of nested conditionals for flow of control.
  Prefer a guard clause when you can assert invalid data. A guard clause is a conditional
  statement at the top of a function that bails out as soon as it can.

    ```Ruby
    # bad
      def compute_thing(thing)
        if thing[:foo]
          update_with_bar(thing)
          if thing[:foo][:bar]
            partial_compute(thing)
          else
            re_compute(thing)
          end
        end
      end

    # good
      def compute_thing(thing)
        return unless thing[:foo]
        update_with_bar(thing[:foo])
        return re_compute(thing) unless thing[:foo][:bar]
        partial_compute(thing)
      end
    ```

### Long Expressions

When a long expression spans multiple lines, first try and refactor so it
shouldn't be necessary. Otherwise...

```ruby
def very_bad
  current_user.
  update_attributes(name: 'A very long name that spans multiple lines')
end

def very_bad
  current_user
            .assign_attributes(name: 'A very long name that spans multiple lines')
            .save
            .what
end

def bad
  current_user.
    update_attributes(name: 'A very long name that spans multiple lines')
end

def good
  current_user
    .update_attributes(name: 'A very long name that spans multiple lines')
end

def better
  current_user.update_attributes(
    name: 'A very long name that spans multiple lines'
  )
end
```

```ruby
# VERY bad
def alive?
  last_breath > 1.minute.ago || pulse.present? ||
  the_very_smart_doctor_said_so
end

# Good
def alive?
  last_breath > 1.minute.ago || pulse.present? ||
    the_very_smart_doctor_said_so
end

# Good - sometimes
def alive?
  (last_breath > 1.minute.ago || pulse.present? ||
    the_very_smart_doctor_said_so)
end
```

## Naming

* Use `snake_case` for methods and variables.

* Use `CamelCase` for classes and modules. (Keep acronyms like HTTP, RFC, XML uppercase.)

* Use `SCREAMING_SNAKE_CASE` for other constants.

* The names of predicate methods (methods that return a boolean value) should end in a question mark. (i.e. `Array#empty?`).

* The names of potentially "dangerous" methods (i.e. methods that modify `self` or the arguments, `exit!`, etc.) should end with an exclamation mark. Bang methods should only exist if a non-bang method exists. ([More on this](http://dablog.rubypal.com/2007/8/15/bang-methods-or-danger-will-rubyist)).


## Classes & Modules

* Use a consistent structure in your class definitions.

    ```Ruby
    class Person
      # extend and include go first
      extend SomeModule
      include AnotherModule

      # constants are next
      SOME_CONSTANT = 20

      # afterwards we have attribute macros
      attr_reader :name

      # followed by other macros (if any)
      validates :name

      # public class methods are next in line
      def self.some_method
      end

      # followed by public instance methods
      def some_method
      end

      # private methods are grouped near the end
      private

      def some_private_method
      end
    end
    ```

* Prefer modules to classes with only class methods. Classes should be
  used only when it makes sense to create instances out of them.

    ```Ruby
    # bad
    class SomeClass
      def self.some_method
        # body omitted
      end

      def self.some_other_method
      end
    end

    # good
    module SomeClass
      module_function

      def some_method
        # body omitted
      end

      def some_other_method
      end
    end
    ```

* Use the `attr` family of functions to define trivial accessors or
mutators.

    ```Ruby
    # bad
    class Person
      def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
      end

      def first_name
        @first_name
      end

      def last_name
        @last_name
      end
    end

    # good
    class Person
      attr_reader :first_name, :last_name

      def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
      end
    end
    ```

* Avoid the usage of class (`@@`) variables due to their strange behavior
in inheritance.

    ```Ruby
    class Parent
      @@class_var = "parent"

      def self.print_class_var
        puts @@class_var
      end
    end

    class Child < Parent
      @@class_var = "child"
    end

    Parent.print_class_var # => will print "child"
    ```

    As you can see all the classes in a class hierarchy actually share one
    class variable. Class instance variables should usually be preferred
    over class variables.

* Assign proper visibility levels to methods (`private`, `protected`)
in accordance with their intended usage.

* Avoid using `protected` as it's rarely useful.

* Use `def self.method` to define singleton methods. This makes the code
  easier to refactor since the class name is not repeated.

    ```Ruby
    class TestClass
      # bad
      def TestClass.some_method
        # body omitted
      end

      # bad
      class << self
        def first_method
          # body omitted
        end

        def second_method_etc
          # body omitted
        end
      end


      # good
      def self.some_other_method
        # body omitted
      end

    end
    ```

* Avoid `class << self` except when necessary, e.g. single accessors and aliased attributes.

    ```Ruby
    class TestClass
      # bad
      class << self
        def first_method
          # body omitted
        end

        def second_method_etc
          # body omitted
        end
      end

      # good
      class << self
        attr_accessor :per_page
        alias_method :nwo, :find_by_name_with_owner
      end

      def self.first_method
        # body omitted
      end

      def self.second_method_etc
        # body omitted
      end
    end
    ```



## Exceptions

* Don't use exceptions for flow of control.

    ```Ruby
    # bad
    begin
      n / d
    rescue ZeroDivisionError
      puts "Cannot divide by 0!"
    end

    # good
    if d.zero?
      puts "Cannot divide by 0!"
    else
      n / d
    end
    ```

* Avoid rescuing the `Exception` class.

    ```Ruby
    # bad
    begin
      # an exception occurs here
    rescue
      # exception handling
    end

    # still bad
    begin
      # an exception occurs here
    rescue Exception
      # exception handling
    end
    ```

## Collections


* Prefer `%w` to the literal array syntax when you need an array of
words(non-empty strings without spaces and special characters in them).
Apply this rule only to arrays with two or more elements.

    ```Ruby
    # bad
    STATES = ["draft", "open", "closed"]

    # good
    STATES = %w(draft open closed)
    ```

* Use symbols instead of strings as hash keys.

* Always use the hash literal syntax when your hash keys are symbols.

    ```Ruby
    # bad
    hash = { :one => 1, :two => 2, :three => 3 }

    # good
    hash = { one: 1, two: 2, three: 3 }
    ```


## Strings

* Prefer string interpolation instead of string concatenation:

    ```Ruby
    # bad
    email_with_name = user.name + " <" + user.email + ">"

    # good
    email_with_name = "#{user.name} <#{user.email}>"
    ```

* Prefer double-quoted strings. Interpolation and escaped characters will always work without a delimiter change, and `'` is a lot more common than `"` in string literals.

    ```Ruby
    # bad
    name = 'Bozhidar'

    # good
    name = "Bozhidar"
    ```

* Avoid using `String#+` when you need to construct large data chunks.
  Instead, use `String#<<`. Concatenation mutates the string instance in-place
  and is always faster than `String#+`, which creates a bunch of new string objects.

    ```Ruby
    # good and also fast
    html = ""
    html << "<h1>Page title</h1>"

    paragraphs.each do |paragraph|
      html << "<p>#{paragraph}</p>"
    end
    ```

## Regular Expressions

* Avoid using $1-9 as it can be hard to track what they contain. Named groups
  can be used instead.

    ```Ruby
    # bad
    /(regexp)/ =~ string
    ...
    process Regexp.last_match[1]

    # good
    /(?<meaningful_var>regexp)/ =~ string
    ...
    process meaningful_var
    ```

* Be careful with `^` and `$` as they match start/end of line, not string endings.
  If you want to match the whole string use: `\A` and `\z` (not to be
  confused with `\Z` which is the equivalent of `/\n?\z/`).

    ```Ruby
    string = "some injection\nusername"
    string[/^username$/]   # matches
    string[/\Ausername\z/] # don't match
    ```

* Use `x` modifier for complex regexps. This makes them more readable and you
  can add some useful comments. Just be careful as spaces are ignored.

    ```Ruby
    regexp = %r{
      start         # some text
      \s            # white space char
      (group)       # first group
      (?:alt1|alt2) # some alternation
      end
    }x
    ```

* For complex replacements `sub`/`gsub` can be used with block or hash.

## Percent Literals

* Use `%()`(it's a shorthand for `%Q`) for single-line strings which require both interpolation
  and embedded double-quotes. For multi-line strings, prefer heredocs.

    ```Ruby
    # bad (no interpolation needed)
    %(<div class="text">Some text</div>)
    # should be "<div class="text">Some text</div>"

    # bad (no double-quotes)
    %(This is #{quality} style)
    # should be "This is #{quality} style"

    # bad (multiple lines)
    %(<div>\n<span class="big">#{exclamation}</span>\n</div>)
    # should be a heredoc.

    # good (requires interpolation, has quotes, single line)
    %(<tr><td class="name">#{name}</td>)
    ```

* Use `%r` only for regular expressions matching *more than* one "/" character.

    ```Ruby
    # bad
    %r(\s+)

    # still bad
    %r(^/(.*)$)
    # should be /^\/(.*)$/

    # good
    %r(^/blog/2011/(.*)$)
    ```


## Specs

* Always write specs before you write your code

* Follow the guidelines from [betterspecs.org](http://betterspecs.org/)
