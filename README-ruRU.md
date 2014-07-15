# Вступление

> Role models are important. <br/>
> -- Офицер Алекс Мёрфи / Робот-полицейский

Один из вопросов, который меня всегда беспокоил как разработчика на Руби, &mdash; это то,
что у разработчиков на Питоне есть великолепное руководству по стилю оформления
([PEP-8](http://www.python.org/dev/peps/pep-0008/)), а у нас
никогда не было официального руководства, описывавшего бы стиль оформления кода на Руби
и дающего примеры его успешного применения. Я же уверен, что стиль оформления крайне важен.
Также я верю, что такое замечательное сообщество разработчиков, которое есть у Руби,
вполне имеет силы создать этот давно назревший документ.

Это наставление появилось на свет в нашей фирме в виде  внутреннего руководства
по оформлению кода на Руби (составленного вашим покорным слугой). И в какой-то момент я решил,
что данная работа, которой я тогда занимался, может быть интересной и другим членам сообщества
программистов на Руби и что миру вовсе не нужно еще одно руководство для внутреннего пользования:
окружающий мир может получить пользу от совместно создаваемого и одобренного сообществом
набора практик, идиом и стилистических предписаний для программирования на Руби.

Со времени опубликования этого руководства я получил многочисленные отклики от членов сообщества
программистов на Руби из разных уголков со всего мира. Я очень благодарен им за полезные
предложения и поддержку! Нашими общими усилиями мы сможем сделать этот ресурс полезным
для всех и каждого разработчика на Руби.

И кстати, если вы работаете с Rails, вы можете взглянуть на дополняющее это руководство
[Ruby on Rails 3 & 4: Руководство по стилю оформления](https://github.com/bbatsov/rails-style-guide).

# Руби: руководство по стилю оформления

Это руководство по оформлению кода на Руби дает передовые рекомендации, так что
обычный программист на Руби сможет создавать код, который с легкостью смогут поддерживать
другие обычные программисты на Руби. Руководство по оформлению, которое отражает повседневную
практику, будет применяться постоянно, а руководство, стремящееся к идеалу, который не принимается
обычными людьми, подвергается риску вообще быть забытым &mdash; не важно, насколько хорошим оно
является.

Данное руководство разделено на несколько частей, состоящий из связанных по смыслу правил.
В каждом случае я попытался обосновать появление этих правил (объяснение опущено в ситуациях,
когда я посчитал его очевидным).

Все эти правила не появились из пустоты, они по большей части основываются на моем собственном
обширном профессиональном опыте в качестве разработчика ПО, отзывах и предложениях других членов
сообщества программистов на Руби и различных общепризнанных источниках по программированию на Руби,
например, ["Programming Ruby 1.9"](http://pragprog.com/book/ruby4/programming-ruby-1-9-2-0)
и ["Язык программирования Ruby"](http://www.ozon.ru/context/detail/id/5704300/)(в оригинале
 ["The Ruby Programming Language"](http://www.amazon.com/Ruby-Programming-Language-David-Flanagan/dp/0596516177)).

Во многих областях до сих пор нет единого мнения в среде разработчиков на Руби относительно
конкретных аспектов стиля оформления (например, оформление строк в кавычках, пробелы при оформлении
хешей, месторасположение точки при многострочном последовательном вызове методов и т.д.).
В таких ситуациях мы рассматривали все распространенные стили, вам же решать, какой из этих стилей
вы будете применять последовательно в вашем коде.

Это руководство все еще находится в процессе создания: у многих правил нет примеров,
у других нет примеров, достаточно ясно объясняющих эти правила. В свое время каждое правило
найдет свое объяснение, а пока просто примите их к сведению.

Вы можете создать копию этого руководства в форматах PDF или HTML при помощи
[Transmuter](https://github.com/TechnoGate/transmuter).

[RuboCop](https://github.com/bbatsov/rubocop) &mdash; это анализатор кода,
основывающийся на правилах этого руководства по оформлению.

Переводы данного руководства доступны на следующих языках:

* [английский (исходная версия)](https://github.com/bbatsov/ruby-style-guide/blob/master/README.md)
* [вьетнамский](https://github.com/scrum2b/ruby-style-guide/blob/master/README-viVN.md)
* [испанский](https://github.com/alemohamad/ruby-style-guide/blob/master/README-esLA.md)
* [китайский традиционный](https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhTW.md)
* [китайский упрощенный](https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhCN.md)
* [французский](https://github.com/porecreat/ruby-style-guide/blob/master/README-frFR.md)
* [португальский](https://github.com/rubensmabueno/ruby-style-guide/blob/master/README-PT-BR.md)
* [русский (данный документ)](https://github.com/arbox/ruby-style-guide/blob/master/README-ruRU.md)
* [японский](https://github.com/fortissimo1997/ruby-style-guide/blob/japanese/README.ja.md)

## Оглавление

* [Организация исходного кода](#Организация-исходного-кода)
* [Синтаксис](#Синтаксис)
* [Наименование](#Hаименование)
* [Комментарии](#Комментарии)
  * [Пометки в комментариях](#Пометки-в-комментариях)
* [Классы и модули](#Классы-и-модули)
* [Исключения](#Исключения)
* [Коллекции](#Коллекции)
* [Строки](#Строки)
* [Регулярные выражения](#Регулярные-выражения)
* [Процентные литералы](#Процентные-литералы)
* [Метапрограммирование](#Метапрограммирование)
* [Разное](#Разное)
* [Инструментарий](#Инструментарий)

## Организация исходного кода

> Nearly everybody is convinced that every style but their own is
> ugly and unreadable. Leave out the "but their own" and they're
> probably right... <br/>
> -- Jerry Coffin (on indentation)

* Используйте `UTF-8` в качестве кодировке для исходного кода.
* Используйте два **пробела** на уровень отступа (т.е. мягкую табуляцию). Никаких знаков табуляции.

  ```Ruby
  # плохо (четыре пробела)
  def some_method
      do_something
  end

  # хорошо
  def some_method
    do_something
  end
  ```

* Используйте стиль Unix для строк. (пользователи *BSD/Solaris/Linux/OS X используют их по умолчанию,
  пользователям Windows нужно обратить особое внимание.)
  * Если вы используете Git, вы можете добавить следующие настройки
    в вашу конфигурацию, чтобы предотвратить намеренное проникновение в ваш код
    строк, оканчивающихся в стиле Windows:

    ```bash
    $ git config --global core.autocrlf true
    ```

* Не используйте `;` для разделения директив и выражений. Отсюда непосредсвенно следует,
  что каждая директива должна занимать свою отдельную строку.

  ```Ruby
  # плохо (точка с запятой избыточна)
  puts 'foobar';

  puts 'foo'; puts 'bar' # две директивы на одной строке

  # хорошо
  puts 'foobar'

  puts 'foo'
  puts 'bar'

  puts 'foo', 'bar' # это частное правило для `puts`
  ```

* Используйте преимущественно однострочный формат для определений классов с пустым телом.

  ```Ruby
  # плохо
  class FooError < StandardError
  end

  # сносно
  class FooError < StandardError; end

  # хорошо
  FooError = Class.new(StandardError)
  ```

* Избегайте однострочных методов. И хотя они достаточно популярны в среде
  программистов, существует множество неприятных мелочей, связанных с синтаксисом их
  определения, которые делают применение таких методов нежелательным. В любом случае
  однострочные методы не должны содержать больше одного выражения.


  ```Ruby
  # плохо
  def too_much; something; something_else; end

  # сносно (обратите внимание, что первая `;` обязательна)
  def no_braces_method; body end

  # сносно (обратите внимание, что вторая `;` опциональна)
  def no_braces_method; body; end

  # сносно (корректный синтаксис, но отсутствие `;` создает трудности при прочтении)
  def some_method() body end

  # хорошо
  def some_method
    body
  end
  ```

  Одним исключение в этом правиле являются методы с пустым телом.

  ```Ruby
  # хорошо
  def no_op; end
  ```

* Вставляйте пробелы вокруг операторов, после запятых, двоеточий и точек с запятыми,
  вокруг `{` и перед `}`. Пробелы (по большей части) игнорируются интерпретатором Руби, но
  их правильное использование является ключом к написанию легко читаемого кода.

  ```Ruby
  sum = 1 + 2
  a, b = 1, 2
  [1, 2, 3].each { |e| puts e }
  class FooError < StandardError; end
  ```

  Единственным исключением для операторов является оператор степени:

  ```Ruby
  # плохо
  e = M * c ** 2

  # хорошо
  e = M * c**2
  ```

  `{` и `}` заслуживают некоторого пояснения, так как они используются
  для блоков и для литералов хешей, а также для включаемых в строки
  выражений.

  Для литералов хешей два стиля являются общепринятыми:

  ```Ruby
  # хорошо (пробел после { и до })
  { one: 1, two: 2 }

  # хорошо (пробелы отсутствуют после { и перед })
  {one: 1, two: 2}
  ```

  Первый вариант несколько проще для чтения и, по всей вероятности,
  более распространен среди членов сообщества программистов на Руби.
  Второй вариант имеет преимущество в том, что создается видимое различие
  между блоками и литералами хешей. Какой бы стиль вы ни выбрали, применяйте
  его единообразно.
  
  В случае включаемых в строки выражений существует также два приемлемых
  варианта:

  ```Ruby
  # хорошо (без пробелов)
  "string#{expr}"

  # ok (наверное, читается лучше)
  "string#{ expr }"
  ```

  Стиль первого примера гораздо более популярен, и вам следует в целом
  придерживаться именно его. С другой стороны, второй пример, вероятно,
  будет прочитан легче. Как и в случает с хешами, выберите один стиль
  и применяется его последовательно.

* Не используйте пробел после `(`, `[` или перед `]`, `)`.

  ```Ruby
  some(arg).other
  [1, 2, 3].size
  ```

* Не используйте пробел после `!`.

  ```Ruby
  # плохо
  ! something

  # хорошо
  !something
  ```

* Делайте отступ для `when` таким же, как и для `case`. Я знаю, что многие не согласятся
  с этим, то этот стиль предписывается как "Языком программирования Ruby",
  так и "Programming Ruby".

  ```Ruby
  # плохо
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

  # хорошо
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

* Присваивая результат условного выражения переменной, сохраняйте соответствие уровней отступа.

  ```Ruby
  # плохо (слишком запутано)
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

  # хорошо (намерения очевидны)
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

  # хорошо (и не так расточительно)
  kind =
    case year
    when 1850..1889 then 'Blues'
    when 1890..1909 then 'Ragtime'
    when 1910..1929 then 'New Orleans Jazz'
    when 1930..1939 then 'Swing'
    when 1940..1950 then 'Bebop'
    else 'Jazz'
    end

  result =
    if some_cond
      calc_something
    else
      calc_something_else
    end
  ```

* Используйте пустые строки для разделения определений методов и выделения
  логических частей определений внутри них.

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

* Avoid comma after the last parameter in a method call, especially when the
  parameters are not on separate lines.

  ```Ruby
  # плохо - easier to move/add/remove parameters, but still not preferred
  some_method(
               size,
               count,
               color,
             )

  # плохо
  some_method(size, count, color, )

  # хорошо
  some_method(size, count, color)
  ```

* Use spaces around the `=` operator when assigning default values to method parameters:

  ```Ruby
  # плохо
  def some_method(arg1=:default, arg2=nil, arg3=[])
    # do something...
  end

  # хорошо
  def some_method(arg1 = :default, arg2 = nil, arg3 = [])
    # do something...
  end
  ```

  While several Ruby books suggest the first style, the second is much more prominent
  in practice (and arguably a bit more readable).

* Avoid line continuation `\` where not required. In practice, avoid using
  line continuations for anything but string concatenation.

  ```Ruby
  # плохо
  result = 1 - \
           2

  # хорошо (but still ugly as hell)
  result = 1 \
           - 2

  long_string = 'First part of the long string' \
                ' and second part of the long string'
  ```

* Adopt a consistent multi-line method chaining style. There are two
  popular styles in the Ruby community, both of which are considered
  good - leading `.` (Option A) and trailing `.` (Option B).

  * **(Option A)** When continuing a chained method invocation on
    another line keep the `.` on the second line.

    ```Ruby
    # плохо - need to consult first line to understand second line
    one.two.three.
      four

    # хорошо - it's immediately clear what's going on the second line
    one.two.three
      .four
    ```

  * **(Option B)** When continuing a chained method invocation on another line,
    include the `.` on the first line to indicate that the
    expression continues.

    ```Ruby
    # плохо - need to read ahead to the second line to know that the chain continues
    one.two.three
      .four

    # хорошо - it's immediately clear that the expression continues beyond the first line
    one.two.three.
      four
    ```

  A discussion on the merits of both alternative styles can be found
  [here](https://github.com/bbatsov/ruby-style-guide/pull/176).

* Align the parameters of a method call if they span more than one
  line. When aligning parameters is not appropriate due to line-length
  constraints, single indent for the lines after the first is also
  acceptable.

  ```Ruby
  # starting point (line is too long)
  def send_mail(source)
    Mailer.deliver(to: 'bob@example.com', from: 'us@example.com', subject: 'Important message', body: source.text)
  end

  # плохо (double indent)
  def send_mail(source)
    Mailer.deliver(
        to: 'bob@example.com',
        from: 'us@example.com',
        subject: 'Important message',
        body: source.text)
  end

  # хорошо
  def send_mail(source)
    Mailer.deliver(to: 'bob@example.com',
                   from: 'us@example.com',
                   subject: 'Important message',
                   body: source.text)
  end

  # хорошо (normal indent)
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
  # плохо - single indent
  menu_item = ['Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
    'Baked beans', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam']

  # хорошо
  menu_item = [
    'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
    'Baked beans', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam'
  ]

  # хорошо
  menu_item =
    ['Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
     'Baked beans', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam']
  ```

* Add underscores to large numeric literals to improve their readability.

  ```Ruby
  # плохо - how many 0s are there?
  num = 1000000

  # хорошо - much easier to parse for the human brain
  num = 1_000_000
  ```

* Use RDoc and its conventions for API documentation.  Don't put an
  empty line between the comment block and the `def`.

* Limit lines to 80 characters.

* Avoid trailing whitespace.

* End each file with a newline.

* Don't use block comments. They cannot be preceded by whitespace and are not
  as easy to spot as regular comments.

  ```Ruby
  # плохо
  =begin
  comment line
  another comment line
  =end

  # хорошо
  # comment line
  # another comment line
  ```

## Синтаксис

* Используйте `::` только для обращения к константам (в том числе к классам и модулям)
  и конструкторам класса (например, `Array()` or `Nokogiri::HTML()`).
  Никогда не используйте `::` для обычного вызова методов.

  ```Ruby
  # плохо
  SomeClass::some_method
  some_object::some_method

  # хорошо
  SomeClass.some_method
  some_object.some_method
  SomeModule::SomeClass::SOME_CONST
  SomeModule::SomeClass()
  ```

* Используйте `def` со скобками, когда у метода есть аргументы. Опускайте скобки
  когда метод не принимает аргументов.

   ```Ruby
   # плохо
   def some_method()
     # body omitted
   end

   # хорошо
   def some_method
     # body omitted
   end

   # плохо
   def some_method_with_arguments arg1, arg2
     # body omitted
   end

   # хорошо
   def some_method_with_arguments(arg1, arg2)
     # body omitted
   end
   ```

* Never use `for`, unless you know exactly why. Most of the time iterators
  should be used instead. `for` is implemented in terms of `each` (so
  you're adding a level of indirection), but with a twist - `for`
  doesn't introduce a new scope (unlike `each`) and variables defined
  in its block will be visible outside it.

  ```Ruby
  arr = [1, 2, 3]

  # плохо
  for elem in arr do
    puts elem
  end

  # note that elem is accessible outside of the for loop
  elem #=> 3

  # хорошо
  arr.each { |elem| puts elem }

  # elem is not accessible outside each's block
  elem #=> NameError: undefined local variable or method `elem'
  ```

* Never use `then` for multi-line `if/unless`.

  ```Ruby
  # плохо
  if some_condition then
    # body omitted
  end

  # хорошо
  if some_condition
    # body omitted
  end
  ```

* Always put the condition on the same line as the `if`/`unless` in a multi-line conditional.

  ```Ruby
  # плохо
  if
    some_condition
    do_something
    do_something_else
  end

  # хорошо
  if some_condition
    do_something
    do_something_else
  end
  ```

* Favor the ternary operator(`?:`) over `if/then/else/end` constructs.
  It's more common and obviously more concise.

  ```Ruby
  # плохо
  result = if some_condition then something else something_else end

  # хорошо
  result = some_condition ? something : something_else
  ```

* Use one expression per branch in a ternary operator. This
  also means that ternary operators must not be nested. Prefer
  `if/else` constructs in these cases.

  ```Ruby
  # плохо
  some_condition ? (nested_condition ? nested_something : nested_something_else) : something_else

  # хорошо
  if some_condition
    nested_condition ? nested_something : nested_something_else
  else
    something_else
  end
  ```

* Never use `if x: ...` - as of Ruby 1.9 it has been removed. Use
  the ternary operator instead.

  ```Ruby
  # плохо
  result = if some_condition: something else something_else end

  # хорошо
  result = some_condition ? something : something_else
  ```

* Never use `if x; ...`. Use the ternary operator instead.

* Leverage the fact that `if` and `case` are expressions which return a result.

  ```Ruby
  # плохо
  if condition
    result = x
  else
    result = y
  end

  # хорошо
  result =
    if condition
      x
    else
      y
    end
  ```

* Use `when x then ...` for one-line cases. The alternative syntax
  `when x: ...` has been removed as of Ruby 1.9.

* Never use `when x; ...`. See the previous rule.

* Use `!` instead of `not`.

  ```Ruby
  # плохо - braces are required because of op precedence
  x = (not something)

  # хорошо
  x = !something
  ```

* Avoid the use of `!!`.

  ```Ruby
  # плохо
  x = 'test'
  # obscure nil check
  if !!x
    # body omitted
  end

  x = false
  # double negation is useless on booleans
  !!x # => false

  # хорошо
  x = 'test'
  unless x.nil?
    # body omitted
  end
  ```

* The `and` and `or` keywords are banned. It's just not worth
  it. Always use `&&` and `||` instead.

  ```Ruby
  # плохо
  # boolean expression
  if some_condition and some_other_condition
    do_something
  end

  # control flow
  document.saved? or document.save!

  # хорошо
  # boolean expression
  if some_condition && some_other_condition
    do_something
  end

  # control flow
  document.saved? || document.save!
  ```

* Avoid multi-line `?:` (the ternary operator); use `if/unless` instead.

* Favor modifier `if/unless` usage when you have a single-line
  body. Another good alternative is the usage of control flow `&&/||`.

  ```Ruby
  # плохо
  if some_condition
    do_something
  end

  # хорошо
  do_something if some_condition

  # another good option
  some_condition && do_something
  ```

* Avoid modifier `if/unless` usage at the end of a
  non-trivial multi-line block.

  ```Ruby
  # плохо
  10.times do
    # multi-line body omitted
  end if some_condition

  # хорошо
  if some_condition
    10.times do
      # multi-line body omitted
    end
  end
  ```

* Favor `unless` over `if` for negative conditions (or control
  flow `||`).

  ```Ruby
  # плохо
  do_something if !some_condition

  # плохо
  do_something if not some_condition

  # хорошо
  do_something unless some_condition

  # another good option
  some_condition || do_something
  ```

* Never use `unless` with `else`. Rewrite these with the positive case first.

  ```Ruby
  # плохо
  unless success?
    puts 'failure'
  else
    puts 'success'
  end

  # хорошо
  if success?
    puts 'success'
  else
    puts 'failure'
  end
  ```

* Don't use parentheses around the condition of an `if/unless/while/until`.

  ```Ruby
  # плохо
  if (x > 10)
    # body omitted
  end

  # хорошо
  if x > 10
    # body omitted
  end
  ```

* Never use `while/until condition do` for multi-line `while/until`.

  ```Ruby
  # плохо
  while x > 5 do
    # body omitted
  end

  until x > 5 do
    # body omitted
  end

  # хорошо
  while x > 5
    # body omitted
  end

  until x > 5
    # body omitted
  end
  ```

* Favor modifier `while/until` usage when you have a single-line
  body.

  ```Ruby
  # плохо
  while some_condition
    do_something
  end

  # хорошо
  do_something while some_condition
  ```

* Favor `until` over `while` for negative conditions.

  ```Ruby
  # плохо
  do_something while !some_condition

  # хорошо
  do_something until some_condition
  ```

* Use `Kernel#loop` instead of `while/until` when you need an infinite loop.

    ```ruby
    # плохо
    while true
      do_something
    end

    until false
      do_something
    end

    # хорошо
    loop do
      do_something
    end
    ```

* Use `Kernel#loop` with `break` rather than `begin/end/until` or `begin/end/while` for post-loop tests.

  ```Ruby
  # плохо
  begin
    puts val
    val += 1
  end while val < 0

  # хорошо
  loop do
    puts val
    val += 1
    break unless val < 0
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

  temperance = Person.new('Temperance', 30)
  temperance.name

  puts temperance.age

  x = Math.sin(y)
  array.delete(e)

  bowling.score.should == 0
  ```

* Omit the outer braces around an implicit options hash.

  ```Ruby
  # плохо
  user.set({ name: 'John', age: 45, permissions: { read: true } })

  # хорошо
  user.set(name: 'John', age: 45, permissions: { read: true })
  ```

* Omit both the outer braces and parentheses for methods that are
  part of an internal DSL.

  ```Ruby
  class Person < ActiveRecord::Base
    # плохо
    validates(:name, { presence: true, length: { within: 1..10 } })

    # хорошо
    validates :name, presence: true, length: { within: 1..10 }
  end
  ```

* Omit parentheses for method calls with no arguments.

  ```Ruby
  # плохо
  Kernel.exit!()
  2.even?()
  fork()
  'test'.upcase()

  # хорошо
  Kernel.exit!
  2.even?
  fork
  'test'.upcase
  ```

* Prefer `{...}` over `do...end` for single-line blocks.  Avoid using
  `{...}` for multi-line blocks (multiline chaining is always
  ugly). Always use `do...end` for "control flow" and "method
  definitions" (e.g. in Rakefiles and certain DSLs).  Avoid `do...end`
  when chaining.

  ```Ruby
  names = ['Bozhidar', 'Steve', 'Sarah']

  # плохо
  names.each do |name|
    puts name
  end

  # хорошо
  names.each { |name| puts name }

  # плохо
  names.select do |name|
    name.start_with?('S')
  end.map { |name| name.upcase }

  # хорошо
  names.select { |name| name.start_with?('S') }.map { |name| name.upcase }
  ```

  Some will argue that multiline chaining would look OK with the use of {...}, but they should
  ask themselves - is this code really readable and can the blocks' contents be extracted into
  nifty methods?

* Consider using explicit block argument to avoid writing block
  literal that just passes its arguments to another block. Beware of
  the performance impact, though, as the block gets converted to a
  Proc.

  ```Ruby
  require 'tempfile'

  # плохо
  def with_tmp_dir
    Dir.mktmpdir do |tmp_dir|
      Dir.chdir(tmp_dir) { |dir| yield dir }  # block just passes arguments
    end
  end

  # хорошо
  def with_tmp_dir(&block)
    Dir.mktmpdir do |tmp_dir|
      Dir.chdir(tmp_dir, &block)
    end
  end

  with_tmp_dir do |dir|
    puts "dir is accessible as a parameter and pwd is set: #{dir}"
  end
  ```

* Avoid `return` where not required for flow of control.

  ```Ruby
  # плохо
  def some_method(some_arr)
    return some_arr.size
  end

  # хорошо
  def some_method(some_arr)
    some_arr.size
  end
  ```

* Avoid `self` where not required. (It is only required when calling a self write accessor.)

  ```Ruby
  # плохо
  def ready?
    if self.last_reviewed_at > self.last_updated_at
      self.worker.update(self.content, self.options)
      self.status = :in_progress
    end
    self.status == :verified
  end

  # хорошо
  def ready?
    if last_reviewed_at > last_updated_at
      worker.update(content, options)
      self.status = :in_progress
    end
    status == :verified
  end
  ```

* As a corollary, avoid shadowing methods with local variables unless they are both equivalent.

  ```Ruby
  class Foo
    attr_accessor :options

    # ok
    def initialize(options)
      self.options = options
      # both options and self.options are equivalent here
    end

    # плохо
    def do_something(options = {})
      unless options[:when] == :later
        output(self.options[:message])
      end
    end

    # хорошо
    def do_something(params = {})
      unless params[:when] == :later
        output(options[:message])
      end
    end
  end
  ```

* Don't use the return value of `=` (an assignment) in conditional
  expressions unless the assignment is wrapped in parentheses. This is
  a fairly popular idiom among Rubyists that's sometimes referred to as
  *safe assignment in condition*.

  ```Ruby
  # плохо (+ a warning)
  if v = array.grep(/foo/)
    do_something(v)
    ...
  end

  # хорошо (MRI would still complain, but RuboCop won't)
  if (v = array.grep(/foo/))
    do_something(v)
    ...
  end

  # хорошо
  v = array.grep(/foo/)
  if v
    do_something(v)
    ...
  end
  ```

* Use shorthand self assignment operators whenever applicable.

  ```Ruby
  # плохо
  x = x + y
  x = x * y
  x = x**y
  x = x / y
  x = x || y
  x = x && y

  # хорошо
  x += y
  x *= y
  x **= y
  x /= y
  x ||= y
  x &&= y
  ```

* Use `||=` to initialize variables only if they're not already initialized.

  ```Ruby
  # плохо
  name = name ? name : 'Bozhidar'

  # плохо
  name = 'Bozhidar' unless name

  # хорошо - set name to Bozhidar, only if it's nil or false
  name ||= 'Bozhidar'
  ```

* Don't use `||=` to initialize boolean variables. (Consider what
  would happen if the current value happened to be `false`.)

  ```Ruby
  # плохо - would set enabled to true even if it was false
  enabled ||= true

  # хорошо
  enabled = true if enabled.nil?
  ```

* Use `&&=` to preprocess variables that may or may not exist. Using
  `&&=` will change the value only if it exists, removing the need to
  check its existence with `if`.

  ```Ruby
  # плохо
  if something
    something = something.downcase
  end

  # плохо
  something = something ? nil : something.downcase

  # ok
  something = something.downcase if something

  # хорошо
  something = something && something.downcase

  # better
  something &&= something.downcase
  ```

* Avoid explicit use of the case equality operator `===`. As its name
  implies it is meant to be used implicitly by `case` expressions and
  outside of them it yields some pretty confusing code.

  ```Ruby
  # плохо
  Array === something
  (1..100) === 7
  /something/ === some_string

  # хорошо
  something.is_a?(Array)
  (1..100).include?(7)
  some_string =~ /something/
  ```

* Avoid using Perl-style special variables (like `$:`, `$;`,
  etc. ). They are quite cryptic and their use in anything but
  one-liner scripts is discouraged. Use the human-friendly
  aliases provided by the `English` library.

  ```Ruby
  # плохо
  $:.unshift File.dirname(__FILE__)

  # хорошо
  require 'English'
  $LOAD_PATH.unshift File.dirname(__FILE__)
  ```

* Never put a space between a method name and the opening parenthesis.

  ```Ruby
  # плохо
  f (3 + 2) + 1

  # хорошо
  f(3 + 2) + 1
  ```

* If the first argument to a method begins with an open parenthesis,
  always use parentheses in the method invocation. For example, write
  `f((3 + 2) + 1)`.

* Always run the Ruby interpreter with the `-w` option so it will warn
  you if you forget either of the rules above!

* Use the new lambda literal syntax for single line body blocks. Use the
  `lambda` method for multi-line blocks.

  ```Ruby
  # плохо
  l = lambda { |a, b| a + b }
  l.call(1, 2)

  # correct, but looks extremely awkward
  l = ->(a, b) do
    tmp = a * 7
    tmp * b / 50
  end

  # хорошо
  l = ->(a, b) { a + b }
  l.call(1, 2)

  l = lambda do |a, b|
    tmp = a * 7
    tmp * b / 50
  end
  ```

* Prefer `proc` over `Proc.new`.

  ```Ruby
  # плохо
  p = Proc.new { |n| puts n }

  # хорошо
  p = proc { |n| puts n }
  ```

* Prefer `proc.call()` over `proc[]` or `proc.()` for both lambdas and procs.

  ```Ruby
  # плохо - looks similar to Enumeration access
  l = ->(v) { puts v }
  l[1]

  # also плохо - uncommon syntax
  l = ->(v) { puts v }
  l.(1)

  # хорошо
  l = ->(v) { puts v }
  l.call(1)
  ```

* Prefix with `_` unused block parameters and local variables. It's
  also acceptable to use just `_` (although it's a bit less
  descriptive). This convention is recognized by the Ruby interpreter
  and tools like RuboCop and will suppress their unused variable warnings.

  ```Ruby
  # плохо
  result = hash.map { |k, v| v + 1 }

  def something(x)
    unused_var, used_var = something_else(x)
    # ...
  end

  # хорошо
  result = hash.map { |_k, v| v + 1 }

  def something(x)
    _unused_var, used_var = something_else(x)
    # ...
  end

  # хорошо
  result = hash.map { |_, v| v + 1 }

  def something(x)
    _, used_var = something_else(x)
    # ...
  end
  ```

* Use `$stdout/$stderr/$stdin` instead of
  `STDOUT/STDERR/STDIN`. `STDOUT/STDERR/STDIN` are constants, and
  while you can actually reassign (possibly to redirect some stream)
  constants in Ruby, you'll get an interpreter warning if you do so.

* Use `warn` instead of `$stderr.puts`. Apart from being more concise
  and clear, `warn` allows you to suppress warnings if you need to (by
  setting the warn level to 0 via `-W0`).

* Favor the use of `sprintf` and its alias `format` over the fairly
  cryptic `String#%` method.

  ```Ruby
  # плохо
  '%d %d' % [20, 10]
  # => '20 10'

  # хорошо
  sprintf('%d %d', 20, 10)
  # => '20 10'

  # хорошо
  sprintf('%{first} %{second}', first: 20, second: 10)
  # => '20 10'

  format('%d %d', 20, 10)
  # => '20 10'

  # хорошо
  format('%{first} %{second}', first: 20, second: 10)
  # => '20 10'
  ```

* Favor the use of `Array#join` over the fairly cryptic `Array#*` with
  a string argument.

  ```Ruby
  # плохо
  %w(one two three) * ', '
  # => 'one, two, three'

  # хорошо
  %w(one two three).join(', ')
  # => 'one, two, three'
  ```

* Use `[*var]` or `Array()` instead of explicit `Array` check, when dealing with a
  variable you want to treat as an Array, but you're not certain it's
  an array.

  ```Ruby
  # плохо
  paths = [paths] unless paths.is_a? Array
  paths.each { |path| do_something(path) }

  # хорошо
  [*paths].each { |path| do_something(path) }

  # хорошо (and a bit more readable)
  Array(paths).each { |path| do_something(path) }
  ```

* Use ranges or `Comparable#between?` instead of complex comparison logic when possible.

  ```Ruby
  # плохо
  do_something if x >= 1000 && x <= 2000

  # хорошо
  do_something if (1000..2000).include?(x)

  # хорошо
  do_something if x.between?(1000, 2000)
  ```

* Favor the use of predicate methods to explicit comparisons with
  `==`. Numeric comparisons are OK.

  ```Ruby
  # плохо
  if x % 2 == 0
  end

  if x % 2 == 1
  end

  if x == nil
  end

  # хорошо
  if x.even?
  end

  if x.odd?
  end

  if x.nil?
  end

  if x.zero?
  end

  if x == 0
  end
  ```

* Don't do explicit non-`nil` checks unless you're dealing with boolean values.

    ```ruby
    # плохо
    do_something if !something.nil?
    do_something if something != nil

    # хорошо
    do_something if something

    # хорошо - dealing with a boolean
    def value_set?
      !@some_boolean.nil?
    end
    ```

* Avoid the use of `BEGIN` blocks.

* Never use `END` blocks. Use `Kernel#at_exit` instead.

  ```ruby
  # плохо
  END { puts 'Goodbye!' }

  # хорошо
  at_exit { puts 'Goodbye!' }
  ```

* Avoid the use of flip-flops.

* Avoid use of nested conditionals for flow of control.

  Prefer a guard clause when you can assert invalid data. A guard clause
  is a conditional statement at the top of a function that bails out as
  soon as it can.

  ```Ruby
  # плохо
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

  # хорошо
  def compute_thing(thing)
    return unless thing[:foo]
    update_with_bar(thing[:foo])
    return re_compute(thing) unless thing[:foo][:bar]
    partial_compute(thing)
  end
  ```

  Prefer `next` in loops instead of conditional blocks.

  ```Ruby
  # плохо
  [0, 1, 2, 3].each do |item|
    if item > 1
      puts item
    end
  end

  # хорошо
  [0, 1, 2, 3].each do |item|
    next unless item > 1
    puts item
  end
  ```

## Наименование

> The only real difficulties in programming are cache invalidation and
> naming things. <br/>
> -- Phil Karlton

* Name identifiers in English.

  ```Ruby
  # плохо - identifier using non-ascii characters
  заплата = 1_000

  # плохо - identifier is a Bulgarian word, written with Latin letters (instead of Cyrillic)
  zaplata = 1_000

  # хорошо
  salary = 1_000
  ```

* Use `snake_case` for symbols, methods and variables.

  ```Ruby
  # плохо
  :'some symbol'
  :SomeSymbol
  :someSymbol

  someVar = 5

  def someMethod
    ...
  end

  def SomeMethod
   ...
  end

  # хорошо
  :some_symbol

  def some_method
    ...
  end
  ```

* Use `CamelCase` for classes and modules.  (Keep acronyms like HTTP,
  RFC, XML uppercase.)

  ```Ruby
  # плохо
  class Someclass
    ...
  end

  class Some_Class
    ...
  end

  class SomeXml
    ...
  end

  # хорошо
  class SomeClass
    ...
  end

  class SomeXML
    ...
  end
  ```

* Use `snake_case` for naming files, e.g. `hello_world.rb`.

* Use `snake_case` for naming directories, e.g. `lib/hello_world/hello_world.rb`.

* Aim to have just a single class/module per source file. Name the file name as
  the class/module, but replacing CamelCase with snake_case.

* Use `SCREAMING_SNAKE_CASE` for other constants.

  ```Ruby
  # плохо
  SomeConst = 5

  # хорошо
  SOME_CONST = 5
  ```

* The names of predicate methods (methods that return a boolean value)
  should end in a question mark.
  (i.e. `Array#empty?`). Methods that don't return a boolean, shouldn't
  end in a question mark.

* The names of potentially *dangerous* methods (i.e. methods that
  modify `self` or the arguments, `exit!` (doesn't run the finalizers
  like `exit` does), etc.) should end with an exclamation mark if
  there exists a safe version of that *dangerous* method.

  ```Ruby
  # плохо - there is no matching 'safe' method
  class Person
    def update!
    end
  end

  # хорошо
  class Person
    def update
    end
  end

  # хорошо
  class Person
    def update!
    end

    def update
    end
  end
  ```

* Define the non-bang (safe) method in terms of the bang (dangerous)
  one if possible.

  ```Ruby
  class Array
    def flatten_once!
      res = []

      each do |e|
        [*e].each { |f| res << f }
      end

      replace(res)
    end

    def flatten_once
      dup.flatten_once!
    end
  end
  ```

* When using `reduce` with short blocks, name the arguments `|a, e|`
  (accumulator, element).

* When defining binary operators, name the argument `other`(`<<` and
  `[]` are exceptions to the rule, since their semantics are different).

  ```Ruby
  def +(other)
    # body omitted
  end
  ```

* Prefer `map` over `collect`, `find` over `detect`, `select` over
  `find_all`, `reduce` over `inject` and `size` over `length`. This is
  not a hard requirement; if the use of the alias enhances
  readability, it's ok to use it. The rhyming methods are inherited from
  Smalltalk and are not common in other programming languages. The
  reason the use of `select` is encouraged over `find_all` is that it
  goes together nicely with `reject` and its name is pretty self-explanatory.

* Don't use `count` as a substitute for `size`. For `Enumerable`
  objects other than `Array` it will iterate the entire collection in
  order to determine its size.

  ```Ruby
  # плохо
  some_hash.count

  # хорошо
  some_hash.size
  ```

* Use `flat_map` instead of `map` + `flatten`.
  This does not apply for arrays with a depth greater than 2, i.e.
  if `users.first.songs == ['a', ['b','c']]`, then use `map + flatten` rather than `flat_map`.
  `flat_map` flattens the array by 1, whereas `flatten` flattens it all the way.

  ```Ruby
  # плохо
  all_songs = users.map(&:songs).flatten.uniq

  # хорошо
  all_songs = users.flat_map(&:songs).uniq
  ```

* Use `reverse_each` instead of `reverse.each`. `reverse_each` doesn't
  do a new array allocation and that's a good thing.

  ```Ruby
  # плохо
  array.reverse.each { ... }

  # хорошо
  array.reverse_each { ... }
  ```

## Комментарии

> Good code is its own best documentation. As you're about to add a
> comment, ask yourself, "How can I improve the code so that this
> comment isn't needed?" Improve the code and then document it to make
> it even clearer. <br/>
> -- Steve McConnell

* Write self-documenting code and ignore the rest of this section. Seriously!

* Write comments in English.

* Use one space between the leading `#` character of the comment and the text
  of the comment.

* Comments longer than a word are capitalized and use punctuation. Use [one
  space](http://en.wikipedia.org/wiki/Sentence_spacing) after periods.

* Avoid superfluous comments.

  ```Ruby
  # плохо
  counter += 1 # Increments counter by one.
  ```

* Keep existing comments up-to-date. An outdated comment is worse than no comment
  at all.

> Good code is like a good joke - it needs no explanation. <br/>
> -- Russ Olsen

* Avoid writing comments to explain плохо code. Refactor the code to
  make it self-explanatory. (Do or do not - there is no try. --Yoda)

### Пометки в комментариях

* Annotations should usually be written on the line immediately above
  the relevant code.

* The annotation keyword is followed by a colon and a space, then a note
  describing the problem.

* If multiple lines are required to describe the problem, subsequent
  lines should be indented two spaces after the `#`.

  ```Ruby
  def bar
    # FIXME: This has crashed occasionally since v3.2.1. It may
    #   be related to the BarBazUtil upgrade.
    baz(:quux)
  end
  ```

* In cases where the problem is so obvious that any documentation would
  be redundant, annotations may be left at the end of the offending line
  with no note. This usage should be the exception and not the rule.

  ```Ruby
  def bar
    sleep 100 # OPTIMIZE
  end
  ```

* Use `TODO` to note missing features or functionality that should be
  added at a later date.

* Use `FIXME` to note broken code that needs to be fixed.

* Use `OPTIMIZE` to note slow or inefficient code that may cause
  performance problems.

* Use `HACK` to note code smells where questionable coding practices
  were used and should be refactored away.

* Use `REVIEW` to note anything that should be looked at to confirm it
  is working as intended. For example: `REVIEW: Are we sure this is how the
  client does X currently?`

* Use other custom annotation keywords if it feels appropriate, but be
  sure to document them in your project's `README` or similar.

## Классы и модули

* Use a consistent structure in your class definitions.

  ```Ruby
  class Person
    # extend and include go first
    extend SomeModule
    include AnotherModule

    # inner classes
    CustomErrorKlass = Class.new(StandardError)

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

    # protected and private methods are grouped near the end
    protected

    def some_protected_method
    end

    private

    def some_private_method
    end
  end
  ```

* Don't nest multi line classes within classes. Try to have such nested
  classes each in their own file in a folder named like the containing class.

  ```Ruby
  # плохо

  # foo.rb
  class Foo
    class Bar
      # 30 methods inside
    end

    class Car
      # 20 methods inside
    end

    # 30 methods inside
  end

  # хорошо

  # foo.rb
  class Foo
    # 30 methods inside
  end

  # foo/bar.rb
  class Foo
    class Bar
      # 30 methods inside
    end
  end

  # foo/car.rb
  class Foo
    class Car
      # 20 methods inside
    end
  end
  ```

* Prefer modules to classes with only class methods. Classes should be
  used only when it makes sense to create instances out of them.

  ```Ruby
  # плохо
  class SomeClass
    def self.some_method
      # body omitted
    end

    def self.some_other_method
    end
  end

  # хорошо
  module SomeClass
    module_function

    def some_method
      # body omitted
    end

    def some_other_method
    end
  end
  ```

* Favor the use of `module_function` over `extend self` when you want
  to turn a module's instance methods into class methods.

  ```Ruby
  # плохо
  module Utilities
    extend self

    def parse_something(string)
      # do stuff here
    end

    def other_utility_method(number, string)
      # do some more stuff
    end
  end

  # хорошо
  module Utilities
    module_function

    def parse_something(string)
      # do stuff here
    end

    def other_utility_method(number, string)
      # do some more stuff
    end
  end
  ```

* When designing class hierarchies make sure that they conform to the
  [Liskov Substitution Principle](http://en.wikipedia.org/wiki/Liskov_substitution_principle).

* Try to make your classes as
  [SOLID](http://en.wikipedia.org/wiki/SOLID_\(object-oriented_design\))
  as possible.

* Always supply a proper `to_s` method for classes that represent
  domain objects.

  ```Ruby
  class Person
    attr_reader :first_name, :last_name

    def initialize(first_name, last_name)
      @first_name = first_name
      @last_name = last_name
    end

    def to_s
      "#{@first_name} #{@last_name}"
    end
  end
  ```

* Use the `attr` family of functions to define trivial accessors or mutators.

  ```Ruby
  # плохо
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

  # хорошо
  class Person
    attr_reader :first_name, :last_name

    def initialize(first_name, last_name)
      @first_name = first_name
      @last_name = last_name
    end
  end
  ```

* Avoid the use of `attr`. Use `attr_reader` and `attr_accessor` instead.

  ```Ruby
  # плохо - creates a single attribute accessor (deprecated in 1.9)
  attr :something, true
  attr :one, :two, :three # behaves as attr_reader

  # хорошо
  attr_accessor :something
  attr_reader :one, :two, :three
  ```

* Consider using `Struct.new`, which defines the trivial accessors,
  constructor and comparison operators for you.

  ```Ruby
  # хорошо
  class Person
    attr_accessor :first_name, :last_name

    def initialize(first_name, last_name)
      @first_name = first_name
      @last_name = last_name
    end
  end

  # better
  Person = Struct.new(:first_name, :last_name) do
  end
  ````

* Don't extend a `Struct.new` - it already is a new class. Extending it introduces
  a superfluous class level and may also introduce weird errors if the file is
  required multiple times.

* Consider adding factory methods to provide additional sensible ways
  to create instances of a particular class.

  ```Ruby
  class Person
    def self.create(options_hash)
      # body omitted
    end
  end
  ```

* Prefer [duck-typing](http://en.wikipedia.org/wiki/Duck_typing) over inheritance.

  ```Ruby
  # плохо
  class Animal
    # abstract method
    def speak
    end
  end

  # extend superclass
  class Duck < Animal
    def speak
      puts 'Quack! Quack'
    end
  end

  # extend superclass
  class Dog < Animal
    def speak
      puts 'Bau! Bau!'
    end
  end

  # хорошо
  class Duck
    def speak
      puts 'Quack! Quack'
    end
  end

  class Dog
    def speak
      puts 'Bau! Bau!'
    end
  end
  ```

* Avoid the usage of class (`@@`) variables due to their "nasty" behavior in inheritance.

  ```Ruby
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

* Assign proper visibility levels to methods (`private`, `protected`)
  in accordance with their intended usage. Don't go off leaving
  everything `public` (which is the default). After all we're coding
  in *Ruby* now, not in *Python*.

* Indent the `public`, `protected`, and `private` methods as much the
  method definitions they apply to. Leave one blank line above the
  visibility modifier
  and one blank line below in order to emphasize that it applies to all
  methods below it.

  ```Ruby
  class SomeClass
    def public_method
      # ...
    end

    private

    def private_method
      # ...
    end

    def another_private_method
      # ...
    end
  end
  ```

* Use `def self.method` to define singleton methods. This makes the code
  easier to refactor since the class name is not repeated.

  ```Ruby
  class TestClass
    # плохо
    def TestClass.some_method
      # body omitted
    end

    # хорошо
    def self.some_other_method
      # body omitted
    end

    # Also possible and convenient when you
    # have to define many singleton methods.
    class << self
      def first_method
        # body omitted
      end

      def second_method_etc
        # body omitted
      end
    end
  end
  ```

## Исключения

* Signal exceptions using the `fail` method. Use `raise` only when
  catching an exception and re-raising it (because here you're not
  failing, but explicitly and purposefully raising an exception).

  ```Ruby
  begin
    fail 'Oops'
  rescue => error
    raise if error.message != 'Oops'
  end
  ```

* Don't specify `RuntimeError` explicitly in the two argument version of `fail/raise`.

  ```Ruby
  # плохо
  fail RuntimeError, 'message'

  # хорошо - signals a RuntimeError by default
  fail 'message'
  ```

* Prefer supplying an exception class and a message as two separate
  arguments to `fail/raise`, instead of an exception instance.

  ```Ruby
  # плохо
  fail SomeException.new('message')
  # Note that there is no way to do `fail SomeException.new('message'), backtrace`.

  # хорошо
  fail SomeException, 'message'
  # Consistent with `fail SomeException, 'message', backtrace`.
  ```

* Never return from an `ensure` block. If you explicitly return from a
  method inside an `ensure` block, the return will take precedence over
  any exception being raised, and the method will return as if no
  exception had been raised at all. In effect, the exception will be
  silently thrown away.

  ```Ruby
  def foo
    begin
      fail
    ensure
      return 'very bad idea'
    end
  end
  ```

* Use *implicit begin blocks* where possible.

  ```Ruby
  # плохо
  def foo
    begin
      # main logic goes here
    rescue
      # failure handling goes here
    end
  end

  # хорошо
  def foo
    # main logic goes here
  rescue
    # failure handling goes here
  end
  ```

* Mitigate the proliferation of `begin` blocks by using
  *contingency methods* (a term coined by Avdi Grimm).

  ```Ruby
  # плохо
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

  # хорошо
  def with_io_error_handling
     yield
  rescue IOError
    # handle IOError
  end

  with_io_error_handling { something_that_might_fail }

  with_io_error_handling { something_else_that_might_fail }
  ```

* Don't suppress exceptions.

  ```Ruby
  # плохо
  begin
    # an exception occurs here
  rescue SomeError
    # the rescue clause does absolutely nothing
  end

  # плохо
  do_something rescue nil
  ```

* Avoid using `rescue` in its modifier form.

  ```Ruby
  # плохо - this catches exceptions of StandardError class and its descendant classes
  read_file rescue handle_error($!)

  # хорошо - this catches only the exceptions of Errno::ENOENT class and its descendant classes
  def foo
    read_file
  rescue Errno::ENOENT => ex
    handle_error(ex)
  end
  ```

* Don't use exceptions for flow of control.

  ```Ruby
  # плохо
  begin
    n / d
  rescue ZeroDivisionError
    puts 'Cannot divide by 0!'
  end

  # хорошо
  if d.zero?
    puts 'Cannot divide by 0!'
  else
    n / d
  end
  ```

* Avoid rescuing the `Exception` class.  This will trap signals and calls to
  `exit`, requiring you to `kill -9` the process.

  ```Ruby
  # плохо
  begin
    # calls to exit and kill signals will be caught (except kill -9)
    exit
  rescue Exception
    puts "you didn't really want to exit, right?"
    # exception handling
  end

  # хорошо
  begin
    # a blind rescue rescues from StandardError, not Exception as many
    # programmers assume.
  rescue => e
    # exception handling
  end

  # also хорошо
  begin
    # an exception occurs here

  rescue StandardError => e
    # exception handling
  end
  ```

* Put more specific exceptions higher up the rescue chain, otherwise
  they'll never be rescued from.

  ```Ruby
  # плохо
  begin
    # some code
  rescue Exception => e
    # some handling
  rescue StandardError => e
    # some handling
  end

  # хорошо
  begin
    # some code
  rescue StandardError => e
    # some handling
  rescue Exception => e
    # some handling
  end
  ```

* Release external resources obtained by your program in an ensure block.

  ```Ruby
  f = File.open('testfile')
  begin
    # .. process
  rescue
    # .. handle error
  ensure
    f.close unless f.nil?
  end
  ```

* Favor the use of exceptions for the standard library over
  introducing new exception classes.

## Коллекции

* Prefer literal array and hash creation notation (unless you need to
  pass parameters to their constructors, that is).

  ```Ruby
  # плохо
  arr = Array.new
  hash = Hash.new

  # хорошо
  arr = []
  hash = {}
  ```

* Prefer `%w` to the literal array syntax when you need an array of
  words (non-empty strings without spaces and special characters in them).
  Apply this rule only to arrays with two or more elements.

  ```Ruby
  # плохо
  STATES = ['draft', 'open', 'closed']

  # хорошо
  STATES = %w(draft open closed)
  ```

* Prefer `%i` to the literal array syntax when you need an array of
  symbols (and you don't need to maintain Ruby 1.9 compatibility). Apply
  this rule only to arrays with two or more elements.

  ```Ruby
  # плохо
  STATES = [:draft, :open, :closed]

  # хорошо
  STATES = %i(draft open closed)
  ```

* Avoid comma after the last item of an `Array` or `Hash` literal, especially
  when the items are not on separate lines.

  ```Ruby
  # плохо - easier to move/add/remove items, but still not preferred
  VALUES = [
             1001,
             2020,
             3333,
           ]

  # плохо
  VALUES = [1001, 2020, 3333, ]

  # хорошо
  VALUES = [1001, 2020, 3333]
  ```

* Avoid the creation of huge gaps in arrays.

  ```Ruby
  arr = []
  arr[100] = 1 # now you have an array with lots of nils
  ```

* When accessing the first or last element from an array, prefer `first` or `last` over `[0]` or `[-1]`.

* Use `Set` instead of `Array` when dealing with unique elements. `Set`
  implements a collection of unordered values with no duplicates. This
  is a hybrid of `Array`'s intuitive inter-operation facilities and
  `Hash`'s fast lookup.

* Prefer symbols instead of strings as hash keys.

  ```Ruby
  # плохо
  hash = { 'one' => 1, 'two' => 2, 'three' => 3 }

  # хорошо
  hash = { one: 1, two: 2, three: 3 }
  ```

* Avoid the use of mutable objects as hash keys.

* Use the Ruby 1.9 hash literal syntax when your hash keys are symbols.

  ```Ruby
  # плохо
  hash = { :one => 1, :two => 2, :three => 3 }

  # хорошо
  hash = { one: 1, two: 2, three: 3 }
  ```

* Don't mix the Ruby 1.9 hash syntax with hash rockets in the same
  hash literal. When you've got keys that are not symbols stick to the
  hash rockets syntax.

  ```Ruby
  # плохо
  { a: 1, 'b' => 2 }

  # хорошо
  { :a => 1, 'b' => 2 }
  ```

* Use `Hash#key?` instead of `Hash#has_key?` and `Hash#value?` instead
  of `Hash#has_value?`. As noted
  [here](http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/43765)
  by Matz, the longer forms are considered deprecated.

  ```Ruby
  # плохо
  hash.has_key?(:test)
  hash.has_value?(value)

  # хорошо
  hash.key?(:test)
  hash.value?(value)
  ```

* Use `Hash#fetch` when dealing with hash keys that should be present.

  ```Ruby
  heroes = { batman: 'Bruce Wayne', superman: 'Clark Kent' }
  # плохо - if we make a mistake we might not spot it right away
  heroes[:batman] # => "Bruce Wayne"
  heroes[:supermann] # => nil

  # хорошо - fetch raises a KeyError making the problem obvious
  heroes.fetch(:supermann)
  ```

* Introduce default values for hash keys via `Hash#fetch` as opposed to using custom logic.

  ```Ruby
  batman = { name: 'Bruce Wayne', is_evil: false }

  # плохо - if we just use || operator with falsy value we won't get the expected result
  batman[:is_evil] || true # => true

  # хорошо - fetch work correctly with falsy values
  batman.fetch(:is_evil, true) # => false
  ```

* Prefer the use of the block instead of the default value in `Hash#fetch`.

  ```Ruby
  batman = { name: 'Bruce Wayne' }

  # плохо - if we use the default value, we eager evaluate it
  # so it can slow the program down if done multiple times
  batman.fetch(:powers, get_batman_powers) # get_batman_powers is an expensive call

  # хорошо - blocks are lazy evaluated, so only triggered in case of KeyError exception
  batman.fetch(:powers) { get_batman_powers }
  ```

* Use `Hash#values_at` when you need to retrieve several values consecutively from a hash.

  ```Ruby
  # плохо
  email = data['email']
  nickname = data['nickname']

  # хорошо
  email, username = data.values_at('email', 'nickname')
  ```

* Rely on the fact that as of Ruby 1.9 hashes are ordered.

* Never modify a collection while traversing it.

## Строки

* Используйте интерполяцию строк и форматные шаблоны, а не конкатенацию строк:

  ```Ruby
  # плохо
  email_with_name = user.name + ' <' + user.email + '>'

  # хорошо
  email_with_name = "#{user.name} <#{user.email}>"

  # хорошо
  email_with_name = format('%s <%s>', user.name, user.email)
  ```

* Consider padding string interpolation code with space. It more clearly sets the
  code apart from the string.

  ```Ruby
  "#{ user.last_name }, #{ user.first_name }"
  ```

* Adopt a consistent string literal quoting style. There are two
  popular styles in the Ruby community, both of which are considered
  good - single quotes by default (Option A) and double quotes by default (Option B).

  * **(Option A)** Prefer single-quoted strings when you don't need
    string interpolation or special symbols such as `\t`, `\n`, `'`,
    etc.

    ```Ruby
    # плохо
    name = "Bozhidar"

    # хорошо
    name = 'Bozhidar'
    ```

  * **(Option B)** Prefer double-quotes unless your string literal
    contains `"` or escape characters you want to suppress.

    ```Ruby
    # плохо
    name = 'Bozhidar'

    # хорошо
    name = "Bozhidar"
    ```

  The second style is arguably a bit more popular in the Ruby
  community. The string literals in this guide, however, are
  aligned with the first style.

* Don't use the character literal syntax `?x`. Since Ruby 1.9 it's
  basically redundant - `?x` would interpreted as `'x'` (a string with
  a single character in it).

  ```Ruby
  # плохо
  char = ?c

  # хорошо
  char = 'c'
  ```

* Don't leave out `{}` around instance and global variables being
  interpolated into a string.

  ```Ruby
  class Person
    attr_reader :first_name, :last_name

    def initialize(first_name, last_name)
      @first_name = first_name
      @last_name = last_name
    end

    # плохо - valid, but awkward
    def to_s
      "#@first_name #@last_name"
    end

    # хорошо
    def to_s
      "#{@first_name} #{@last_name}"
    end
  end

  $global = 0
  # плохо
  puts "$global = #$global"

  # хорошо
  puts "$global = #{$global}"
  ```

* Don't use `Object#to_s` on interpolated objects. It's invoked on them automatically.

  ```Ruby
  # плохо
  message = "This is the #{result.to_s}."

  # хорошо
  message = "This is the #{result}."
  ```

* Avoid using `String#+` when you need to construct large data chunks.
  Instead, use `String#<<`. Concatenation mutates the string instance in-place
  and is always faster than `String#+`, which creates a bunch of new string objects.

  ```Ruby
  # good and also fast
  html = ''
  html << '<h1>Page title</h1>'

  paragraphs.each do |paragraph|
    html << "<p>#{paragraph}</p>"
  end
  ```

* When using heredocs for multi-line strings keep in mind the fact
  that they preserve leading whitespace. It's a good practice to
  employ some margin based on which to trim the excessive whitespace.

  ```Ruby
  code = <<-END.gsub(/^\s+\|/, '')
    |def test
    |  some_method
    |  other_method
    |end
  END
  #=> "def test\n  some_method\n  other_method\nend\n"
  ```

## Регулярные выражения

> Some people, when confronted with a problem, think
> "I know, I'll use regular expressions." Now they have two problems.<br/>
> -- Jamie Zawinski

* Don't use regular expressions if you just need plain text search in string:
  `string['text']`

* For simple constructions you can use regexp directly through string index.

  ```Ruby
  match = string[/regexp/]             # get content of matched regexp
  first_group = string[/text(grp)/, 1] # get content of captured group
  string[/text (grp)/, 1] = 'replace'  # string => 'text replace'
  ```

* Use non-capturing groups when you don't use captured result of parentheses.

  ```Ruby
  /(first|second)/   # плохо
  /(?:first|second)/ # хорошо
  ```

* Don't use the cryptic Perl-legacy variables denoting last regexp group matches
  (`$1`, `$2`, etc). Use `Regexp.last_match[n]` instead.

  ```Ruby
  /(regexp)/ =~ string
  ...

  # плохо
  process $1

  # хорошо
  process Regexp.last_match[1]
  ```

* Avoid using numbered groups as it can be hard to track what they contain. Named groups
  can be used instead.

  ```Ruby
  # плохо
  /(regexp)/ =~ string
  ...
  process Regexp.last_match[1]

  # хорошо
  /(?<meaningful_var>regexp)/ =~ string
  ...
  process meaningful_var
  ```

* Character classes have only a few special characters you should care about:
  `^`, `-`, `\`, `]`, so don't escape `.` or brackets in `[]`.

* Be careful with `^` and `$` as they match start/end of line, not string endings.
  If you want to match the whole string use: `\A` and `\z` (not to be
  confused with `\Z` which is the equivalent of `/\n?\z/`).

  ```Ruby
  string = "some injection\nusername"
  string[/^username$/]   # matches
  string[/\Ausername\z/] # doesn't match
  ```

* Use `x` modifier for complex regexps. This makes them more readable and you
  can add some useful comments. Just be careful as spaces are ignored.

  ```Ruby
  regexp = /
    start         # some text
    \s            # white space char
    (group)       # first group
    (?:alt1|alt2) # some alternation
    end
  /x
  ```

* For complex replacements `sub`/`gsub` can be used with block or hash.

## Процентные литералы

* Используйте `%()` (это сокращение от `%Q`) для строк без переносов, в которых
  реализуется интерполяция и присутствуют двойные кавычки. Для строк с переносами
  лучше используйте формат HERE Doc.

  ```Ruby
  # плохо (интерполяция не нужна)
  %(<div class="text">Some text</div>)
  # должно быть '<div class="text">Some text</div>'

  # плохо (нет двойных кавычек)
  %(This is #{quality} style)
  # должно быть "This is #{quality} style"

  # плохо (строка с переносами)
  %(<div>\n<span class="big">#{exclamation}</span>\n</div>)
  # лучше применить HERE Doc

  # хорошо (необходима интерполяция, присутствуют кавычки, нет переносов)
  %(<tr><td class="name">#{name}</td>)
  ```

* Избегайте `%q`, если это не случай строки с `'` и `"` одновременно
  Обычные строки читаются проще, и их следует использовать, если нет
  излишне большого количества символов, которые нужно будет экранировать.

  ```Ruby
  # плохо
  name = %q(Bruce Wayne)
  time = %q(8 o'clock)
  question = %q("What did you say?")

  # хорошо
  name = 'Bruce Wayne'
  time = "8 o'clock"
  question = '"What did you say?"'
  ```

* Используйте `%r` только для регулярных выражений, которые обрабатывают больше одного знака '/'.

  ```Ruby
  # плохо
  %r(\s+)

  # все еще плохо
  %r(^/(.*)$)
  # должно быть /^\/(.*)$/

  # хорошо
  %r(^/blog/2011/(.*)$)
  ```

* Откажитесь от использования `%x`, если вы не хотите вызывать внешнюю команду с обратными кавычками в теле
  (что само по себе маловероятно).

  ```Ruby
  # плохо
  date = %x(date)

  # хорошо
  date = `date`
  echo = %x(echo `date`)
  ```

* Старайтесь избегать `%s`. По общепринятому мнению, предпочтительным способом
  определения символа с пробелами в имени является `:"some string"`

* Используйте `()` в качестве ограничителей для всех литералов с знаком `%` кроме `%r`.
  Так как круглые скобки очень часто используются в самих регулярных выражениях, во
  многих случаях менее частый символ `{` может быть лучшим выбором для ограничителя
  (разумеется, с учетом смысла регулярного выражения).

  ```Ruby
  # плохо
  %w[one two three]
  %q{"Test's king!", John said.}

  # хорошо
  %w(one two three)
  %q("Test's king!", John said.)
  ```

## Метапрограммирование

* Avoid needless metaprogramming.

* Do not mess around in core classes when writing libraries.
  (Do not monkey-patch them.)

* The block form of `class_eval` is preferable to the string-interpolated form.
  - when you use the string-interpolated form, always supply `__FILE__` and `__LINE__`,
    so that your backtraces make sense:

  ```ruby
  class_eval 'def use_relative_model_naming?; true; end', __FILE__, __LINE__
  ```

  - `define_method` is preferable to `class_eval{ def ... }`

* When using `class_eval` (or other `eval`) with string interpolation, add a comment block
  showing its appearance if interpolated (a practice used in Rails code):

  ```ruby
  # from activesupport/lib/active_support/core_ext/string/output_safety.rb
  UNSAFE_STRING_METHODS.each do |unsafe_method|
    if 'String'.respond_to?(unsafe_method)
      class_eval <<-EOT, __FILE__, __LINE__ + 1
        def #{unsafe_method}(*args, &block)       # def capitalize(*args, &block)
          to_str.#{unsafe_method}(*args, &block)  #   to_str.capitalize(*args, &block)
        end                                       # end

        def #{unsafe_method}!(*args)              # def capitalize!(*args)
          @dirty = true                           #   @dirty = true
          super                                   #   super
        end                                       # end
      EOT
    end
  end
  ```

* Avoid using `method_missing` for metaprogramming because backtraces become messy,
  the behavior is not listed in `#methods`, and misspelled method calls might silently
  work, e.g. `nukes.launch_state = false`. Consider using delegation, proxy, or
  `define_method` instead. If you must use `method_missing`:

  - Be sure to [also define `respond_to_missing?`](http://blog.marc-andre.ca/2010/11/methodmissing-politely.html)
  - Only catch methods with a well-defined prefix, such as `find_by_*` -- make your code as assertive as possible.
  - Call `super` at the end of your statement
  - Delegate to assertive, non-magical methods:

    ```ruby
    # плохо
    def method_missing?(meth, *args, &block)
      if /^find_by_(?<prop>.*)/ =~ meth
        # ... lots of code to do a find_by
      else
        super
      end
    end

    # хорошо
    def method_missing?(meth, *args, &block)
      if /^find_by_(?<prop>.*)/ =~ meth
        find_by(prop, *args, &block)
      else
        super
      end
    end

    # best of all, though, would to define_method as each findable attribute is declared
    ```

## Разное

* Write `ruby -w` safe code.

* Avoid hashes as optional parameters. Does the method do too much? (Object initializers are exceptions for this rule).

* Avoid methods longer than 10 LOC (lines of code). Ideally, most methods will be shorter than
  5 LOC. Empty lines do not contribute to the relevant LOC.

* Avoid parameter lists longer than three or four parameters.

* If you really need "global" methods, add them to Kernel
  and make them private.

* Use module instance variables instead of global variables.

  ```Ruby
  # плохо
  $foo_bar = 1

  # хорошо
  module Foo
    class << self
      attr_accessor :bar
    end
  end

  Foo.bar = 1
  ```

* Избегайте использования `alias`, если достаточно использовать `alias_method`.

* Используйте `OptionParser` для анализа сложных аргуметов командрой строки и
  `ruby -s` для элеметарных случаев.

* Prefer `Time.now` over `Time.new` when retrieving the current system time.

* Code in a functional way, avoiding mutation when that makes sense.

* Do not mutate arguments unless that is the purpose of the method.

* Avoid more than three levels of block nesting.

* Be consistent. In an ideal world, be consistent with these guidelines.

* Use common sense.

## Инструментарий

Here's some tools to help you automatically check Ruby code against
this guide.

### RuboCop

[RuboCop](https://github.com/bbatsov/rubocop) is a Ruby code style
checker based on this style guide. RuboCop already covers a
significant portion of the Guide, supports both MRI 1.9 and MRI 2.0
and has good Emacs integration.

### RubyMine

[RubyMine](http://www.jetbrains.com/ruby/)'s code inspections are
[partially based](http://confluence.jetbrains.com/display/RUBYDEV/RubyMine+Inspections)
on this guide.

# Contributing

Nothing written in this guide is set in stone. It's my desire to work
together with everyone interested in Ruby coding style, so that we could
ultimately create a resource that will be beneficial to the entire Ruby
community.

Feel free to open tickets or send pull requests with improvements. Thanks in
advance for your help!

You can also support the project (and RuboCop) with financial
contributions via [gittip](https://www.gittip.com/bbatsov).

[![Support via Gittip](https://rawgithub.com/twolfson/gittip-badge/0.2.0/dist/gittip.png)](https://www.gittip.com/bbatsov)

## Как сотрудничать в проекте?

It's easy, just follow the [contribution guidelines](https://github.com/bbatsov/ruby-style-guide/blob/master/CONTRIBUTING.md).

# Лицензирование

![Creative Commons License](http://i.creativecommons.org/l/by/3.0/88x31.png)
This work is licensed under a [Creative Commons Attribution 3.0 Unported License](http://creativecommons.org/licenses/by/3.0/deed.en_US)

# Расскажи другому

A community-driven style guide is of little use to a community that
doesn't know about its existence. Tweet about the guide, share it with
your friends and colleagues. Every comment, suggestion or opinion we
get makes the guide just a little bit better. And we want to have the
best possible guide, don't we?

Всего,<br/>
[Божидар](https://twitter.com/bbatsov)
