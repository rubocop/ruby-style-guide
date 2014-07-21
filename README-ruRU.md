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

* <a name="utf-8"></a> Используйте `UTF-8` в качестве кодировке для исходного кода.<sup>[[link](#utf-8)]</sup>

* <a name="spaces-indentation"></a> Используйте два **пробела** на уровень отступа (т.е. мягкую табуляцию). Никаких знаков табуляции.<sup>[[link](#spaces-indentation)]</sup>

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

* <a name="crlf"></a> Используйте стиль Unix для строк. (пользователи *BSD/Solaris/Linux/OS X используют их по умолчанию,  пользователям Windows нужно обратить особое внимание.)
<sup>[[link](#crlf)]</sup>

  * Если вы используете Git, вы можете добавить следующие настройки
    в вашу конфигурацию, чтобы предотвратить ненамеренное проникновение в ваш код
    строк, оканчивающихся в стиле Windows:

    ```bash
    $ git config --global core.autocrlf true
    ```

* <a name="no-semicolon"></a> Не используйте `;` для разделения директив и выражений. Отсюда непосредсвенно следует,  что каждая директива должна занимать свою отдельную строку.
<sup>[[link](#no-semicolon)]</sup>

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

* <a name="single-line-classes"></a> Используйте преимущественно однострочный формат для определений классов с пустым телом.<sup>[[link](#single-line-classes)]</sup>

  ```Ruby
  # плохо
  class FooError < StandardError
  end

  # сносно
  class FooError < StandardError; end

  # хорошо
  FooError = Class.new(StandardError)
  ```

* <a name="no-single-line-methods"></a> Избегайте однострочных методов. И хотя они достаточно популярны в среде  программистов, существует множество неприятных мелочей, связанных с синтаксисом их
  определения, которые делают применение таких методов нежелательным. В любом случае
  однострочные методы не должны содержать больше одного выражения.
<sup>[[link](#no-single-line-methods)]</sup>


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

* <a name="spaces-operators"></a> Вставляйте пробелы вокруг операторов, после запятых, двоеточий и точек с запятыми,  вокруг `{` и перед `}`. Пробелы (по большей части) игнорируются интерпретатором Руби, но
  их правильное использование является ключом к написанию легко читаемого кода.
<sup>[[link](#spaces-operators)]</sup>

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

* <a name="no-spaces-braces"></a> Не используйте пробел после `(`, `[` или перед `]`, `)`.<sup>[[link](#no-spaces-braces)]</sup>

  ```Ruby
  some(arg).other
  [1, 2, 3].size
  ```

* <a name="no-space-bang"></a> Не используйте пробел после `!`.<sup>[[link](#no-space-bang)]</sup>

  ```Ruby
  # плохо
  ! something

  # хорошо
  !something
  ```

* <a name="indent-when-to-case"></a> Делайте отступ для `when` таким же, как и для `case`. Я знаю, что многие не согласятся  с этим, то этот стиль предписывается как "Языком программирования Ruby",
  так и "Programming Ruby".
<sup>[[link](#indent-when-to-case)]</sup>

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

* <a name="indent-conditional-assignment"></a> Присваивая результат условного выражения переменной, сохраняйте соответствие уровней отступа.<sup>[[link](#indent-conditional-assignment)]</sup>

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

* <a name="empty-lines-between-methods"></a> Используйте пустые строки для разделения определений методов и выделения  логических частей определений внутри них.
<sup>[[link](#empty-lines-between-methods)]</sup>

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

* <a name="no-trailing-params-comma"></a> Avoid comma after the last parameter in a method call, especially when the  parameters are not on separate lines.
<sup>[[link](#no-trailing-params-comma)]</sup>

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

* <a name="spaces-around-equals"></a> Use spaces around the `=` operator when assigning default values to method parameters:<sup>[[link](#spaces-around-equals)]</sup>

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

* <a name="no-trailing-backslash"></a> Avoid line continuation `\` where not required. In practice, avoid using  line continuations for anything but string concatenation.
<sup>[[link](#no-trailing-backslash)]</sup>

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

* <a name="consistent-multi-line-chains"></a> Adopt a consistent multi-line method chaining style. There are two  popular styles in the Ruby community, both of which are considered
  good - leading `.` (Option A) and trailing `.` (Option B).
<sup>[[link](#consistent-multi-line-chains)]</sup>

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

* <a name="no-double-indent"></a> Align the parameters of a method call if they span more than one  line. When aligning parameters is not appropriate due to line-length
  constraints, single indent for the lines after the first is also
  acceptable.
<sup>[[link](#no-double-indent)]</sup>

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

* <a name="align-multiline-arrays"></a> Align the elements of array literals spanning multiple lines.<sup>[[link](#align-multiline-arrays)]</sup>

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

* <a name="underscores-in-numerics"></a> Add underscores to large numeric literals to improve their readability.<sup>[[link](#underscores-in-numerics)]</sup>

  ```Ruby
  # плохо - how many 0s are there?
  num = 1000000

  # хорошо - much easier to parse for the human brain
  num = 1_000_000
  ```

* <a name="rdoc-conventions"></a> Use RDoc and its conventions for API documentation.  Don't put an  empty line between the comment block and the `def`.
<sup>[[link](#rdoc-conventions)]</sup>

* <a name="80-character-limits"></a> Limit lines to 80 characters.<sup>[[link](#80-character-limits)]</sup>

* <a name="no-trailing-whitespace"></a> Avoid trailing whitespace.<sup>[[link](#no-trailing-whitespace)]</sup>

* <a name="newline-eof"></a> End each file with a newline.<sup>[[link](#newline-eof)]</sup>

* <a name="no-block-comments"></a> Don't use block comments. They cannot be preceded by whitespace and are not  as easy to spot as regular comments.
<sup>[[link](#no-block-comments)]</sup>

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

* <a name="double-colons"></a> Используйте `::` только для обращения к константам (в том числе к классам и модулям)  и конструкторам класса (например, `Array()` or `Nokogiri::HTML()`).
  Никогда не используйте `::` для обычного вызова методов.
<sup>[[link](#double-colons)]</sup>

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

* <a name="method-parens"></a> Используйте `def` со скобками, когда у метода есть аргументы. Опускайте скобки  когда метод не принимает аргументов.
<sup>[[link](#method-parens)]</sup>

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

* <a name="no-for-loops"></a> Never use `for`, unless you know exactly why. Most of the time iterators  should be used instead. `for` is implemented in terms of `each` (so
  you're adding a level of indirection), but with a twist - `for`
  doesn't introduce a new scope (unlike `each`) and variables defined
  in its block will be visible outside it.
<sup>[[link](#no-for-loops)]</sup>

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

* <a name="no-then"></a> Never use `then` for multi-line `if/unless`.<sup>[[link](#no-then)]</sup>

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

* <a name="same-line-condition"></a> Always put the condition on the same line as the `if`/`unless` in a multi-line conditional.<sup>[[link](#same-line-condition)]</sup>

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

* <a name="ternary-operator"></a> Favor the ternary operator(`?:`) over `if/then/else/end` constructs.  It's more common and obviously more concise.
<sup>[[link](#ternary-operator)]</sup>

  ```Ruby
  # плохо
  result = if some_condition then something else something_else end

  # хорошо
  result = some_condition ? something : something_else
  ```

* <a name="no-nested-ternary"></a> Use one expression per branch in a ternary operator. This  also means that ternary operators must not be nested. Prefer
  `if/else` constructs in these cases.
<sup>[[link](#no-nested-ternary)]</sup>

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

* <a name="no-1.8-if-syntax"></a> Never use `if x: ...` - as of Ruby 1.9 it has been removed. Use  the ternary operator instead.
<sup>[[link](#no-1.8-if-syntax)]</sup>

  ```Ruby
  # плохо
  result = if some_condition: something else something_else end

  # хорошо
  result = some_condition ? something : something_else
  ```

* <a name="no-semicolon-ifs"></a> Never use `if x; ...`. Use the ternary operator instead.<sup>[[link](#no-semicolon-ifs)]</sup>

* <a name="use-if-case-returns"></a> Leverage the fact that `if` and `case` are expressions which return a result.<sup>[[link](#use-if-case-returns)]</sup>

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

* <a name="one-line-cases"></a> Use `when x then ...` for one-line cases. The alternative syntax  `when x: ...` has been removed as of Ruby 1.9.
<sup>[[link](#one-line-cases)]</sup>

* <a name="no-when-semicolons"></a> Never use `when x; ...`. See the previous rule.<sup>[[link](#no-when-semicolons)]</sup>

* <a name="bang-not-not"></a> Use `!` instead of `not`.<sup>[[link](#bang-not-not)]</sup>

  ```Ruby
  # плохо - braces are required because of op precedence
  x = (not something)

  # хорошо
  x = !something
  ```

* <a name="no-bang-bang"></a> Avoid the use of `!!`.<sup>[[link](#no-bang-bang)]</sup>

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

* <a name="no-and-or-or"></a> The `and` and `or` keywords are banned. It's just not worth  it. Always use `&&` and `||` instead.
<sup>[[link](#no-and-or-or)]</sup>

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

* <a name="no-multiline-ternary"></a> Avoid multi-line `?:` (the ternary operator); use `if/unless` instead.<sup>[[link](#no-multiline-ternary)]</sup>

* <a name="if-as-a-modifier"></a> Favor modifier `if/unless` usage when you have a single-line  body. Another good alternative is the usage of control flow `&&/||`.
<sup>[[link](#if-as-a-modifier)]</sup>

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

* <a name="no-multiline-if-modifiers"></a> Avoid modifier `if/unless` usage at the end of a  non-trivial multi-line block.
<sup>[[link](#no-multiline-if-modifiers)]</sup>

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

* <a name="unless-for-negatives"></a> Favor `unless` over `if` for negative conditions (or control  flow `||`).
<sup>[[link](#unless-for-negatives)]</sup>

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

* <a name="no-else-with-unless"></a> Never use `unless` with `else`. Rewrite these with the positive case first.<sup>[[link](#no-else-with-unless)]</sup>

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

* <a name="no-parens-if"></a> Don't use parentheses around the condition of an `if/unless/while/until`.<sup>[[link](#no-parens-if)]</sup>

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

* <a name="no-multiline-while-do"></a> Never use `while/until condition do` for multi-line `while/until`.<sup>[[link](#no-multiline-while-do)]</sup>

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

* <a name="while-as-a-modifier"></a> Favor modifier `while/until` usage when you have a single-line  body.
<sup>[[link](#while-as-a-modifier)]</sup>

  ```Ruby
  # плохо
  while some_condition
    do_something
  end

  # хорошо
  do_something while some_condition
  ```

* <a name="until-for-negatives"></a> Favor `until` over `while` for negative conditions.<sup>[[link](#until-for-negatives)]</sup>

  ```Ruby
  # плохо
  do_something while !some_condition

  # хорошо
  do_something until some_condition
  ```

* <a name="infinite-loop"></a> Use `Kernel#loop` instead of `while/until` when you need an infinite loop.<sup>[[link](#infinite-loop)]</sup>

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

* <a name="loop-with-break"></a> Use `Kernel#loop` with `break` rather than `begin/end/until` or `begin/end/while` for post-loop tests.<sup>[[link](#loop-with-break)]</sup>

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

* <a name="no-dsl-parens"></a> Omit parentheses around parameters for methods that are part of an  internal DSL (e.g. Rake, Rails, RSpec), methods that have
  "keyword" status in Ruby (e.g. `attr_reader`, `puts`) and attribute
  access methods. Use parentheses around the arguments of all other
  method invocations.
<sup>[[link](#no-dsl-parens)]</sup>

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

* <a name="no-braces-opts-hash"></a> Omit the outer braces around an implicit options hash.<sup>[[link](#no-braces-opts-hash)]</sup>

  ```Ruby
  # плохо
  user.set({ name: 'John', age: 45, permissions: { read: true } })

  # хорошо
  user.set(name: 'John', age: 45, permissions: { read: true })
  ```

* <a name="no-dsl-decorating"></a> Omit both the outer braces and parentheses for methods that are  part of an internal DSL.
<sup>[[link](#no-dsl-decorating)]</sup>

  ```Ruby
  class Person < ActiveRecord::Base
    # плохо
    validates(:name, { presence: true, length: { within: 1..10 } })

    # хорошо
    validates :name, presence: true, length: { within: 1..10 }
  end
  ```

* <a name="no-args-no-parens"></a> Omit parentheses for method calls with no arguments.<sup>[[link](#no-args-no-parens)]</sup>

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

* <a name="single-line-blocks"></a> Prefer `{...}` over `do...end` for single-line blocks.  Avoid using  `{...}` for multi-line blocks (multiline chaining is always
  ugly). Always use `do...end` for "control flow" and "method
  definitions" (e.g. in Rakefiles and certain DSLs).  Avoid `do...end`
  when chaining.
<sup>[[link](#single-line-blocks)]</sup>

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

* <a name="block-argument"></a> Consider using explicit block argument to avoid writing block  literal that just passes its arguments to another block. Beware of
  the performance impact, though, as the block gets converted to a
  Proc.
<sup>[[link](#block-argument)]</sup>

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

* <a name="no-explicit-return"></a> Avoid `return` where not required for flow of control.<sup>[[link](#no-explicit-return)]</sup>

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

* <a name="no-self-unless-required"></a> Avoid `self` where not required. (It is only required when calling a self write accessor.)<sup>[[link](#no-self-unless-required)]</sup>

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

* <a name="no-shadowing"></a> As a corollary, avoid shadowing methods with local variables unless they are both equivalent.<sup>[[link](#no-shadowing)]</sup>

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

* <a name="safe-assignment-in-condition"></a> Don't use the return value of `=` (an assignment) in conditional  expressions unless the assignment is wrapped in parentheses. This is
  a fairly popular idiom among Rubyists that's sometimes referred to as
<sup>[[link](#safe-assignment-in-condition)]</sup>


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

* <a name="self-assignment"></a> Use shorthand self assignment operators whenever applicable.<sup>[[link](#self-assignment)]</sup>

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

* <a name="double-pipe-for-uninit"></a> Use `||=` to initialize variables only if they're not already initialized.<sup>[[link](#double-pipe-for-uninit)]</sup>

  ```Ruby
  # плохо
  name = name ? name : 'Bozhidar'

  # плохо
  name = 'Bozhidar' unless name

  # хорошо - set name to Bozhidar, only if it's nil or false
  name ||= 'Bozhidar'
  ```

* <a name="no-double-pipes-for-bools"></a> Don't use `||=` to initialize boolean variables. (Consider what  would happen if the current value happened to be `false`.)
<sup>[[link](#no-double-pipes-for-bools)]</sup>

  ```Ruby
  # плохо - would set enabled to true even if it was false
  enabled ||= true

  # хорошо
  enabled = true if enabled.nil?
  ```

* <a name="double-amper-preprocess"></a> Use `&&=` to preprocess variables that may or may not exist. Using  `&&=` will change the value only if it exists, removing the need to
  check its existence with `if`.
<sup>[[link](#double-amper-preprocess)]</sup>

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

* <a name="no-case-equality"></a> Avoid explicit use of the case equality operator `===`. As its name  implies it is meant to be used implicitly by `case` expressions and
  outside of them it yields some pretty confusing code.
<sup>[[link](#no-case-equality)]</sup>

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

* <a name="no-cryptic-perlisms"></a> Avoid using Perl-style special variables (like `$:`, `$;`,  etc. ). They are quite cryptic and their use in anything but
  one-liner scripts is discouraged. Use the human-friendly
  aliases provided by the `English` library.
<sup>[[link](#no-cryptic-perlisms)]</sup>

  ```Ruby
  # плохо
  $:.unshift File.dirname(__FILE__)

  # хорошо
  require 'English'
  $LOAD_PATH.unshift File.dirname(__FILE__)
  ```

* <a name="parens-no-spaces"></a> Never put a space between a method name and the opening parenthesis.<sup>[[link](#parens-no-spaces)]</sup>

  ```Ruby
  # плохо
  f (3 + 2) + 1

  # хорошо
  f(3 + 2) + 1
  ```

* <a name="parens-as-args"></a> If the first argument to a method begins with an open parenthesis,  always use parentheses in the method invocation. For example, write
  `f((3 + 2) + 1)`.
<sup>[[link](#parens-as-args)]</sup>

* <a name="always-warn-at-runtime"></a> Always run the Ruby interpreter with the `-w` option so it will warn  you if you forget either of the rules above!
<sup>[[link](#always-warn-at-runtime)]</sup>

* <a name="lambda-multi-line"></a> Use the new lambda literal syntax for single line body blocks. Use the  `lambda` method for multi-line blocks.
<sup>[[link](#lambda-multi-line)]</sup>

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

* <a name="proc"></a> Prefer `proc` over `Proc.new`.<sup>[[link](#proc)]</sup>

  ```Ruby
  # плохо
  p = Proc.new { |n| puts n }

  # хорошо
  p = proc { |n| puts n }
  ```

* <a name="proc-call"></a> Prefer `proc.call()` over `proc[]` or `proc.()` for both lambdas and procs.<sup>[[link](#proc-call)]</sup>

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

* <a name="underscore-unused-vars"></a> Prefix with `_` unused block parameters and local variables. It's  also acceptable to use just `_` (although it's a bit less
  descriptive). This convention is recognized by the Ruby interpreter
  and tools like RuboCop and will suppress their unused variable warnings.
<sup>[[link](#underscore-unused-vars)]</sup>

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

* <a name="global-stdout"></a> Use `$stdout/$stderr/$stdin` instead of  `STDOUT/STDERR/STDIN`. `STDOUT/STDERR/STDIN` are constants, and
  while you can actually reassign (possibly to redirect some stream)
  constants in Ruby, you'll get an interpreter warning if you do so.
<sup>[[link](#global-stdout)]</sup>

* <a name="warn"></a> Use `warn` instead of `$stderr.puts`. Apart from being more concise  and clear, `warn` allows you to suppress warnings if you need to (by
  setting the warn level to 0 via `-W0`).
<sup>[[link](#warn)]</sup>

* <a name="sprintf"></a> Favor the use of `sprintf` and its alias `format` over the fairly  cryptic `String#%` method.
<sup>[[link](#sprintf)]</sup>

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

* <a name="array-join"></a> Favor the use of `Array#join` over the fairly cryptic `Array#*` with  a string argument.
<sup>[[link](#array-join)]</sup>

  ```Ruby
  # плохо
  %w(one two three) * ', '
  # => 'one, two, three'

  # хорошо
  %w(one two three).join(', ')
  # => 'one, two, three'
  ```

* <a name="splat-arrays"></a> Use `[*var]` or `Array()` instead of explicit `Array` check, when dealing with a  variable you want to treat as an Array, but you're not certain it's
  an array.
<sup>[[link](#splat-arrays)]</sup>

  ```Ruby
  # плохо
  paths = [paths] unless paths.is_a? Array
  paths.each { |path| do_something(path) }

  # хорошо
  [*paths].each { |path| do_something(path) }

  # хорошо (and a bit more readable)
  Array(paths).each { |path| do_something(path) }
  ```

* <a name="ranges-or-between"></a> Use ranges or `Comparable#between?` instead of complex comparison logic when possible.<sup>[[link](#ranges-or-between)]</sup>

  ```Ruby
  # плохо
  do_something if x >= 1000 && x <= 2000

  # хорошо
  do_something if (1000..2000).include?(x)

  # хорошо
  do_something if x.between?(1000, 2000)
  ```

* <a name="predicate-methods"></a> Favor the use of predicate methods to explicit comparisons with  `==`. Numeric comparisons are OK.
<sup>[[link](#predicate-methods)]</sup>

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

* <a name="no-non-nil-checks"></a> Don't do explicit non-`nil` checks unless you're dealing with boolean values.<sup>[[link](#no-non-nil-checks)]</sup>

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

* <a name="no-BEGIN-blocks"></a> Avoid the use of `BEGIN` blocks.<sup>[[link](#no-BEGIN-blocks)]</sup>

* <a name="no-END-blocks"></a> Never use `END` blocks. Use `Kernel#at_exit` instead.<sup>[[link](#no-END-blocks)]</sup>

  ```ruby
  # плохо
  END { puts 'Goodbye!' }

  # хорошо
  at_exit { puts 'Goodbye!' }
  ```

* <a name="no-flip-flops"></a> Avoid the use of flip-flops.<sup>[[link](#no-flip-flops)]</sup>

* <a name="no-nested-conditionals"></a> Avoid use of nested conditionals for flow of control.<sup>[[link](#no-nested-conditionals)]</sup>

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

* <a name="english-identifiers"></a> Name identifiers in English.<sup>[[link](#english-identifiers)]</sup>

  ```Ruby
  # плохо - identifier using non-ascii characters
  заплата = 1_000

  # плохо - identifier is a Bulgarian word, written with Latin letters (instead of Cyrillic)
  zaplata = 1_000

  # хорошо
  salary = 1_000
  ```

* <a name="snake-case-symbols-methods-vars"></a> Use `snake_case` for symbols, methods and variables.<sup>[[link](#snake-case-symbols-methods-vars)]</sup>

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

* <a name="camelcase-classes"></a> Use `CamelCase` for classes and modules.  (Keep acronyms like HTTP,  RFC, XML uppercase.)
<sup>[[link](#camelcase-classes)]</sup>

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

* <a name="snake-case-files"></a> Use `snake_case` for naming files, e.g. `hello_world.rb`.<sup>[[link](#snake-case-files)]</sup>

* <a name="snake-case-dirs"></a> Use `snake_case` for naming directories, e.g. `lib/hello_world/hello_world.rb`.<sup>[[link](#snake-case-dirs)]</sup>

* <a name="one-class-per-file"></a> Aim to have just a single class/module per source file. Name the file name as  the class/module, but replacing CamelCase with snake_case.
<sup>[[link](#one-class-per-file)]</sup>

* <a name="screaming-snake-case"></a> Use `SCREAMING_SNAKE_CASE` for other constants.<sup>[[link](#screaming-snake-case)]</sup>

  ```Ruby
  # плохо
  SomeConst = 5

  # хорошо
  SOME_CONST = 5
  ```

* <a name="bool-methods-qmark"></a> The names of predicate methods (methods that return a boolean value)  should end in a question mark.
  (i.e. `Array#empty?`). Methods that don't return a boolean, shouldn't
  end in a question mark.
<sup>[[link](#bool-methods-qmark)]</sup>

* <a name="dangerous-method-bang"></a> The names of potentially *dangerous* methods (i.e. methods that  modify `self` or the arguments, `exit!` (doesn't run the finalizers
  like `exit` does), etc.) should end with an exclamation mark if
  there exists a safe version of that *dangerous* method.
<sup>[[link](#dangerous-method-bang)]</sup>

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

* <a name="safe-because-unsafe"></a> Define the non-bang (safe) method in terms of the bang (dangerous)  one if possible.
<sup>[[link](#safe-because-unsafe)]</sup>

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

* <a name="reduce-blocks"></a> When using `reduce` with short blocks, name the arguments `|a, e|`  (accumulator, element).
<sup>[[link](#reduce-blocks)]</sup>

* <a name="other-arg"></a> When defining binary operators, name the argument `other`(`<<` and  `[]` are exceptions to the rule, since their semantics are different).
<sup>[[link](#other-arg)]</sup>

  ```Ruby
  def +(other)
    # body omitted
  end
  ```

* <a name="map-fine-select-reduce-size"></a> Prefer `map` over `collect`, `find` over `detect`, `select` over  `find_all`, `reduce` over `inject` and `size` over `length`. This is
  not a hard requirement; if the use of the alias enhances
  readability, it's ok to use it. The rhyming methods are inherited from
  Smalltalk and are not common in other programming languages. The
  reason the use of `select` is encouraged over `find_all` is that it
  goes together nicely with `reject` and its name is pretty self-explanatory.
<sup>[[link](#map-fine-select-reduce-size)]</sup>

* <a name="count-vs-size"></a> Don't use `count` as a substitute for `size`. For `Enumerable`  objects other than `Array` it will iterate the entire collection in
  order to determine its size.
<sup>[[link](#count-vs-size)]</sup>

  ```Ruby
  # плохо
  some_hash.count

  # хорошо
  some_hash.size
  ```

* <a name="flat-map"></a> Use `flat_map` instead of `map` + `flatten`.  This does not apply for arrays with a depth greater than 2, i.e.
  if `users.first.songs == ['a', ['b','c']]`, then use `map + flatten` rather than `flat_map`.
  `flat_map` flattens the array by 1, whereas `flatten` flattens it all the way.
<sup>[[link](#flat-map)]</sup>

  ```Ruby
  # плохо
  all_songs = users.map(&:songs).flatten.uniq

  # хорошо
  all_songs = users.flat_map(&:songs).uniq
  ```

* <a name="reverse-each"></a> Use `reverse_each` instead of `reverse.each`. `reverse_each` doesn't  do a new array allocation and that's a good thing.
<sup>[[link](#reverse-each)]</sup>

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

* <a name="no-comments"></a> Write self-documenting code and ignore the rest of this section. Seriously!<sup>[[link](#no-comments)]</sup>

* <a name="english-comments"></a> Write comments in English.<sup>[[link](#english-comments)]</sup>

* <a name="hash-space"></a> Use one space between the leading `#` character of the comment and the text  of the comment.
<sup>[[link](#hash-space)]</sup>

* <a name="english-syntax"></a> Comments longer than a word are capitalized and use punctuation. Use [one  space](http://en.wikipedia.org/wiki/Sentence_spacing) after periods.
<sup>[[link](#english-syntax)]</sup>

* <a name="no-superfluous-comments"></a> Avoid superfluous comments.<sup>[[link](#no-superfluous-comments)]</sup>

  ```Ruby
  # плохо
  counter += 1 # Increments counter by one.
  ```

* <a name="comment-upkeep"></a> Keep existing comments up-to-date. An outdated comment is worse than no comment  at all.
<sup>[[link](#comment-upkeep)]</sup>

> Good code is like a good joke - it needs no explanation. <br/>
> -- Russ Olsen

* <a name="refactor-dont-comment"></a> Avoid writing comments to explain плохо code. Refactor the code to  make it self-explanatory. (Do or do not - there is no try. --Yoda)
<sup>[[link](#refactor-dont-comment)]</sup>

### Пометки в комментариях

* <a name="annotate-above"></a> Annotations should usually be written on the line immediately above  the relevant code.
<sup>[[link](#annotate-above)]</sup>

* <a name="annotate-keywords"></a> The annotation keyword is followed by a colon and a space, then a note  describing the problem.
<sup>[[link](#annotate-keywords)]</sup>

* <a name="indent-annotations"></a> If multiple lines are required to describe the problem, subsequent  lines should be indented two spaces after the `#`.
<sup>[[link](#indent-annotations)]</sup>

  ```Ruby
  def bar
    # FIXME: This has crashed occasionally since v3.2.1. It may
    #   be related to the BarBazUtil upgrade.
    baz(:quux)
  end
  ```

* <a name="rare-eol-annotations"></a> In cases where the problem is so obvious that any documentation would  be redundant, annotations may be left at the end of the offending line
  with no note. This usage should be the exception and not the rule.
<sup>[[link](#rare-eol-annotations)]</sup>

  ```Ruby
  def bar
    sleep 100 # OPTIMIZE
  end
  ```

* <a name="todo"></a> Use `TODO` to note missing features or functionality that should be  added at a later date.
<sup>[[link](#todo)]</sup>

* <a name="fixme"></a> Use `FIXME` to note broken code that needs to be fixed.<sup>[[link](#fixme)]</sup>

* <a name="optimize"></a> Use `OPTIMIZE` to note slow or inefficient code that may cause  performance problems.
<sup>[[link](#optimize)]</sup>

* <a name="hack"></a> Use `HACK` to note code smells where questionable coding practices  were used and should be refactored away.
<sup>[[link](#hack)]</sup>

* <a name="review"></a> Use `REVIEW` to note anything that should be looked at to confirm it  is working as intended. For example: `REVIEW: Are we sure this is how the
  client does X currently?`
<sup>[[link](#review)]</sup>

* <a name="document-annotations"></a> Use other custom annotation keywords if it feels appropriate, but be  sure to document them in your project's `README` or similar.
<sup>[[link](#document-annotations)]</sup>

## Классы и модули

* <a name="consistent-classes"></a> Структурируйте ваши классы единообразно.<sup>[[link](#consistent-classes)]</sup>

  ```Ruby
  class Person
    # extend и include в начале
    extend SomeModule
    include AnotherModule

    # внутернние классы
    CustomErrorKlass = Class.new(StandardError)

    # после этого константы
    SOME_CONSTANT = 20

    # после этого макросы методов доступа к атрибутам
    attr_reader :name

    # и все прочие макросы (если имеются)
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

* <a name="file-classes"></a> Don't nest multi line classes within classes. Try to have such nested  classes each in their own file in a folder named like the containing class.
<sup>[[link](#file-classes)]</sup>

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

* <a name="modules-vs-classes"></a> Prefer modules to classes with only class methods. Classes should be  used only when it makes sense to create instances out of them.
<sup>[[link](#modules-vs-classes)]</sup>

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

* <a name="module-function"></a> Favor the use of `module_function` over `extend self` when you want  to turn a module's instance methods into class methods.
<sup>[[link](#module-function)]</sup>

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

* <a name="liskov"></a> When designing class hierarchies make sure that they conform to the  [Liskov Substitution Principle](http://en.wikipedia.org/wiki/Liskov_substitution_principle).
<sup>[[link](#liskov)]</sup>

* <a name="solid-design"></a> Try to make your classes as  [SOLID](http://en.wikipedia.org/wiki/SOLID_\(object-oriented_design\))
  as possible.
<sup>[[link](#solid-design)]</sup>

* <a name="define-to-s"></a> Always supply a proper `to_s` method for classes that represent  domain objects.
<sup>[[link](#define-to-s)]</sup>

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

* <a name="attr_family"></a> Use the `attr` family of functions to define trivial accessors or mutators.<sup>[[link](#attr_family)]</sup>

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

* <a name="attr"></a> Avoid the use of `attr`. Use `attr_reader` and `attr_accessor` instead.<sup>[[link](#attr)]</sup>

  ```Ruby
  # плохо - creates a single attribute accessor (deprecated in 1.9)
  attr :something, true
  attr :one, :two, :three # behaves as attr_reader

  # хорошо
  attr_accessor :something
  attr_reader :one, :two, :three
  ```

* <a name="struct-new"></a> Consider using `Struct.new`, which defines the trivial accessors,  constructor and comparison operators for you.
<sup>[[link](#struct-new)]</sup>

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

* <a name="no-extend-struct-new"></a> Don't extend a `Struct.new` - it already is a new class. Extending it introduces  a superfluous class level and may also introduce weird errors if the file is
  required multiple times.
<sup>[[link](#no-extend-struct-new)]</sup>

* <a name="factory-methods"></a> Consider adding factory methods to provide additional sensible ways  to create instances of a particular class.
<sup>[[link](#factory-methods)]</sup>

  ```Ruby
  class Person
    def self.create(options_hash)
      # body omitted
    end
  end
  ```

* <a name="duck-typing"></a> Prefer [duck-typing](http://en.wikipedia.org/wiki/Duck_typing) over inheritance.<sup>[[link](#duck-typing)]</sup>

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

* <a name="no-class-vars"></a> Avoid the usage of class (`@@`) variables due to their "nasty" behavior in inheritance.<sup>[[link](#no-class-vars)]</sup>

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

* <a name="visibility"></a> Assign proper visibility levels to methods (`private`, `protected`)  in accordance with their intended usage. Don't go off leaving
  everything `public` (which is the default). After all we're coding
  in *Ruby* now, not in *Python*.
<sup>[[link](#visibility)]</sup>

* <a name="indent-public-private-protected"></a> Indent the `public`, `protected`, and `private` methods as much the  method definitions they apply to. Leave one blank line above the
  visibility modifier
  and one blank line below in order to emphasize that it applies to all
  methods below it.
<sup>[[link](#indent-public-private-protected)]</sup>

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

* <a name="def-self-singletons"></a> Use `def self.method` to define singleton methods. This makes the code  easier to refactor since the class name is not repeated.
<sup>[[link](#def-self-singletons)]</sup>

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

* <a name="fail-method"></a> Signal exceptions using the `fail` method. Use `raise` only when  catching an exception and re-raising it (because here you're not
  failing, but explicitly and purposefully raising an exception).
<sup>[[link](#fail-method)]</sup>

  ```Ruby
  begin
    fail 'Oops'
  rescue => error
    raise if error.message != 'Oops'
  end
  ```

* <a name="no-explicit-runtimeerror"></a> Don't specify `RuntimeError` explicitly in the two argument version of `fail/raise`.<sup>[[link](#no-explicit-runtimeerror)]</sup>

  ```Ruby
  # плохо
  fail RuntimeError, 'message'

  # хорошо - signals a RuntimeError by default
  fail 'message'
  ```

* <a name="exception-class-messages"></a> Prefer supplying an exception class and a message as two separate  arguments to `fail/raise`, instead of an exception instance.
<sup>[[link](#exception-class-messages)]</sup>

  ```Ruby
  # плохо
  fail SomeException.new('message')
  # Note that there is no way to do `fail SomeException.new('message'), backtrace`.

  # хорошо
  fail SomeException, 'message'
  # Consistent with `fail SomeException, 'message', backtrace`.
  ```

* <a name="no-return-ensure"></a> Never return from an `ensure` block. If you explicitly return from a  method inside an `ensure` block, the return will take precedence over
  any exception being raised, and the method will return as if no
  exception had been raised at all. In effect, the exception will be
  silently thrown away.
<sup>[[link](#no-return-ensure)]</sup>

  ```Ruby
  def foo
    begin
      fail
    ensure
      return 'very bad idea'
    end
  end
  ```

* <a name="begin-implicit"></a> Use *implicit begin blocks* where possible.<sup>[[link](#begin-implicit)]</sup>

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

* <a name="contingency-methods"></a> Mitigate the proliferation of `begin` blocks by using<sup>[[link](#contingency-methods)]</sup>


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

* <a name="dont-hide-exceptions"></a> Don't suppress exceptions.<sup>[[link](#dont-hide-exceptions)]</sup>

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

* <a name="no-rescue-modifiers"></a> Avoid using `rescue` in its modifier form.<sup>[[link](#no-rescue-modifiers)]</sup>

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

* <a name="no-exceptional-flows"></a> Don't use exceptions for flow of control.<sup>[[link](#no-exceptional-flows)]</sup>

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

* <a name="no-blind-rescues"></a> Avoid rescuing the `Exception` class.  This will trap signals and calls to  `exit`, requiring you to `kill -9` the process.
<sup>[[link](#no-blind-rescues)]</sup>

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

* <a name="exception-ordering"></a> Put more specific exceptions higher up the rescue chain, otherwise  they'll never be rescued from.
<sup>[[link](#exception-ordering)]</sup>

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

* <a name="file-close"></a> Release external resources obtained by your program in an ensure block.<sup>[[link](#file-close)]</sup>

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

* <a name="standard-exceptions"></a> Favor the use of exceptions for the standard library over  introducing new exception classes.
<sup>[[link](#standard-exceptions)]</sup>

## Коллекции

* <a name="literal-array-hash"></a> Prefer literal array and hash creation notation (unless you need to  pass parameters to their constructors, that is).
<sup>[[link](#literal-array-hash)]</sup>

  ```Ruby
  # плохо
  arr = Array.new
  hash = Hash.new

  # хорошо
  arr = []
  hash = {}
  ```

* <a name="percent-w"></a> Prefer `%w` to the literal array syntax when you need an array of  words (non-empty strings without spaces and special characters in them).
  Apply this rule only to arrays with two or more elements.
<sup>[[link](#percent-w)]</sup>

  ```Ruby
  # плохо
  STATES = ['draft', 'open', 'closed']

  # хорошо
  STATES = %w(draft open closed)
  ```

* <a name="percent-i"></a> Prefer `%i` to the literal array syntax when you need an array of  symbols (and you don't need to maintain Ruby 1.9 compatibility). Apply
  this rule only to arrays with two or more elements.
<sup>[[link](#percent-i)]</sup>

  ```Ruby
  # плохо
  STATES = [:draft, :open, :closed]

  # хорошо
  STATES = %i(draft open closed)
  ```

* <a name="no-trailing-array-commas"></a> Avoid comma after the last item of an `Array` or `Hash` literal, especially  when the items are not on separate lines.
<sup>[[link](#no-trailing-array-commas)]</sup>

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

* <a name="no-gappy-arrays"></a> Avoid the creation of huge gaps in arrays.<sup>[[link](#no-gappy-arrays)]</sup>

  ```Ruby
  arr = []
  arr[100] = 1 # now you have an array with lots of nils
  ```

* <a name="first-and-last"></a> When accessing the first or last element from an array, prefer `first` or `last` over `[0]` or `[-1]`.<sup>[[link](#first-and-last)]</sup>

* <a name="set-vs-array"></a> Use `Set` instead of `Array` when dealing with unique elements. `Set`  implements a collection of unordered values with no duplicates. This
  is a hybrid of `Array`'s intuitive inter-operation facilities and
  `Hash`'s fast lookup.
<sup>[[link](#set-vs-array)]</sup>

* <a name="symbols-as-keys"></a> Prefer symbols instead of strings as hash keys.<sup>[[link](#symbols-as-keys)]</sup>

  ```Ruby
  # плохо
  hash = { 'one' => 1, 'two' => 2, 'three' => 3 }

  # хорошо
  hash = { one: 1, two: 2, three: 3 }
  ```

* <a name="no-mutable-keys"></a> Avoid the use of mutable objects as hash keys.<sup>[[link](#no-mutable-keys)]</sup>

* <a name="hash-literals"></a> Use the Ruby 1.9 hash literal syntax when your hash keys are symbols.<sup>[[link](#hash-literals)]</sup>

  ```Ruby
  # плохо
  hash = { :one => 1, :two => 2, :three => 3 }

  # хорошо
  hash = { one: 1, two: 2, three: 3 }
  ```

* <a name="no-mixed-hash-syntaces"></a> Don't mix the Ruby 1.9 hash syntax with hash rockets in the same  hash literal. When you've got keys that are not symbols stick to the
  hash rockets syntax.
<sup>[[link](#no-mixed-hash-syntaces)]</sup>

  ```Ruby
  # плохо
  { a: 1, 'b' => 2 }

  # хорошо
  { :a => 1, 'b' => 2 }
  ```

* <a name="hash-key"></a> Use `Hash#key?` instead of `Hash#has_key?` and `Hash#value?` instead  of `Hash#has_value?`. As noted
  [here](http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/43765)
  by Matz, the longer forms are considered deprecated.
<sup>[[link](#hash-key)]</sup>

  ```Ruby
  # плохо
  hash.has_key?(:test)
  hash.has_value?(value)

  # хорошо
  hash.key?(:test)
  hash.value?(value)
  ```

* <a name="hash-fetch"></a> Use `Hash#fetch` when dealing with hash keys that should be present.<sup>[[link](#hash-fetch)]</sup>

  ```Ruby
  heroes = { batman: 'Bruce Wayne', superman: 'Clark Kent' }
  # плохо - if we make a mistake we might not spot it right away
  heroes[:batman] # => "Bruce Wayne"
  heroes[:supermann] # => nil

  # хорошо - fetch raises a KeyError making the problem obvious
  heroes.fetch(:supermann)
  ```

* <a name="hash-fetch-defaults"></a> Introduce default values for hash keys via `Hash#fetch` as opposed to using custom logic.<sup>[[link](#hash-fetch-defaults)]</sup>

  ```Ruby
  batman = { name: 'Bruce Wayne', is_evil: false }

  # плохо - if we just use || operator with falsy value we won't get the expected result
  batman[:is_evil] || true # => true

  # хорошо - fetch work correctly with falsy values
  batman.fetch(:is_evil, true) # => false
  ```

* <a name="use-hash-blocks"></a> Prefer the use of the block instead of the default value in `Hash#fetch`.<sup>[[link](#use-hash-blocks)]</sup>

  ```Ruby
  batman = { name: 'Bruce Wayne' }

  # плохо - if we use the default value, we eager evaluate it
  # so it can slow the program down if done multiple times
  batman.fetch(:powers, get_batman_powers) # get_batman_powers is an expensive call

  # хорошо - blocks are lazy evaluated, so only triggered in case of KeyError exception
  batman.fetch(:powers) { get_batman_powers }
  ```

* <a name="hash-values-at"></a> Use `Hash#values_at` when you need to retrieve several values consecutively from a hash.<sup>[[link](#hash-values-at)]</sup>

  ```Ruby
  # плохо
  email = data['email']
  nickname = data['nickname']

  # хорошо
  email, username = data.values_at('email', 'nickname')
  ```

* <a name="ordered-hashes"></a> Rely on the fact that as of Ruby 1.9 hashes are ordered.<sup>[[link](#ordered-hashes)]</sup>

* <a name="no-modifying-collections"></a> Never modify a collection while traversing it.<sup>[[link](#no-modifying-collections)]</sup>

## Строки

* <a name="string-interpolation"></a> Используйте интерполяцию строк и форматные шаблоны, а не конкатенацию строк:<sup>[[link](#string-interpolation)]</sup>

  ```Ruby
  # плохо
  email_with_name = user.name + ' <' + user.email + '>'

  # хорошо
  email_with_name = "#{user.name} <#{user.email}>"

  # хорошо
  email_with_name = format('%s <%s>', user.name, user.email)
  ```

* <a name="pad-string-interpolation"></a> Постарайтесь отделять код интерполяции пробелами.
  Это отделит код интерполяции более четко от окружающего кода.<sup>[[link](#pad-string-interpolation)]</sup>

  ```Ruby
  "#{ user.last_name }, #{ user.first_name }"
  ```

* <a name="consistent-string-literals"></a> Adopt a consistent string literal quoting style.
  There are two  popular styles in the Ruby community, both of which are considered
  good - single quotes by default (Option A) and double quotes by default (Option B).
  <sup>[[link](#consistent-string-literals)]</sup>

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

* <a name="no-character-literals"></a> Don't use the character literal syntax `?x`. Since Ruby 1.9 it's  basically redundant - `?x` would interpreted as `'x'` (a string with
  a single character in it).
<sup>[[link](#no-character-literals)]</sup>

  ```Ruby
  # плохо
  char = ?c

  # хорошо
  char = 'c'
  ```

* <a name="curlies-interpolate"></a> Don't leave out `{}` around instance and global variables being  interpolated into a string.
<sup>[[link](#curlies-interpolate)]</sup>

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

* <a name="no-to-s"></a> Don't use `Object#to_s` on interpolated objects. It's invoked on them automatically.<sup>[[link](#no-to-s)]</sup>

  ```Ruby
  # плохо
  message = "This is the #{result.to_s}."

  # хорошо
  message = "This is the #{result}."
  ```

* <a name="concat-strings"></a> Avoid using `String#+` when you need to construct large data chunks.  Instead, use `String#<<`. Concatenation mutates the string instance in-place
  and is always faster than `String#+`, which creates a bunch of new string objects.
<sup>[[link](#concat-strings)]</sup>

  ```Ruby
  # good and also fast
  html = ''
  html << '<h1>Page title</h1>'

  paragraphs.each do |paragraph|
    html << "<p>#{paragraph}</p>"
  end
  ```

* <a name="heredocs"></a> When using heredocs for multi-line strings keep in mind the fact  that they preserve leading whitespace. It's a good practice to
  employ some margin based on which to trim the excessive whitespace.
<sup>[[link](#heredocs)]</sup>

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

* <a name="no-regexp-for-plaintext"></a> Don't use regular expressions if you just need plain text search in string:  `string['text']`
<sup>[[link](#no-regexp-for-plaintext)]</sup>

* <a name="regexp-string-index"></a> For simple constructions you can use regexp directly through string index.<sup>[[link](#regexp-string-index)]</sup>

  ```Ruby
  match = string[/regexp/]             # get content of matched regexp
  first_group = string[/text(grp)/, 1] # get content of captured group
  string[/text (grp)/, 1] = 'replace'  # string => 'text replace'
  ```

* <a name="non-capturing-regexp"></a> Use non-capturing groups when you don't use captured result of parentheses.<sup>[[link](#non-capturing-regexp)]</sup>

  ```Ruby
  /(first|second)/   # плохо
  /(?:first|second)/ # хорошо
  ```

* <a name="no-perl-regexp-last-matchers"></a> Don't use the cryptic Perl-legacy variables denoting last regexp group matches  (`$1`, `$2`, etc). Use `Regexp.last_match[n]` instead.
<sup>[[link](#no-perl-regexp-last-matchers)]</sup>

  ```Ruby
  /(regexp)/ =~ string
  ...

  # плохо
  process $1

  # хорошо
  process Regexp.last_match[1]
  ```

* <a name="no-numbered-regexes"></a> Avoid using numbered groups as it can be hard to track what they contain. Named groups  can be used instead.
<sup>[[link](#no-numbered-regexes)]</sup>

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

* <a name="limit-escapes"></a> Character classes have only a few special characters you should care about:  `^`, `-`, `\`, `]`, so don't escape `.` or brackets in `[]`.
<sup>[[link](#limit-escapes)]</sup>

* <a name="caret-and-dollar-regexp"></a> Be careful with `^` and `$` as they match start/end of line, not string endings.  If you want to match the whole string use: `\A` and `\z` (not to be
  confused with `\Z` which is the equivalent of `/\n?\z/`).
<sup>[[link](#caret-and-dollar-regexp)]</sup>

  ```Ruby
  string = "some injection\nusername"
  string[/^username$/]   # matches
  string[/\Ausername\z/] # doesn't match
  ```

* <a name="comment-regexes"></a> Use `x` modifier for complex regexps. This makes them more readable and you  can add some useful comments. Just be careful as spaces are ignored.
<sup>[[link](#comment-regexes)]</sup>

  ```Ruby
  regexp = /
    start         # some text
    \s            # white space char
    (group)       # first group
    (?:alt1|alt2) # some alternation
    end
  /x
  ```

* <a name="gsub-blocks"></a> For complex replacements `sub`/`gsub` can be used with block or hash.<sup>[[link](#gsub-blocks)]</sup>

## Процентные литералы

* <a name="percent-q-shorthand"></a> Используйте `%()` (это сокращение от `%Q`) для строк без переносов, в которых  реализуется интерполяция и присутствуют двойные кавычки. Для строк с переносами
  лучше используйте формат HERE Doc.
<sup>[[link](#percent-q-shorthand)]</sup>

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

* <a name="percent-q"></a> Избегайте `%q`, если это не случай строки с `'` и `"` одновременно  Обычные строки читаются проще, и их следует использовать, если нет
  излишне большого количества символов, которые нужно будет экранировать.
<sup>[[link](#percent-q)]</sup>

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

* <a name="percent-r"></a> Используйте `%r` только для регулярных выражений, которые обрабатывают больше одного знака '/'.<sup>[[link](#percent-r)]</sup>

  ```Ruby
  # плохо
  %r(\s+)

  # все еще плохо
  %r(^/(.*)$)
  # должно быть /^\/(.*)$/

  # хорошо
  %r(^/blog/2011/(.*)$)
  ```

* <a name="percent-x"></a> Откажитесь от использования `%x`, если вы не хотите вызывать внешнюю команду с обратными кавычками в теле  (что само по себе маловероятно).
<sup>[[link](#percent-x)]</sup>

  ```Ruby
  # плохо
  date = %x(date)

  # хорошо
  date = `date`
  echo = %x(echo `date`)
  ```

* <a name="percent-s"></a> Старайтесь избегать `%s`. По общепринятому мнению, предпочтительным способом  определения символа с пробелами в имени является `:"some string"`
<sup>[[link](#percent-s)]</sup>

* <a name="percent-literal-braces"></a> Используйте `()` в качестве ограничителей для всех литералов со знаком `%` кроме `%r`.  Так как круглые скобки очень часто используются в самих регулярных выражениях, во
  многих случаях менее частый символ `{` может быть лучшим выбором для ограничителя
  (разумеется, с учетом смысла регулярного выражения).
<sup>[[link](#percent-literal-braces)]</sup>

  ```Ruby
  # плохо
  %w[one two three]
  %q{"Test's king!", John said.}

  # хорошо
  %w(one two three)
  %q("Test's king!", John said.)
  ```

## Метапрограммирование

* <a name="no-metaprogramming-masturbation"></a> Avoid needless metaprogramming.<sup>[[link](#no-metaprogramming-masturbation)]</sup>

* <a name="no-monkey-patching"></a> Do not mess around in core classes when writing libraries.  (Do not monkey-patch them.)
<sup>[[link](#no-monkey-patching)]</sup>

* <a name="block-class-eval"></a> The block form of `class_eval` is preferable to the string-interpolated form.  - when you use the string-interpolated form, always supply `__FILE__` and `__LINE__`,
    so that your backtraces make sense:
<sup>[[link](#block-class-eval)]</sup>

  ```ruby
  class_eval 'def use_relative_model_naming?; true; end', __FILE__, __LINE__
  ```

  - `define_method` is preferable to `class_eval{ def ... }`

* <a name="eval-comment-docs"></a> When using `class_eval` (or other `eval`) with string interpolation, add a comment block  showing its appearance if interpolated (a practice used in Rails code):
<sup>[[link](#eval-comment-docs)]</sup>

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

* <a name="no-method-missing"></a> Avoid using `method_missing` for metaprogramming because backtraces become messy,  the behavior is not listed in `#methods`, and misspelled method calls might silently
  work, e.g. `nukes.launch_state = false`. Consider using delegation, proxy, or
  `define_method` instead. If you must use `method_missing`:
<sup>[[link](#no-method-missing)]</sup>

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

* <a name="always-warn"></a> Write `ruby -w` safe code.<sup>[[link](#always-warn)]</sup>

* <a name="no-optional-hash-params"></a> Avoid hashes as optional parameters. Does the method do too much? (Object initializers are exceptions for this rule).<sup>[[link](#no-optional-hash-params)]</sup>

* <a name="short-methods"></a> Avoid methods longer than 10 LOC (lines of code). Ideally, most methods will be shorter than  5 LOC. Empty lines do not contribute to the relevant LOC.
<sup>[[link](#short-methods)]</sup>

* <a name="too-many-params"></a> Avoid parameter lists longer than three or four parameters.<sup>[[link](#too-many-params)]</sup>

* <a name="private-global-methods"></a> If you really need "global" methods, add them to Kernel  and make them private.
<sup>[[link](#private-global-methods)]</sup>

* <a name="instance-vars"></a> Use module instance variables instead of global variables.<sup>[[link](#instance-vars)]</sup>

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

* <a name="alias-method"></a> Избегайте использования `alias`, если достаточно использовать `alias_method`.<sup>[[link](#alias-method)]</sup>

* <a name="optionparser"></a> Используйте `OptionParser` для анализа сложных аргуметов
  командрой строки и  `ruby -s` для элеметарных случаев.<sup>[[link](#optionparser)]</sup>

* <a name="time-now"></a> Используйте вариант `Time.now`, а не `Time.new`, когда хотите получить текущее
  значение системного времени.<sup>[[link](#time-now)]</sup>

* <a name="functional-code"></a> Пишите код в функциональном стиле без изменения значений, когда это подходит
  по смыслу.<sup>[[link](#functional-code)]</sup>

* <a name="no-arg-mutations"></a> Не изменяйте значения аргументов, если только это
  не есть цель метода.<sup>[[link](#no-arg-mutations)]</sup>

* <a name="three-is-the-number-thou-shalt-count"></a> Старайтесь не создавать вложенные структуры
  с уровнем вложения больше третьего.<sup>[[link](#three-is-the-number-thou-shalt-count)]</sup>

* <a name="be-consistent"></a> Будьте последовательны. В идеальном мире последовательно придерживайтесь
  данного руководства.<sup>[[link](#be-consistent)]</sup>

* <a name="common-sense"></a> Руководствуйтесь здравым смыслом.<sup>[[link](#common-sense)]</sup>

## Инструментарий

В этом разделе собраны инструменты, которые могут помочь вам автоматически
сверить ваш код на Руби с предписаниями этого руководства.

### РубоКоп

[RuboCop](https://github.com/bbatsov/rubocop) - это утиллита проверки стиля
программного кода на Руби, который основывается на этом руководстве.
РубоКоп уже реализует большую часть этого руководства, поддерживает MRI 1.9
и MRI 2.0 и хорошо интегрируется с редактором Емакс.

### RubyMine

Модуль проверки кода [RubyMine](http://www.jetbrains.com/ruby/)
[частично основывается](http://confluence.jetbrains.com/display/RUBYDEV/RubyMine+Inspections)
на этом руководстве.

# Сотрудничество

Ничто, описанное в этом руководстве, не высечено в камне. И я очень хотел бы
сотрудничать со всеми, кто интересуется стилистикой оформления кода на Руби,
чтобы мы смогли вместе создать ресурс, который был бы полезен для всего сообщества
программистов на Руби.

Не стесняйтесь создавать отчеты об ошибках и присылать мне запросы на интеграцию
вашего кода. И заранее большое спасибо за вашу помощь!

Вы можете поддержать проект (и РубоКоп) денежным взносом
при помощи [gittip](https://www.gittip.com/bbatsov).

[![Support via Gittip](https://rawgithub.com/twolfson/gittip-badge/0.2.0/dist/gittip.png)](https://www.gittip.com/bbatsov)

## Как сотрудничать в проекте?

Это просто! Следуйте [руководству по
сотрудничеству](https://github.com/bbatsov/ruby-style-guide/blob/master/CONTRIBUTING.md).

# Лицензирование

![Creative Commons License](http://i.creativecommons.org/l/by/3.0/88x31.png)
This work is licensed under a [Creative Commons Attribution 3.0 Unported
License](http://creativecommons.org/licenses/by/3.0/deed.en_US)

# Расскажи другому

A community-driven style guide is of little use to a community that
doesn't know about its existence. Tweet about the guide, share it with
your friends and colleagues. Every comment, suggestion or opinion we
get makes the guide just a little bit better. And we want to have the
best possible guide, don't we?

Всего,<br/>
[Божидар](https://twitter.com/bbatsov)
