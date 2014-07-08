# Prelude

If you're into Rails you might want to check out the
complementary.
[Ruby on Rails 3 & 4 Style Guide](https://github.com/bbatsov/rails-style-guide).

# The Ruby Style Guide

* Use `UTF-8` as the source file encoding.
* Use two **spaces** per indentation level (aka soft tabs). No hard tabs.

  ```Ruby
  # bad - four spaces
  def some_method
      do_something
  end

  # good
  def some_method
    do_something
  end
  ```

* Limit lines to 80 characters.

* Avoid trailing whitespace.

* End each file with a newline.

* Use Unix-style line endings. (*BSD/Solaris/Linux/OS X users are covered by default,
  Windows users have to be extra careful.)
  * If you're using Git you might want to add the following
    configuration setting to protect your project from Windows line
    endings creeping in:

    ```bash
    $ git config --global core.autocrlf true
    ```

* Don't use `;` to separate statements and expressions. As a
  corollary - use one expression per line.

  ```Ruby
  # bad
  puts 'foobar'; # superfluous semicolon

  puts 'foo'; puts 'bar' # two expressions on the same line

  # good
  puts 'foobar'

  puts 'foo'
  puts 'bar'

  puts 'foo', 'bar' # this applies to puts in particular
  ```

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

* Avoid single-line methods. Although they are somewhat popular in the
  wild, there are a few peculiarities about their definition syntax
  that make their use undesirable. At any rate - there should be no more
  than one expression in a single-line method.

  ```Ruby
  # bad
  def too_much; something; something_else; end

  # okish - notice that the first ; is required
  def no_braces_method; body end

  # okish - notice that the second ; is optional
  def no_braces_method; body; end

  # okish - valid syntax, but no ; makes it kind of hard to read
  def some_method() body end

  # good
  def some_method
    body
  end
  ```

  One exception to the rule are empty-body methods.

  ```Ruby
  # good
  def no_op; end
  ```

* Use spaces around operators, after commas, colons and semicolons, around `{`
  and before `}`. Whitespace might be (mostly) irrelevant to the Ruby
  interpreter, but its proper use is the key to writing easily
  readable code.

  ```Ruby
  sum = 1 + 2
  a, b = 1, 2
  [1, 2, 3].each { |e| puts e }
  class FooError < StandardError; end
  ```

  The only exception, regarding operators, is the exponent operator:

  ```Ruby
  # bad
  e = M * c ** 2

  # good
  e = M * c**2
  ```

  `{` and `}` deserve a bit of clarification, since they are used
  for block and hash literals, as well as embedded expressions in
  strings. For hash literals, no space after and before `{` and `}`,
  respectively.

  ```Ruby
  # bad - space after { and before }
  { one: 1, two: 2 }

  # good - no space after { and before }
  {one: 1, two: 2}
  ```

  As far as embedded expressions go, spaces before and after are unacceptable

  ```Ruby
  # good - no spaces
  "string#{expr}"

  # bad - spaces
  "string#{ expr }"
  ```

* No spaces after `(`, `[` or before `]`, `)`.

  ```Ruby
  some(arg).other
  [1, 2, 3].size
  ```

* No space after `!`.

  ```Ruby
  # bad
  ! something

  # good
  !something
  ```

* Indent `when` as deep as `case`. I know that many would disagree
  with this one, but it's the style established in both "The Ruby
  Programming Language" and "Programming Ruby".

  ```Ruby
  # bad
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

  # good
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
  ```

* When assigning the result of a conditional expression to a variable, preserve
  the usual alignment of its branches.

  ```Ruby
  # bad - pretty convoluted
  kind = case year
    when 1850..1889 then 'Blues'
    when 1890..1909 then 'Ragtime'
    when 1910..1929 then 'New Orleans Jazz'
    when 1930..1939 then 'Swing'
    when 1940..1950 then 'Bebop'
    else 'Jazz'
    end

  result = if some_cond
    calc_something
  else
    calc_something_else
  end

  # bad - whitespace isn't free when you only have 80 characters.
  kind = case year
         when 1850..1889 then 'Blues'
         when 1890..1909 then 'Ragtime'
         when 1910..1929 then 'New Orleans Jazz'
         when 1930..1939 then 'Swing'
         when 1940..1950 then 'Bebop'
         else 'Jazz'
         end

  result = if some_cond
             calc_something
           else
             calc_something_else
           end

  # good (and a bit more width efficient)
  kind = case year
  when 1850..1889 then 'Blues'
  when 1890..1909 then 'Ragtime'
  when 1910..1929 then 'New Orleans Jazz'
  when 1930..1939 then 'Swing'
  when 1940..1950 then 'Bebop'
  else 'Jazz'
  end

  result = if some_cond
    calc_something
  else
    calc_something_else
  end
  ```

* Use empty lines between method definitions and also to break up a method
  into logical paragraphs internally.

  ```Ruby
  # bad
  def some_method
    data = initialize(options)
    data.manipulate!
    data.result
  end
  def some_method
    result
  end

  # good
  def some_method
    data = initialize(options)

    data.manipulate!

    data.result
  end

  def some_method
    result
  end
  ```

* Avoid comma after the last parameter in a method call, especially when the
  parameters are not on separate lines.

  ```Ruby
  # bad - easier to move/add/remove parameters, but still not preferred
  some_method(
               size,
               count,
               color,
             )

  # bad
  some_method(size, count, color, )

  # good
  some_method(size, count, color)
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

  long_string = 'First part of the long string' \
                ' and second part of the long string'

  ```

* When continuing a chained method invocation on
  another line keep the `.` on the second line.

  ```Ruby
  # bad - need to consult first line to understand second line
  one.two.three.
    four

  # good - it's immediately clear what's going on the second line
  one.two.three
    .four
  ```

* Align the parameters of a method call if they span more than one
  line. When aligning parameters is not appropriate due to line-length
  constraints, single indent for the lines after the first is also
  acceptable.

  ```Ruby
  # starting point (line is too long)
  def send_mail(source)
    Mailer.deliver(to: 'bob@example.com', from: 'us@example.com', subject: 'Important message', body: source.text)
  end

  # bad (double indent)
  def send_mail(source)
    Mailer.deliver(
        to: 'bob@example.com',
        from: 'us@example.com',
        subject: 'Important message',
        body: source.text)
  end

  # bad - wastes whitespace
  def send_mail(source)
    Mailer.deliver(to: 'bob@example.com',
                   from: 'us@example.com',
                   subject: 'Important message',
                   body: source.text)
  end

  # good (normal indent)
  def send_mail(source)
    Mailer.deliver(
      to: 'bob@example.com',
      from: 'us@example.com',
      subject: 'Important message',
      body: source.text
    )
  end
  ```

* Align the elements of array literals spanning multiple lines.

  ```Ruby
  # bad - brackets/parentheses should be on separate line
  menu_item = ['Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
    'Baked beans', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam']

  # bad
  menu_item =
    ['Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
     'Baked beans', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam']

  # good
  menu_item = [
    'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
    'Baked beans', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam'
  ]
  ```

* Add underscores to large numeric literals to improve their readability.

  ```Ruby
  # bad - how many 0s are there?
  num = 1000000

  # good - much easier to parse for the human brain
  num = 1_000_000
  ```
* Don't use block comments. They cannot be preceded by whitespace and are not
  as easy to spot as regular comments.

  ```Ruby
  # bad
  =begin
  comment line
  another comment line
  =end

  # good
  # comment line
  # another comment line
  ```

* Use common sense.


## All Other Concerns

Should be addressed by a linting tool.


![Creative Commons License](http://i.creativecommons.org/l/by/3.0/88x31.png)
This work is licensed under a [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/deed.en_US)



Original by [Bozhidar](https://twitter.com/bbatsov)
