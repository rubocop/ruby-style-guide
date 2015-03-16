# Вступление

> Ролевые модели важны. <br/>
> -- Офицер Алекс Мёрфи / Робот-полицейский

Один из вопросов, который меня всегда беспокоил как разработчика на Руби,
&mdash; это то, что у разработчиков на Питоне есть великолепное руководствo
по стилю оформления ([PEP-8][]), а у нас
никогда не было официального руководства, описывавшего бы стиль оформления кода
на Руби и дающего примеры его успешного применения. Я же уверен, что стиль
оформления крайне важен. Также я верю, что такое замечательное сообщество
разработчиков, которое есть у Руби, вполне имеет силы создать этот давно
назревший документ.

Это наставление появилось на свет в нашей фирме в виде внутреннего руководства
по оформлению кода на Руби (составленного вашим покорным слугой). И в какой-то
момент я решил, что данная работа, которой я тогда занимался, может быть
интересной и другим членам сообщества программистов на Руби и что миру вовсе
не нужно еще одно руководство для внутреннего пользования: окружающий мир может
получить пользу от совместно создаваемого и одобренного сообществом набора
практик, идиом и стилистических предписаний для программирования на Руби.

Со времени опубликования этого руководства я получил многочисленные отклики
от членов сообщества программистов на Руби из разных уголков со всего мира. Я
очень благодарен им за полезные предложения и поддержку! Нашими общими усилиями
мы сможем сделать этот ресурс полезным для всех и каждого разработчика на Руби.

И кстати, если вы работаете с Rails, вы можете взглянуть на дополняющее это
руководство [Ruby on Rails 3 & 4: Руководство по стилю оформления][rails-style-guide].

# Руби: руководство по стилю оформления

Это руководство по оформлению кода на Руби дает передовые рекомендации, так что
обычный программист на Руби сможет создавать код, который с легкостью смогут
поддерживать другие обычные программисты на Руби. Руководство по оформлению,
которое отражает повседневную практику, будет применяться постоянно, а руководство,
стремящееся к идеалу, который не принимается обычными людьми, подвергается риску
вообще быть забытым &mdash; не важно, насколько хорошим оно является.

Данное руководство разделено на несколько частей, состоящий из связанных по смыслу
правил. В каждом случае я попытался обосновать появление этих правил (объяснение
опущено в ситуациях, когда я посчитал его очевидным).

Все эти правила не появились из пустоты, они по большей части основываются на моем
собственном обширном профессиональном опыте в качестве разработчика ПО, отзывах
и предложениях других членов сообщества программистов на Руби и различных
общепризнанных источниках по программированию на Руби, например,
["Programming Ruby 1.9"][pickaxe] и ["Язык программирования Ruby"][trpl]
(в оригинале ["The Ruby Programming Language"][entrpl]).

Во многих областях до сих пор нет единого мнения в среде разработчиков на Руби
относительно конкретных аспектов стиля оформления (например, оформление строк
в кавычках, пробелы при оформлении хешей, месторасположение точки при
многострочном последовательном вызове методов и т.д.). В таких ситуациях мы
рассматривали все распространенные стили, вам же решать, какой из этих стилей
вы будете применять последовательно в вашем коде.

Это руководство все еще находится в процессе создания: у многих правил нет
примеров, у других нет примеров, достаточно ясно объясняющих эти правила. В свое
время каждое правило найдет свое объяснение, а пока просто примите их к сведению.

Вы можете создать копию этого руководства в форматах PDF или HTML при помощи
[Transmuter][].

[RuboCop][] &mdash; это анализатор кода, основывающийся на правилах этого
руководства по оформлению.

Переводы данного руководства доступны на следующих языках:

* [английский (исходная версия)](https://github.com/bbatsov/ruby-style-guide/blob/master/README.md)
* [вьетнамский](https://github.com/scrum2b/ruby-style-guide/blob/master/README-viVN.md)
* [испанский](https://github.com/alemohamad/ruby-style-guide/blob/master/README-esLA.md)
* [китайский традиционный](https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhTW.md)
* [китайский упрощенный](https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhCN.md)
* [корейский](https://github.com/dalzony/ruby-style-guide/blob/master/README-koKR.md)
* [немецкий](https://github.com/arbox/ruby-style-guide/blob/master/README-deDE.md)
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

> Почти все убеждены, что любой стиль кроме их собственного ужасен и нечитаем.
> Уберите отсюда "кроме их собственного" &mdash; и они будут, наверное, правы... <br/>
> -- Джерри Коффин (Jerry Coffin) об отступах

* <a name="utf-8"></a> Используйте `UTF-8` в качестве кодировки для исходного
  кода.<sup>[[ссылка](#utf-8)]</sup>

* <a name="spaces-indentation"></a> Используйте два **пробела** на уровень
  отступа (т.е. мягкую табуляцию). Никаких знаков табуляции.
  <sup>[[ссылка](#spaces-indentation)]</sup>

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

* <a name="crlf"></a> Используйте стиль Unix для строк (пользователи
  *BSD/Solaris/Linux/OS X используют их по умолчанию,  пользователям Windows
  нужно обратить особое внимание).<sup>[[ссылка](#crlf)]</sup>

  * Если вы используете Git, вы можете добавить следующие настройки
    в вашу конфигурацию, чтобы предотвратить ненамеренное проникновение в ваш
    код строк, оканчивающихся в стиле Windows:

    ```bash
    $ git config --global core.autocrlf true
    ```

* <a name="no-semicolon"></a> Не используйте `;` для разделения директив и
  выражений. Отсюда непосредсвенно следует, что каждая директива должна занимать
  свою отдельную строку.<sup>[[ссылка](#no-semicolon)]</sup>

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

* <a name="single-line-classes"></a> Используйте преимущественно однострочный
  формат для определений классов с пустым телом.
  <sup>[[ссылка](#single-line-classes)]</sup>

  ```Ruby
  # плохо
  class FooError < StandardError
  end

  # сносно
  class FooError < StandardError; end

  # хорошо
  FooError = Class.new(StandardError)
  ```

* <a name="no-single-line-methods"></a> Избегайте однострочных методов. И хотя
  они достаточно популярны в среде программистов, существует множество
  неприятных мелочей, связанных с синтаксисом их определения, которые делают
  применение таких методов нежелательным. В любом случае однострочные методы не
  должны содержать больше одного выражения.
  <sup>[[ссылка](#no-single-line-methods)]</sup>


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

  Одним исключением в этом правиле являются методы с пустым телом.

  ```Ruby
  # хорошо
  def no_op; end
  ```

* <a name="spaces-operators"></a> Вставляйте пробелы вокруг операторов, после
  запятых, двоеточий и точек с запятыми,  вокруг `{` и перед `}`.
  Пробелы (по большей части) игнорируются интерпретатором Руби, но
  их правильное использование является ключом к написанию легко читаемого кода.
  <sup>[[ссылка](#spaces-operators)]</sup>

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
  и применяйте его последовательно.

* <a name="no-spaces-braces"></a> Не используйте пробел после `(`, `[` или перед
  `]`, `)`.<sup>[[ссылка](#no-spaces-braces)]</sup>

  ```Ruby
  some(arg).other
  [1, 2, 3].size
  ```

* <a name="no-space-bang"></a> Не используйте пробел после `!`.
  <sup>[[ссылка](#no-space-bang)]</sup>

  ```Ruby
  # плохо
  ! something

  # хорошо
  !something
  ```
* <a name="no-space-inside-range-literals"></a>  Записывайте литералы диапазонов
  без пробелов.<sup>[[link](#no-space-inside-range-literals)]</sup>

    ```Ruby
    # плохо
    1 .. 3
    'a' ... 'z'

    # хорошо
    1..3
    'a'...'z'
    ```

* <a name="indent-when-to-case"></a> Делайте отступ для `when` таким же, как и
  для `case`. Я знаю, что многие не согласятся  с этим, но этот стиль
  предписывается как "Языком программирования Ruby", так и "Programming Ruby".
  <sup>[[ссылка](#indent-when-to-case)]</sup>

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

* <a name="indent-conditional-assignment"></a> Присваивая результат условного
  выражения переменной, сохраняйте соответствие уровней отступа.
  <sup>[[ссылка](#indent-conditional-assignment)]</sup>

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

* <a name="empty-lines-between-methods"></a> Используйте пустые строки для
  разделения определений методов и выделения логических частей определений
  внутри них.<sup>[[ссылка](#empty-lines-between-methods)]</sup>

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


* <a name="no-trailing-params-comma"></a>  Избегайте запятых после последнего
  параметра в вызове метода, особенно когда параметры расположены в отдельных
  строках.<sup>[[ссылка](#no-trailing-params-comma)]</sup>


  ```Ruby
  # плохо, хотя проще перемещать/добавлять/удалять строки
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

* <a name="spaces-around-equals"></a> Вставляйте пробелы вокруг оператора
  присваивания `=`, когда назначаете параметрам метода значения по умолчанию:
  <sup>[[ссылка](#spaces-around-equals)]</sup>


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

  Хотя в некоторых книгах по Ruby рекомендуют первый стиль, второй
  гораздо более нагляден.

* <a name="no-trailing-backslash"></a> Не используйте символ продления строк `\`
  везде, где можно обойтись без него. Практически не используйте его нигде,
  кроме как при конкатенации строк.<sup>[[ссылка](#no-trailing-backslash)]</sup>


  ```Ruby
  # плохо
  result = 1 - \
           2

  # возможно (но ужасно)
  result = 1 \
           - 2

  long_string = 'First part of the long string' \
                ' and second part of the long string'
  ```

* <a name="consistent-multi-line-chains"></a> Используйте единый стиль
  многострочных последовательных цепочек вызовов методов. В сообществе Руби
  популярны два взаимоисключающих стиля их оформления: с точкой в начале
  (вариант A) и с точкой в конце (вариант B).
  <sup>[[ссылка](#consistent-multi-line-chains)]</sup>

  * **A** Когда продолжаете цепочку вызовов методов на
  следующую строку, начинайте её с точки.

    ```Ruby
    # плохо - нужно посмотреть на предыдущую строку, чтобы понять
    # смысл последующей
    one.two.three.
      four

    # хорошо - сразу ясно, что происходит во второй строке
    one.two.three
      .four
    ```

  * **B** Соответственно, наоборот, когда продолжаете цепочку
  вызовов на следующей строке, завершайте строку точкой `.`, давая
  понять, что продолжение выражения следует

    ```Ruby
    # плохо - чтобы понять, что выражение не окончено, необходимо
    # посмотреть на следующую строку.
    one.two.three
      .four

    # хорошо - сразу видно, что выражение будет продолжено на
    # следующей строке
    one.two.three.
      four
    ```

 C аргументами за и против обоих стилей можно ознакомиться в дискуссии
  [здесь](https://github.com/bbatsov/ruby-style-guide/pull/176).

* <a name="no-double-indent"></a> Выравнивайте параметры вызова метода, если
  вызов занимает более одной строки. Если выравнивание невозможно из-за
  ограничений на длину строки, то используйте одинарный отступ.
  <sup>[[ссылка](#no-double-indent)]</sup>

  ```Ruby
  # первоначальный вариант (строка слишком длинная)
  def send_mail(source)
    Mailer.deliver(to: 'bob@example.com', from: 'us@example.com', subject: 'Important message', body: source.text)
  end

  # плохо (двойной отступ)
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

  # хорошо (одинарный отступ)
  def send_mail(source)
    Mailer.deliver(
      to: 'bob@example.com',
      from: 'us@example.com',
      subject: 'Important message',
      body: source.text
    )
  end
  ```

* <a name="align-multiline-arrays"></a> Выравнивайте элементы литералов массива,
  если они занимают несколько строк.<sup>[[ссылка](#align-multiline-arrays)]</sup>

  ```Ruby
  # плохо
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

* <a name="underscores-in-numerics"></a> Добавляйте символ подчеркивания
  в большие числовые константы для улучшения их восприятия.
  <sup>[[ссылка](#underscores-in-numerics)]</sup>

  ```Ruby
  # плохо (Сколько тут нолей?)
  num = 1000000

  # хорошо (число воспринимается гораздо легче)
  num = 1_000_000
  ```

* <a name="rdoc-conventions"></a> Используйте устоявшиеся правила RDoc
  для описания интерфейсов. Не отделяйте блок комментария от начала определения
  метода `def` пустой строкой.<sup>[[ссылка](#rdoc-conventions)]</sup>

* <a name="80-character-limits"></a> Ограничивайте длину строк 80-ю
  символами.<sup>[[ссылка](#80-character-limits)]</sup>

* <a name="no-trailing-whitespace"></a> Не оставляйте пробелы в конце строки.
  <sup>[[ссылка](#no-trailing-whitespace)]</sup>

* <a name="newline-eof"></a> Завершайте каждый файл переводом строки.
  <sup>[[ссылка](#newline-eof)]</sup>

* <a name="no-block-comments"></a> Не пользуйтесь блочными комментариями. Их
  нельзя разместить на необходимом уровне отступа. К тому же их сложнее
  воспринимать, чем обычные комментарии.<sup>[[ссылка](#no-block-comments)]</sup>

  ```Ruby
  # плохо
  =begin
  строка комментария
  еще одна строка комментария
  =end

  # хорошо
  # строка комментария
  # другая строка комментария
  ```

## Синтаксис

* <a name="double-colons"></a>
  Используйте `::` только для обращения к константам (в том числе к классам и
  модулям)  и конструкторам класса (например, `Array()` или `Nokogiri::HTML()`).
  Никогда не используйте `::` для обычного вызова методов.
  <sup>[[ссылка](#double-colons)]</sup>

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

* <a name="method-parens"></a>
  Используйте `def` со скобками, когда у метода есть параметры. Опускайте
  скобки, когда метод не принимает параметров.
  <sup>[[ссылка](#method-parens)]</sup>

   ```Ruby
   # плохо
   def some_method()
     # некоторый код
   end

   # хорошо
   def some_method
     # некоторый код
   end

   # плохо
   def some_method_with_parameters param1, param2
     # некоторый код
   end

   # хорошо
   def some_method_with_parameters(param1, param2)
     # некоторый код
   end
   ```

* <a name="no-for-loops"></a> Используйте оператор `for` только в случаях, когда
  вы точно знаете, зачем вы это делаете. В подавляющем большинстве остальных случаев
  стоит применять итераторы. Оператор `for` реализуется при помощи `each` (таким
  образом вы добавляете еще один уровень абстракции), но с некоторыми отличиями:
  не создается отдельная область видимости (в отличии от `each`) и переменные,
  объявленные в теле `for`, будут видны за пределами блока.
  <sup>[[ссылка](#no-for-loops)]</sup>

  ```Ruby
  arr = [1, 2, 3]

  # плохо
  for elem in arr do
    puts elem
  end

  # Учтите, elem доступен за пределами цикла
  elem #=> 3

  # хорошо
  arr.each { |elem| puts elem }

  # elem недоступен за пределами блока each
  elem #=> NameError: undefined local variable or method `elem'
  ```

* <a name="no-then"></a> Не используйте `then` для условий `if/unless`,
  объявленных на нескольких строках.<sup>[[ссылка](#no-then)]</sup>

  ```Ruby
  # плохо
  if some_condition then
    # некоторое действие
  end

  # хорошо
  if some_condition
    # некоторое действие
  end
  ```


* <a name="same-line-condition"></a> Всегда записывайте условие для `if/unless`
  на той же строке, что содержит `if/then` в многострочном условии.
  <sup>[[ссылка](#same-line-condition)]</sup>

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

* <a name="ternary-operator"></a> Предпочитайте тернарный оператор (`?:`)
  конструкциям с `if/then/else/end`. Он используется чаще и по определению
  более краток.<sup>[[ссылка](#ternary-operator)]</sup>

  ```Ruby
  # плохо
  result = if some_condition then something else something_else end

  # хорошо
  result = some_condition ? something : something_else
  ```

* <a name="no-nested-ternary"></a> Используйте только одно выражение в каждой
  ветви тернарного оператора. Отсюда следует, что лучше избегать вложенных
  тернарных операторов. При возникновении такой необходимости применяйте
  конструкции с `if/else`.<sup>[[ссылка](#no-nested-ternary)]</sup>

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

* <a name="no-1.8-if-syntax"></a>
  Не используйте `if x: ...`, в Руби 1.9 эту синтаксическую конструкцию удалили,
  используйте вместо нее тернарные операторы.
  <sup>[[ссылка](#no-1.8-if-syntax)]</sup>

  ```Ruby
  # плохо
  result = if some_condition: something else something_else end

  # хорошо
  result = some_condition ? something : something_else
  ```

* <a name="no-semicolon-ifs"></a>
  Не используйте точку с запятой в `if x; ...`. Применяйте тернарные операторы.
  <sup>[[ссылка](#no-semicolon-ifs)]</sup>

* <a name="use-if-case-returns"></a>
  Извлекайте пользу из такого факта, что `if` и `case` являются выражениями,
  возвращающими результирующие значения.
  <sup>[[ссылка](#use-if-case-returns)]</sup>

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

* <a name="one-line-cases"></a> Применяйте `when x then ...` для однострочных
  выражений. Вариант записи  `when x: ...` был удален, начиная с Руби 1.9.
  <sup>[[ссылка](#one-line-cases)]</sup>

* <a name="no-when-semicolons"></a> Не используйте `when x; ...` по аналогии
  с предыдущим правилом.<sup>[[ссылка](#no-when-semicolons)]</sup>

* <a name="bang-not-not"></a> Используйте `!` вместо `not`.
  <sup>[[ссылка](#bang-not-not)]</sup>

  ```Ruby
  # плохо (необходимы скобки из-за неоднозначности приоритетов операторов)
  x = (not something)

  # хорошо
  x = !something
  ```

* <a name="no-bang-bang"></a> Не используйте `!!`.
  <sup>[[ссылка](#no-bang-bang)]</sup>

  ```Ruby
  # плохо
  x = 'test'
  # неявная проверка на nil
  if !!x
    # некоторое выражение
  end

  x = false
  # двойное отрицание бессмысленно для булевых значений
  !!x # => false

  # хорошо
  x = 'test'
  unless x.nil?
    # некоторое выражение
  end
  ```

* <a name="no-and-or-or"></a> Ключевые слова `and` и `or` следует забыть. Они
  не несут дополнительной пользы. Всегда используйте `&&` и `||` вместо них.
  <sup>[[ссылка](#no-and-or-or)]</sup>

  ```Ruby
  # плохо
  # булево выражение
  if some_condition and some_other_condition
    do_something
  end

  # управление потоком исполнения
  document.saved? or document.save!

  # хорошо
  # булево выражение
  if some_condition && some_other_condition
    do_something
  end

  # управление потоком исполнения
  document.saved? || document.save!
  ```

* <a name="no-multiline-ternary"></a> Избегайте многострочных тернарных
  операторов `? :`. Используйте вместо них `if/unless`.
  <sup>[[ссылка](#no-multiline-ternary)]</sup>

* <a name="if-as-a-modifier"></a> Для однострочных выражений по возможности
  модификатор `if/unless`. Другим хорошим вариантом являются операторы
  управления потоком исполнения `&&/||`.
  <sup>[[ссылка](#if-as-a-modifier)]</sup>

  ```Ruby
  # плохо
  if some_condition
    do_something
  end

  # хорошо
  do_something if some_condition

  # еще хороший вариант
  some_condition && do_something
  ```

* <a name="no-multiline-if-modifiers"></a>  Избегайте `if/unless` в конце
  нетривиального многострочного блока.
  <sup>[[ссылка](#no-multiline-if-modifiers)]</sup>

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

* <a name="unless-for-negatives"></a> Используйте `unless` вместо `if`
  для отрицательных условий (или `||` для управления потоком исполнения).
  <sup>[[ссылка](#unless-for-negatives)]</sup>

  ```Ruby
  # плохо
  do_something if !some_condition

  # плохо
  do_something if not some_condition

  # хорошо
  do_something unless some_condition

  # тоже хорошо
  some_condition || do_something
  ```

* <a name="no-else-with-unless"></a> Не используйте `unless` вместе с `else`.
  Перепишите такие выражение с положительной проверкой.
  <sup>[[ссылка](#no-else-with-unless)]</sup>

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

* <a name="no-parens-if"></a> Не используйте скобки для ограничения условных
  выражений в `if/unless/while/until`.<sup>[[ссылка](#no-parens-if)]</sup>

  ```Ruby
  # плохо
  if (x > 10)
    # код опущен для краткости
  end

  # хорошо
  if x > 10
    # код опущен для краткости
  end
  ```
  Однако в этом правиле есть некоторые исключения, например,
  [надежные присвоения в условных выражениях](#safe-assignment-in-condition).

* <a name="no-multiline-while-do"></a> Не используйте `while/until УСЛОВИЕ do`
  для многострочных циклов с `while/until`.
  <sup>[[ссылка](#no-multiline-while-do)]</sup>

  ```Ruby
  # плохо
  while x > 5 do
    # код опущен для краткости
  end

  until x > 5 do
    # код опущен для краткости
  end

  # хорошо
  while x > 5
    # код опущен для краткости
  end

  until x > 5
    # код опущен для краткости
  end
  ```

* <a name="while-as-a-modifier"></a> Используйте `while/until` для однострочный
  выражений.<sup>[[ссылка](#while-as-a-modifier)]</sup>

  ```Ruby
  # плохо
  while some_condition
    do_something
  end

  # хорошо
  do_something while some_condition
  ```
* <a name="until-for-negatives"></a> Используйте `until` вместо `while`
  для условий на отрицания.<sup>[[ссылка](#until-for-negatives)]</sup>

  ```Ruby
  # плохо
  do_something while !some_condition

  # хорошо
  do_something until some_condition
  ```
* <a name="infinite-loop"></a> Используйте `Kernel#loop` вместо `while/until`
  для бесконечного цикла.<sup>[[ссылка](#infinite-loop)]</sup>

    ```Ruby
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

* <a name="loop-with-break"></a> Используйте `Kernel#loop` с `break` вместо
  `begin/end/until` или `begin/end/while` для циклов с постусловием.
  <sup>[[ссылка](#loop-with-break)]</sup>

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

* <a name="no-dsl-parens"></a> Не используйте скобки при вызове методов,
  являющихся частью таких DSL, как Rake, Rails, RSpec, методов, имеющих
  статус ключевого слова, например, `attr_reader`, `puts` и при вызове
  аксессоров. Используйте скобки при вызове прочих методов.
  <sup>[[ссылка](#no-dsl-parens)]</sup>

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

* <a name="no-braces-opts-hash"></a> Не используйте фигурные скобки для
  ограничения хешей, передаваемых методу.
  <sup>[[ссылка](#no-braces-opts-hash)]</sup>

  ```Ruby
  # плохо
  user.set({ name: 'John', age: 45, permissions: { read: true } })

  # хорошо
  user.set(name: 'John', age: 45, permissions: { read: true })
  ```

* <a name="no-dsl-decorating"></a> Не используйте фигурные скобки для
  ограничения хешей, передаваемых методу, и скобки вокруг параметров для
  методов, являющихся частью DSL.
  <sup>[[ссылка](#no-dsl-decorating)]</sup>

  ```Ruby
  class Person < ActiveRecord::Base
    # плохо
    validates(:name, { presence: true, length: { within: 1..10 } })

    # хорошо
    validates :name, presence: true, length: { within: 1..10 }
  end
  ```

* <a name="no-args-no-parens"></a> Опускайте скобки при вызове метода без
  параметров.
  <sup>[[ссылка](#no-args-no-parens)]</sup>


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

* <a name="single-line-blocks"></a> Используйте преимущественно `{...}` в случае
  однострочных блоков, а `do...end` в случае многострочных блоков (многострочные
  последовательности вызовов методов всегда выглядят ужасно). Старайтесь
  применять `do...end` для логических операций и определений методов (например,
  для Rakefile и некоторых DSL). Не используйте `do...end` в цепочках вызовов.
  <sup>[[ссылка](#single-line-blocks)]</sup>

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

  Некоторые из нас поспорят, что многострочные последовательные вызовы с блоками
  при использовании {...} выглядят неплохо, но тогда стоит себя спросить, а
  читается ли такой код и не стоит ли выделить эти блоки в отдельные специальные
  методы.

* <a name="block-argument"></a> Попробуйте использовать блоки напрямую в виде
  аргумента в случае, когда блок просто передает свои аргументы в другой блок.
  В этом случае обратите внимание на падение производительности, так как
  аргументы будут преобразованы в объект класс `Proc`.
  <sup>[[ссылка](#block-argument)]</sup>

  ```Ruby
  require 'tempfile'

  # плохо
  def with_tmp_dir
    Dir.mktmpdir do |tmp_dir|
      # блок просто передает аргументы дальше
      Dir.chdir(tmp_dir) { |dir| yield dir }
    end
  end

  # хорошо
  def with_tmp_dir(&block)
    Dir.mktmpdir do |tmp_dir|
      Dir.chdir(tmp_dir, &block)
    end
  end

  with_tmp_dir do |dir|
    puts "dir доступен в виде параметра, и pwd имеет значение: #{dir}"
  end
  ```

* <a name="no-explicit-return"></a> Избегайте ключевого слова `return` везде,
  где это не нужно для управления ветвлением.
  <sup>[[ссылка](#no-explicit-return)]</sup>

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

* <a name="no-self-unless-required"></a> Избегайте ключевого слова `self` везде,
  где оно не требуется.  Оно необходимо только при вызове методов доступа
  (`attr_reader`, `attr_writer`, `attr_accessor`).
  <sup>[[ссылка](#no-self-unless-required)]</sup>

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

* <a name="no-shadowing"></a> В качестве бездоказательного утверждения:
  избегайте маскирования методов локальными переменными, если они не
  эквивалентны.
  <sup>[[ссылка](#no-shadowing)]</sup>

  ```Ruby
  class Foo
    attr_accessor :options

    # cносно
    # как options, так и self.options здесь эквивалентны
    def initialize(options)
      self.options = options
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

* <a name="safe-assignment-in-condition"></a> Используйте возвращаемое
  оператором присваивания (`=`) значение только в случаях, когда все
  выражение стоит в скобках. Эта идиома достаточно распространена среди
  программистов на Руби и часто называется *надежное присваивание в логических
  выражениях*.
  <sup>[[ссылка](#safe-assignment-in-condition)]</sup>


  ```Ruby
  # плохо (к тому же вызывает предупреждение)
  if v = array.grep(/foo/)
    do_something(v)
    ...
  end

  # хорошо (MRI будет вызывает предупреждение, но не Рубокоп)
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

* <a name="self-assignment"></a>
  По возможности используйте сокращенные операторы присваивания.
  <sup>[[ссылка](#self-assignment)]</sup>

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

* <a name="double-pipe-for-uninit"></a>
  Используйте оператор `||=` для инициализации переменных, только если
  переменная еще не инициализирована.
  <sup>[[ссылка](#double-pipe-for-uninit)]</sup>

  ```Ruby
  # плохо
  name = name ? name : 'Bozhidar'

  # плохо
  name = 'Bozhidar' unless name

  # хорошо (присвоить переменной name значение Bozhidar, только если ее значение
  # nil или false
  name ||= 'Bozhidar'
  ```

* <a name="no-double-pipes-for-bools"></a>
  Не используйте оператор `||=` для инициализации логических переменных.
  Это вызовет проблемы, если текущим значением переменной будет `false`.
  <sup>[[ссылка](#no-double-pipes-for-bools)]</sup>

  ```Ruby
  # плохо (назначит переменной enabled значение true, даже если оно было false)
  enabled ||= true

  # хорошо
  enabled = true if enabled.nil?
  ```

* <a name="double-amper-preprocess"></a>
  Используйте оператор `&&=` для предварительной работы с переменными, которые
  уже или еще не инициализированы. Использование оператора `&&=` изменит
  значение переменной, только если она инициализирована. При этом отпадает
  необходимость в проверке с `if`.
  <sup>[[ссылка](#double-amper-preprocess)]</sup>

  ```Ruby
  # плохо
  if something
    something = something.downcase
  end

  # плохо
  something = something ? something.downcase : nil

  # сносно
  something = something.downcase if something

  # хорошо
  something = something && something.downcase

  # еще лучше
  something &&= something.downcase
  ```

* <a name="no-case-equality"></a>
  Избегайте явного использования оператора равенства в case `===`. Как
  подсказывает его имя, этот оператор предназначен для имплицитного
  применения в выражениях `case`, в отрыве от них он приводит только к
  разночтениям в коде.
  <sup>[[ссылка](#no-case-equality)]</sup>

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
* <a name="eql"></a>
  Не используйте `eql?`, если будет достаточно `==`. Более строгая семантика
  сравнения, реализованная в `eql?`, достаточно редко нужна на практике.
  <sup>[[link](#eql)]</sup>

  ```Ruby
  # плохо (`eql?` работает для строк, как и  `==`)
  "ruby".eql? some_str

  # хорошо
  "ruby" == some_str
  1.0.eql? x # здесь `eql?` имеет смысл, если вы хотите различать классы числа: `Fixnum` vs. `Float`
  ```

* <a name="no-cryptic-perlisms"></a>
  Избегайте специальных переменных, заимствованых из языка Перл, например, `$:`,
  `$;` и т.д. Они сложно воспринимаются, и их использование приветствуется
  только в однострочных скриптах. В остальных случаях применяйте легкие для
  восприятия варианты этих переменных из библиотеки `English`.
  <sup>[[ссылка](#no-cryptic-perlisms)]</sup>

  ```Ruby
  # плохо
  $:.unshift File.dirname(__FILE__)

  # хорошо
  require 'English'
  $LOAD_PATH.unshift File.dirname(__FILE__)
  ```

* <a name="parens-no-spaces"></a>
  Не оставляйте пробел между именем метода и открывающей скобкой.
  <sup>[[ссылка](#parens-no-spaces)]</sup>

  ```Ruby
  # плохо
  f (3 + 2) + 1

  # хорошо
  f(3 + 2) + 1
  ```

* <a name="parens-as-args"></a>
  Если первый аргумент при вызове метода начинается скобкой, то всегда
  используйте скобки при вызове метода. Например, пишем так: `f((3 + 2) + 1)`.
  <sup>[[ссылка](#parens-as-args)]</sup>

* <a name="always-warn-at-runtime"></a>
  Всегда вызывайте интерпретатор Руби с ключом `-w`, чтобы получать напоминия о
  правилах, описанных выше, даже если вы о них забываете.
  <sup>[[ссылка](#always-warn-at-runtime)]</sup>

* <a name="lambda-multi-line"></a>
  Используйте новый синтаксис лямбда-выражений для однострочных блоков. Используйте
  метод `lambda` для многострочных блоков.
  <sup>[[ссылка](#lambda-multi-line)]</sup>

  ```Ruby
  # плохо
  l = lambda { |a, b| a + b }
  l.call(1, 2)

  # верно, но выглядит очень странно
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

* <a name="proc"></a>
  Используйте `proc` вместо `Proc.new`.
  <sup>[[ссылка](#proc)]</sup>

  ```Ruby
  # плохо
  p = Proc.new { |n| puts n }

  # хорошо
  p = proc { |n| puts n }
  ```

* <a name="proc-call"></a>
  Используйте `proc.call()` вместо `proc[]` или `proc.()` для
  лямбда-выражений и блоков.
  <sup>[[ссылка](#proc-call)]</sup>

  ```Ruby
  # плохо (выглядит как доступ к энумератору)
  l = ->(v) { puts v }
  l[1]

  # тоже плохо (редкая формулировка)
  l = ->(v) { puts v }
  l.(1)

  # хорошо
  l = ->(v) { puts v }
  l.call(1)
  ```

* <a name="underscore-unused-vars"></a>
  Начинайте неиспользуемые параметры блока с подчеркивания `_`. Также допустимо
  использовать только подчеркивание `_`, хотя это и менее информативно. Эта
  договоренность распознается интерпретатором Руби и Рубокопом и уберет
  предупреждения о неиспользуемых переменных.
  <sup>[[ссылка](#underscore-unused-vars)]</sup>

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

* <a name="global-stdout"></a>
  Используйте переменные `$stdout/$stderr/$stdin` вместо констант
  `STDOUT/STDERR/STDIN`. `STDOUT/STDERR/STDIN` являются константами, поэтому при
  их переопределении (вы это можете сделать, например, для перенаправления
  ввода-вывода) интерпретатор будет выдавать предупреждения.
  <sup>[[ссылка](#global-stdout)]</sup>

* <a name="warn"></a>
  Используйте `warn` вместо `$stderr.puts`. Это не только короче, но и позволит
  вам скрыть все предупреждения, если вам это понадобится (для этого задайте
  уроверь предупреждений равный `0` при помощи опции `-W0`).
  <sup>[[ссылка](#warn)]</sup>

* <a name="sprintf"></a>
  Используйте `sprintf` и его алиас `format` вместо довольно запутанного метода
  `String#%`.
  <sup>[[ссылка](#sprintf)]</sup>

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

* <a name="array-join"></a>
  Используйте `Array#join` вместо достаточно неочевидного `Array#*` со строковым
  аргументом.
  <sup>[[ссылка](#array-join)]</sup>

  ```Ruby
  # плохо
  %w(one two three) * ', '
  # => 'one, two, three'

  # хорошо
  %w(one two three).join(', ')
  # => 'one, two, three'
  ```

* <a name="splat-arrays"></a>
  Используйте `[*var]` или `Array()` вместо явной проверки с помощью `Array`,
  когда вам приходится работать с переменной, которая по вашим ожиданиям должна
  быть массивом, но вы в этом не полностью уверены.
  <sup>[[ссылка](#splat-arrays)]</sup>

  ```Ruby
  # плохо
  paths = [paths] unless paths.is_a? Array
  paths.each { |path| do_something(path) }

  # хорошо
  [*paths].each { |path| do_something(path) }

  # хорошо (and a bit more readable)
  Array(paths).each { |path| do_something(path) }
  ```

* <a name="ranges-or-between"></a>
  Используйте интервалы или метод `Comparable#between?` вместо сложной логики
  для сравнения, когда это возможно.
  <sup>[[ссылка](#ranges-or-between)]</sup>

  ```Ruby
  # плохо
  do_something if x >= 1000 && x <= 2000

  # хорошо
  do_something if (1000..2000).include?(x)

  # хорошо
  do_something if x.between?(1000, 2000)
  ```

* <a name="predicate-methods"></a>
  Используйте предикативные методы вместо явного сравнения с использованием
  `==`. Сравнение чисел можно проводить явно.
  <sup>[[ссылка](#predicate-methods)]</sup>

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

* <a name="no-non-nil-checks"></a>
  Проводите явную проверку на значение `nil`, только если вы работаете
  с логическими значениями.
  <sup>[[ссылка](#no-non-nil-checks)]</sup>

    ```Ruby
    # плохо
    do_something if !something.nil?
    do_something if something != nil

    # хорошо
    do_something if something

    # хорошо (логическое значение)
    def value_set?
      !@some_boolean.nil?
    end
    ```

* <a name="no-BEGIN-blocks"></a>
  Старайтесь не использовать блоки `BEGIN`.
  <sup>[[ссылка](#no-BEGIN-blocks)]</sup>

* <a name="no-END-blocks"></a>
  Никогда не используйте блоки `END`. Используйте метод `Kernel#at_exit`.
  <sup>[[ссылка](#no-END-blocks)]</sup>

  ```Ruby
  # плохо
  END { puts 'Goodbye!' }

  # хорошо
  at_exit { puts 'Goodbye!' }
  ```

* <a name="no-flip-flops"></a>
  Избегайте переменных-перевертышей (flip-flops).
  <sup>[[ссылка](#no-flip-flops)]</sup>

* <a name="no-nested-conditionals"></a>
  Избегайте вложенных условий для управления ветвлением. Используйте проверочные
  выражения (guard clauses). Проверочные выражения - это условные выражения
  в самом начале функции, которые срабатывают при первой же возможности.
  <sup>[[ссылка](#no-nested-conditionals)]</sup>

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

  Используйте в циклах `next` в место блоков с условием.

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

> Единственными настоящими сложностями в программировании являются очистка кэша
> и выбор наименований. <br/>
> -- Фил Карлтон (Phil Karlton)

* <a name="english-identifiers"></a> Используйте английский язык, называя
  идентификаторы.<sup>[[ссылка](#english-identifiers)]</sup>

  ```Ruby
  # плохо (идентификатор использует символы вне ASCII)
  зарплата = 1_000

  # плохо (идентификатор - это русское слово, набранное латиницей вместо
  # кириллицы)
  zarplata = 1_000

  # хорошо
  salary = 1_000
  ```

* <a name="snake-case-symbols-methods-vars"></a> Используйте `snake_case` для
  имен символов, методов и переменных.
  <sup>[[ссылка](#snake-case-symbols-methods-vars)]</sup>

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

* <a name="camelcase-classes"></a> Используйте `CamelCase` для имен классов и
  модулей. Сокращения вроде `HTTP`,  `RFC`, `XML` набирайте заглавными буквами.
  <sup>[[ссылка](#camelcase-classes)]</sup>

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

* <a name="snake-case-files"></a> Используйте `snake_case`, называя файлы,
  например, `hello_world.rb`.<sup>[[ссылка](#snake-case-files)]</sup>

* <a name="snake-case-dirs"></a> Используйте `snake_case`, называя каталоги,
  например, `lib/hello_world/hello_world.rb`.
  <sup>[[ссылка](#snake-case-dirs)]</sup>

* <a name="one-class-per-file"></a> Старайтесь создавать только один класс или
  модуль в каждом файле исходного кода. Называйте эти файлы по имени класса или
  модуля, изменив запись в форме `CamelCase` на `snake_case`.
  <sup>[[ссылка](#one-class-per-file)]</sup>

* <a name="screaming-snake-case"></a> Используйте `SCREAMING_SNAKE_CASE` для
  всех других констант кроме имен классов и модулей.
  <sup>[[ссылка](#screaming-snake-case)]</sup>

  ```Ruby
  # плохо
  SomeConst = 5

  # хорошо
  SOME_CONST = 5
  ```

* <a name="bool-methods-qmark"></a> Идентификаторы предикативных методов, т.е.
  методов, возвращающих логическое значение, должны оканчиваться вопросительным
  знаком. Например, `Array#empty?`. Методы, не возвращающие логическое значение,
  не должны оканчиваться вопросительным знаком.
  <sup>[[ссылка](#bool-methods-qmark)]</sup>

* <a name="dangerous-method-bang"></a> Идентификаторы потенциально *опасных*
  методов, т.е. таких методов, которые могут именить `self` или его аргументы,
  должны оканчиваться восклицательным знаком, если есть соответствующий
  *безопасный* вариант такого метода. Например, `exit!`, который не вызывает
  завершающий скрипт в отличии от `exit`, выполняющего финализацию.
  <sup>[[ссылка](#dangerous-method-bang)]</sup>

  ```Ruby
  # плохо (нет соответсвующего безопасного аналога)
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

* <a name="safe-because-unsafe"></a> Определяйте безопасный метод (вариант
  без восклицательного знака) при помощи вызова опасного метода (с
  восклицательным знаком), если это возможно.
  <sup>[[ссылка](#safe-because-unsafe)]</sup>

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

* <a name="reduce-blocks"></a> При использовании `#reduce` с коротким блоком,
  называйте аргументы  `|a, e|`  (accumulator, element).
  <sup>[[ссылка](#reduce-blocks)]</sup>

* <a name="other-arg"></a>
  При определении бинарных операторов называйте параметр `other`. Исключение
  составляют методы `#<<` и  `#[]`, так как их семантика сильно отличается.
  <sup>[[ссылка](#other-arg)]</sup>

  ```Ruby
  def +(other)
    # некоторый код
  end
  ```

* <a name="map-find-select-reduce-size"></a> Используйте `#map` вместо
  `#collect`, `#find` вместо `#detect`, `#select` вместо  `#find_all`,
  `#reduce` вместо `#inject` и `#size` вместо `#length`. Это требование
  не сложно реализовать. Если использование альтернатив улучшит восприятие кода,
  то можно использовать и их. Все описанные варианты были взяты из языка
  Smalltalk и не распространены в других языках программирования. Причиной,
  почему не следует использовать `#find_all` вместо `#select`, является хорошая
  сочетаемость с методом `#reject`, и эти наименования очевидны.
  <sup>[[ссылка](#map-find-select-reduce-size)]</sup>

* <a name="count-vs-size"></a> Не используйте `#count` в качестве заметы для
  `#size`. Для объектов классов с включенным `Enumerable` (кроме класса`Array`)
  это приведет к затратному полному обходу всех элементов для определения
  размера.<sup>[[ссылка](#count-vs-size)]</sup>

  ```Ruby
  # плохо
  some_hash.count

  # хорошо
  some_hash.size
  ```

* <a name="flat-map"></a> Используйте `#flat_map` вместо `#map` + `#flatten`.
  Это правило не относится к массивам с глубиной больше 2, например, если
  `users.first.songs == ['a', ['b', 'c']]`, то используйте `#map` + `#flatten`,
  а не `#flat_map`. Метод `#flat_map` уменьшает глубину на один уровень. Метод
  `#flatten` сглаживает вложенность любого уровня.
  <sup>[[ссылка](#flat-map)]</sup>

  ```Ruby
  # плохо
  all_songs = users.map(&:songs).flatten.uniq

  # хорошо
  all_songs = users.flat_map(&:songs).uniq
  ```

* <a name="reverse-each"></a> Используйте метод `#reverse_each` вместо
  `#reverse.each`. Метод `#reverse_each` не создает копию массива, что само по
  себе хорошо.<sup>[[ссылка](#reverse-each)]</sup>

  ```Ruby
  # плохо
  array.reverse.each { ... }

  # хорошо
  array.reverse_each { ... }
  ```

## Комментарии

> Хороший код является лучшей документацией для себя. Каждый раз, когда вы
> готовитесь добавить комментарий, спросите себя: "Как я могу улучшить код,
> чтобы это комментарий стал ненужным?" Улучшите код и добавьте комментарий,
> чтобы сделать его еще понятнее. <br/>
> -- Стив Макконнел (Steve McConnell)

* <a name="no-comments"></a>
  Пишите говорящий за себя код и смело пропускайте все остальное в этом разделе.
  Серьезно!
  <sup>[[ссылка](#no-comments)]</sup>

* <a name="english-comments"></a>
  Пишите комментарии по-английски.
  <sup>[[ссылка](#english-comments)]</sup>

* <a name="hash-space"></a>
  Используйте один пробел между символом `#` в начале и текстом самого
  комментария.
  <sup>[[ссылка](#hash-space)]</sup>

* <a name="english-syntax"></a> Комментарии длиной больше одного слова должны
  оформляться в виде законченных предложений (с большой буквы и со знаками
  препинания).
  Разделяйте предложения [одним пробелом](http://en.wikipedia.org/wiki/Sentence_spacing).
  <sup>[[ссылка](#english-syntax)]</sup>

* <a name="no-superfluous-comments"></a> Избегайте избыточного комментирования.
  <sup>[[ссылка](#no-superfluous-comments)]</sup>

  ```Ruby
  # плохо
  counter += 1 # Увеличивает счетчик на единицу.
  ```

* <a name="comment-upkeep"></a> Актуализируйте существующие комментарии.
  Устаревший комментарий гораздо хуже отсутствующего комментария.
  <sup>[[ссылка](#comment-upkeep)]</sup>

> Хороший код подобен хорошей шутке: он не нуждается в пояснениях. <br/>
> -- Рус Ольсен (Russ Olsen)

* <a name="refactor-dont-comment"></a> Не пишите комментарии для объяснения
  плохого кода. Перепишите код, чтобы он говорил сам за себя.
  <sup>[[ссылка](#refactor-dont-comment)]</sup>

> Делай или не делай, тут нет места попыткам. <br/>
> -- Мастер Йода

### Пометки в комментариях

* <a name="annotate-above"></a> Обычно пометки следует записывать
  на предшествующей описываемому коду строке.<sup>[[ссылка](#annotate-above)]</sup>

* <a name="annotate-keywords"></a> Пометка отделяется двоеточием и пробелом, потом
  следует примечание, описывающее проблему.<sup>[[ссылка](#annotate-keywords)]</sup>

* <a name="indent-annotations"></a>
  Если для описания проблемы потребуются несколько строк, то на каждой
  последующей строке следует сделать отступ в три пробела после символа `#`.
  <sup>[[ссылка](#indent-annotations)]</sup>

  ```Ruby
  def bar
    # FIXME: This has crashed occasionally since v3.2.1. It may
    #   be related to the BarBazUtil upgrade.
    baz(:quux)
  end
  ```

* <a name="rare-eol-annotations"></a> В тех случаях, когда проблема настолько
  очевидна, что любые описания покажутся избыточными, пометки можно поставить
  в конце вызывающей проблему строки. Однако такое применение должно быть
  исключением, а не правилом.<sup>[[ссылка](#rare-eol-annotations)]</sup>

  ```Ruby
  def bar
    sleep 100 # OPTIMIZE
  end
  ```

* <a name="todo"></a>
  Используйте `TODO`, чтобы пометить отсутствующие возможности или функционал,
  которые должны быть добавлены позже.
  <sup>[[ссылка](#todo)]</sup>

* <a name="fixme"></a>
  Используйте `FIXME`, чтобы пометить код с ошибками, который должен быть
  исправлен.
  <sup>[[ссылка](#fixme)]</sup>

* <a name="optimize"></a>
  Используйте `OPTIMIZE`, чтобы пометить медленный или неэффективный код,
  который может вызвать проблемы с производительностью.
  <sup>[[ссылка](#optimize)]</sup>

* <a name="hack"></a>
  Используйте `HACK`, чтобы пометить код "с душком", который должен быть
  переработан и использует сомнительные практики разработки.
  <sup>[[ссылка](#hack)]</sup>

* <a name="review"></a>
  Используйте `REVIEW`, чтобы пометить все, что должно быть проверено на
  работоспособность. Например, `REVIEW: Are we sure this is how the client does
  X currently?`.
  <sup>[[ссылка](#review)]</sup>

* <a name="document-annotations"></a>
  Используйте персональные пометки, если это подходит по месту, но обязательно
  опишите их смысл в файле `README` (или похожем) для вашего проекта.
  <sup>[[ссылка](#document-annotations)]</sup>

## Классы и модули

* <a name="consistent-classes"></a> Придерживайтесь единообразной структуры
  классов.<sup>[[ссылка](#consistent-classes)]</sup>

  ```Ruby
  class Person
    # extend и include в начале
    extend SomeModule
    include AnotherModule

    # вложенные классы
    CustomErrorKlass = Class.new(StandardError)

    # после этого константы
    SOME_CONSTANT = 20

    # после этого макросы методов доступа к атрибутам
    attr_reader :name

    # и все прочие макросы (если имеются)
    validates :name

    # следующими по списку будут публичные методы класса
    def self.some_method
    end

    # и следующие за ними публичные методы экземпляров этого класса
    def some_method
    end

    # защищенные и частные методы нужно собрать ближе к концу
    protected

    def some_protected_method
    end

    private

    def some_private_method
    end
  end
  ```

* <a name="file-classes"></a>
  Если определение класса занимает несколько строк, постарайтесь вынести такой
  класс в отдельный файл. Файл с определением стоит поместить в директорию,
  названную по имени родительского класса, внутри которого определяется
  вложенный класс.
  <sup>[[ссылка](#file-classes)]</sup>

  ```Ruby
  # плохо

  # foo.rb
  class Foo
    class Bar
      # 30 методов внутри
    end

    class Car
      # 20 методов внутри
    end

    # 30 методов внутри
  end

  # хорошо

  # foo.rb
  class Foo
    # 30 методов внутри
  end

  # foo/bar.rb
  class Foo
    class Bar
      # 30 методов внутри
    end
  end

  # foo/car.rb
  class Foo
    class Car
      # 20 методов внутри
    end
  end
  ```

* <a name="modules-vs-classes"></a> Если класс определяет только методы класса,
  то трансформируйте такой класс в модуль. Использовать классы логично в тех
  ситуациях, когда нужно создавать экземпляры класса.
  <sup>[[ссылка](#modules-vs-classes)]</sup>

  ```Ruby
  # плохо
  class SomeClass
    def self.some_method
      # некоторый код
    end

    def self.some_other_method
    end
  end

  # хорошо
  module SomeModule
    module_function

    def some_method
      # некоторый код
    end

    def some_other_method
    end
  end
  ```

* <a name="module-function"></a> Используйте `module_function` вместо
  `extend self`, когда вам нужно преобразовать включаемые методы модуля в
  методы модуля.
  <sup>[[ссылка](#module-function)]</sup>

  ```Ruby
  # плохо
  module Utilities
    extend self

    def parse_something(string)
      # здесь реализуется логика
    end

    def other_utility_method(number, string)
      # здесь реализуется дополнительная логика
    end
  end

  # хорошо
  module Utilities
    module_function

    def parse_something(string)
      # здесь реализуется логика
    end

    def other_utility_method(number, string)
      # здесь реализуется дополнительная логика
    end
  end
  ```

* <a name="liskov"></a> Создавая иерархии классов, проверяйте их на
  соответствие [принципу подстановки Барбары Лисков][Liskov].
  <sup>[[ссылка](#liskov)]</sup>

* <a name="solid-design"></a> Проверяйте дизайн ваших классов на
  соответствие принципу [SOLID](http://en.wikipedia.org/wiki/SOLID_\(object-oriented_design\)),
  если такая возможность есть.
  <sup>[[ссылка](#solid-design)]</sup>

* <a name="define-to-s"></a> Для описывающих предметные области объектов всегда
  определяйте метод `#to_s`.
  <sup>[[ссылка](#define-to-s)]</sup>

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

* <a name="attr_family"></a> Применяйте макросы из семества `attr_` для
  тривиальных методов доступа к объекту.
  <sup>[[ссылка](#attr_family)]</sup>

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

* <a name="attr"></a> Не используйте обобщенную форму `attr`. Используйте
  `attr_reader` и `attr_accessor` вместо нее.
  <sup>[[ссылка](#attr)]</sup>

  ```Ruby
  # плохо (создает единый метод доступа атрибуту, объявлено нежелательным 1.9)
  attr :something, true
  attr :one, :two, :three # ведет себя как attr_reader

  # хорошо
  attr_accessor :something
  attr_reader :one, :two, :three
  ```

* <a name="struct-new"></a> Подумайте об использовании `Struct.new`, эта
  конструкция даст вам сразу простейшие методы доступа к состоянию,
  метод инициализации и методы сравнения.
  <sup>[[ссылка](#struct-new)]</sup>

  ```Ruby
  # хорошо
  class Person
    attr_accessor :first_name, :last_name

    def initialize(first_name, last_name)
      @first_name = first_name
      @last_name = last_name
    end
  end

  # лучше
  Person = Struct.new(:first_name, :last_name) do
  end
  ````
<!--- @FIXME -->
* <a name="no-extend-struct-new"></a>
  Не дополняйте `Struct.new` при помощи `#extend`. В этом случае уже создается
  новый класс. При дополнении вы создадите избыточный уровень абстракции, это
  может привезти к странным ошибкам при многократной загрузке кода из файла.
  <sup>[[ссылка](#no-extend-struct-new)]</sup>

  ```Ruby
  # плохо
  class Person < Struct.new(:first_name, :last_name)
  end

  # хорошо
  Person = Struct.new(:first_name, :last_name)
  ```

* <a name="factory-methods"></a>
  Продумывайте варианты добавления фабричных методов как дополнительной
  возможности создавать экземпляры конкретного класса.
  <sup>[[ссылка](#factory-methods)]</sup>

  ```Ruby
  class Person
    def self.create(options_hash)
      # некоторый код
    end
  end
  ```

* <a name="duck-typing"></a>
  Используйте технику [утиной типизации][duck-typing] (duck typing) вместо
  наследования.
  <sup>[[ссылка](#duck-typing)]</sup>

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

* <a name="no-class-vars"></a> Избегайте переменных класса (`@@`) из-за их
  "непристойного" поведения при наследовании.
  <sup>[[ссылка](#no-class-vars)]</sup>

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

  Parent.print_class_var # => вернет "child"
  ```

  Как вы видите, все классы в иерархии фактически делять одну и ту же
  переменную класса. Как правило, вам следует использовать переменные
  экземпляра класса вместо переменной класса.

* <a name="visibility"></a>
  Ограничивайте область видимости методов (`private`, `protected`) в зависимости
  от их планируемого применения. Не оставляйте все в области `public` (это
  стандартное значение). В конце концов мы пишем на *Руби*, а не на *Питоне*.
  <sup>[[ссылка](#visibility)]</sup>

* <a name="indent-public-private-protected"></a>
  Делайте отступы для указателей `public`, `protected` и `private` такими же,
  как и у самих определений методов, к которым они относятся. Оставляйте пустую
  строку выше, а также после указателя, чтобы подчеркнуть, что он относится ко
  всем определяемым ниже методам.
  <sup>[[ссылка](#indent-public-private-protected)]</sup>

  ```Ruby
  class SomeClass
    def public_method
      # некоторый код
    end

    private

    def private_method
      # некоторый код
    end

    def another_private_method
      # некоторый код
    end
  end
  ```

* <a name="def-self-singletons"></a>
  Для определения синглетных методов используйте `def self.method`. Это упростит
  рефакторинг, так как имя класса будет использоваться только один раз.
  <sup>[[ссылка](#def-self-singletons)]</sup>

  ```Ruby
  class TestClass
    # плохо
    def TestClass.some_method
      # некоторый код
    end

    # хорошо
    def self.some_other_method
      # body omitted
    end

    # Также допускается и будет удобным, когда
    # нужно определить много синглетных методов.
    class << self
      def first_method
        # некоторый код
      end

      def second_method_etc
        # некоторый код
      end
    end
  end
  ```

* <a name="alias-method-lexically"></a>
  Используйте `alias` при определении алиасов методов в лексической области
  видимости класса. `self` в данном случае также имеет лексическую область
  видимости, и это подчеркивает тот факт, что алиас будет указывать на метод
  того класса, в котором определен. Вызов не будет перенаправлен неявно.
  <sup>[[link](#alias-method-lexically)]</sup>

  ```Ruby
  class Westerner
    def first_name
      @names.first
    end

    alias given_name first_name
  end
  ```

  Так как `alias`, как и `def`, является ключевым словом, используйте простые
  имена методов, а не символы или строки в качестве аргументов. Другими словами,
  пишите `alias foo bar`, а не `alias :foo :bar`.

  Также обратите внимание, как Ruby обрабатывает алиасы при наследовании: алиас
  будет привязан к тому методу, который находится в области видимости в момент
  объявления. Динамическое перенаправление вызова не производится.

  ```Ruby
  class Fugitive < Westerner
    def first_name
      'Nobody'
    end
  end
  ```

  В этом примере `Fugitive#given_name` будет вызывать метод базовго класса
  `Westerner#first_name`, а не `Fugitive#first_name`. Чтобы переопределить
  поведение `Fugitive#given_name`, нужно объявить алиас в классе-наследнике.

  ```Ruby
  class Fugitive < Westerner
    def first_name
      'Nobody'
    end

    alias given_name first_name
  end
  ```

* <a name="alias-method"></a>
  Всегда применяйте `alias_method` для определения алиасов методов модулей,
  классов или синглетных классов во время выполнения, так как `alias`
  использует лексическую область видимости, что приводит к неопределенному
  поведению в данном случае.
  <sup>[[link](#alias-method)]</sup>

  ```Ruby
  module Mononymous
    def self.included(other)
      other.class_eval { alias_method :full_name, :given_name }
    end
  end

  class Sting < Westerner
    include Mononymous
  end
  ```


## Исключения

* <a name="fail-method"></a> Вызывайте исключения при помощи ключевого слова `fail`.
  Используйте `raise` только при перехвате исключения и вызове его же заново.
  В этом случае вы не вызываете исключение, а лишь намеренно передаете его дальше
  по стеку.<sup>[[ссылка](#fail-method)]</sup>

  ```Ruby
  begin
    fail 'Oops'
  rescue => error
    raise if error.message != 'Oops'
  end
  ```

* <a name="no-explicit-runtimeerror"></a> Нет нужды задавать `RuntimeError` явно
  в качестве аргумента при вызове `fail/raise` с двумя аргументами.
  <sup>[[ссылка](#no-explicit-runtimeerror)]</sup>

  ```Ruby
  # плохо
  fail RuntimeError, 'message'

  # хорошо - вызывает `RuntimeError` по умолчанию
  fail 'message'
  ```

* <a name="exception-class-messages"></a> Передавайте класс исключения и сообщение
  в форме двух аргументов для `fail/raise` вместо экземпляра класса исключения.
  <sup>[[ссылка](#exception-class-messages)]</sup>

  ```Ruby
  # плохо
  fail SomeException.new('message')
  # Обратите внимение, что нет возможности вызвать
  # `fail SomeException.new('message'), backtrace`.

  # хорошо
  fail SomeException, 'message'
  # Работает с `fail SomeException, 'message', backtrace`.
  ```

* <a name="no-return-ensure"></a> Не возвращайте значений в блоке `ensure`.
  Если вы явным образом возвращаете значение из блока `ensure`, то возвращение
  будет обрабатываться сначала и метод вернет значение, как если бы исключения
  не было вовсе. По итогу исключение будет просто тихо проигнорированно.
  <sup>[[ссылка](#no-return-ensure)]</sup>

  ```Ruby
  def foo
    fail
  ensure
    return 'very bad idea'
  end
  ```

* <a name="begin-implicit"></a> Используйте *имплицитную форму* блока `begin`
  по возможности.<sup>[[ссылка](#begin-implicit)]</sup>

  ```Ruby
  # плохо
  def foo
    begin
      # основной код находится здесь
    rescue
      # здесь происходит обработка ошибок
    end
  end

  # хорошо
  def foo
    # здесь реализуется основная логика
  rescue
    # здесь происходит обработка ошибок
  end
  ```

* <a name="contingency-methods"></a> Смягчайте неудобства, связанные с
  использование блоков `begin` при помощи *contingency methods* (термин введен
  Авди Гриммом).<sup>[[ссылка](#contingency-methods)]</sup>

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

* <a name="dont-hide-exceptions"></a> Не подавляйте исключения без обработки.
  <sup>[[ссылка](#dont-hide-exceptions)]</sup>

  ```Ruby
  # плохо
  begin
    # здесь образовалось исключение
  rescue SomeError
    # rescue не содержит никакой обработки
  end

  # плохо
  do_something rescue nil
  ```

* <a name="no-rescue-modifiers"></a> Откажитесь от использывания `rescue` в виде
  постмодификатора.<sup>[[ссылка](#no-rescue-modifiers)]</sup>

  ```Ruby
  # плохо - это перехватывает исключения класса `StandardError` и его наследников
  read_file rescue handle_error($!)

  # хорошо - это перехватывает только исключения класса `Errno::ENOENT` и его наследников
  def foo
    read_file
  rescue Errno::ENOENT => ex
    handle_error(ex)
  end
  ```

* <a name="no-exceptional-flows"></a> Управляйте ветвлением в программе
  без помощи исключений.<sup>[[ссылка](#no-exceptional-flows)]</sup>

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

* <a name="no-blind-rescues"></a> Не перехватывайте напрямую класс исключений
  `Exception`. Это будет перехватывать сигналы и вызовы `exit`, что
  потребует в крайнем случае завершения процесса при помощи `kill -9`.
  <sup>[[ссылка](#no-blind-rescues)]</sup>

  ```Ruby
  # плохо
  begin
    # сигналы выхода будет перехвачены (кроме kill -9)
    exit
  rescue Exception
    puts "you didn't really want to exit, right?"
    # обработка исключений
  end

  # хорошо
  begin
    # `rescue` без параметров перехватывает `StandardError`, а не `Exception`,
    # как предполагают многие разработчики.
  rescue => e
    # обработка исключений
  end

  # тоже хорошо
  begin
    # здесь вызывается исключение

  rescue StandardError => e
    # обработка ошибок
  end
  ```

* <a name="exception-ordering"></a> Размещайте более специфичные исключения
  в иерархии проверки, иначе они никогда не будут отфильтрованы.
  <sup>[[ссылка](#exception-ordering)]</sup>

  ```Ruby
  # плохо
  begin
    # код с ошибкой
  rescue Exception => e
    # некоторое действие
  rescue StandardError => e
    # некоторое действие
  end

  # хорошо
  begin
    # код с ошибкой
  rescue StandardError => e
    # некоторое действие
  rescue Exception => e
    # некоторое действие
  end
  ```

* <a name="release-resources"></a>
  Освобождайте используемые вашей программой ресурсы в блоке `ensure`.
  <sup>[[ссылка](#release-resources)]</sup>

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
<!--- @FIXME -->
* <a name="auto-release-resources"></a>
  Use versions of resource obtaining methods that do automatic resource cleanup
  when possible.
  <sup>[[link](#auto-release-resources)]</sup>

  ```Ruby
  # bad - you need to close the file descriptor explicitly
  f = File.open('testfile')
    # ...
  f.close

  # good - the file descriptor is closed automatically
  File.open('testfile') do |f|
    # ...
  end
  ```
* <a name="standard-exceptions"></a>
  Преимущественно используйте исключения, определенные в стандартной библиотеке,
  не создавайте без нужды новые классы исключений.
  <sup>[[ссылка](#standard-exceptions)]</sup>

## Коллекции

* <a name="literal-array-hash"></a> При создании массивов и хешей применяйте
  нотацию с литералами. Используйте конструкторы класса, только если вам нужно
  передать дополнительные параметры при создании коллекций.
  <sup>[[ссылка](#literal-array-hash)]</sup>

  ```Ruby
  # плохо
  arr = Array.new
  hash = Hash.new

  # хорошо
  arr = []
  hash = {}
  ```

* <a name="percent-w"></a> Используйте нотацию `%w` для литералов массивов,
  когда вам необходимо создать массив слов (непустых строк без пробелов и
  метасимволов). Это правило касается лишь массивов с двумя и более
  элементами.<sup>[[ссылка](#percent-w)]</sup>

  ```Ruby
  # плохо
  STATES = ['draft', 'open', 'closed']

  # хорошо
  STATES = %w(draft open closed)
  ```

* <a name="percent-i"></a> Используйте нотацию `%i` для литералов массивов,
  когда вам необходимо создать массив символов. Помните, что эта нотация
  несовместима с синтаксисом Ruby 1.9 и старше. Это правило касается лишь
  массивов с двумя и более элементами.<sup>[[ссылка](#percent-i)]</sup>

  ```Ruby
  # плохо
  STATES = [:draft, :open, :closed]

  # хорошо
  STATES = %i(draft open closed)
  ```

* <a name="no-trailing-array-commas"></a> Не ставьте запятую после последнего
  элемента в литералах массивов и хешей, особенно если элементы находятся не на
  разных строках.<sup>[[ссылка](#no-trailing-array-commas)]</sup>

  ```Ruby
  # плохо (проще перемещать, добавлять и удалять элементы, но не идеально)
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

* <a name="no-gappy-arrays"></a> Не создавайте массивы с большими незанятыми
  промежутками адресов.<sup>[[ссылка](#no-gappy-arrays)]</sup>

  ```Ruby
  arr = []
  arr[100] = 1 # Теперь у вас есть массив с кучей значений `nil`.
  ```

* <a name="first-and-last"></a> При доступе к первому и последнему элементам
  массива используйте методы `#first` или `#last`, а не индексы `[0]` и `[-1]`.
  <sup>[[ссылка](#first-and-last)]</sup>

* <a name="set-vs-array"></a> Используйте класс `Set` вместо `Array`, если вы
  работаете с уникальными элементами. Класс `Set` реализует несортированную
  коллекцию элементов без повторений и является гибридом интуитивных операций
  класса `Array` и легкого и быстрого доступа класса `Hash`.
  <sup>[[ссылка](#set-vs-array)]</sup>

* <a name="symbols-as-keys"></a> Используйте символы вместо строк в качестве
  ключей хешей.<sup>[[ссылка](#symbols-as-keys)]</sup>

  ```Ruby
  # плохо
  hash = { 'one' => 1, 'two' => 2, 'three' => 3 }

  # хорошо
  hash = { one: 1, two: 2, three: 3 }
  ```

* <a name="no-mutable-keys"></a> Не используйте мутируемые объекты в качестве
  ключей для хешей.<sup>[[ссылка](#no-mutable-keys)]</sup>

* <a name="hash-literals"></a> Применяйте введенный в Ruby 1.9 синтаксис для
  литералов хешей, когда ключами являются символы.
  <sup>[[ссылка](#hash-literals)]</sup>

  ```Ruby
  # плохо
  hash = { :one => 1, :two => 2, :three => 3 }

  # хорошо
  hash = { one: 1, two: 2, three: 3 }
  ```

* <a name="no-mixed-hash-syntaces"></a> Не используйте разные способы записи
  хешей одновременно (нотации до и после Ruby 1.9). Если вы используете не только
  символы в качестве ключей, то применяйте только старую нотацию со стрелками.
  <sup>[[ссылка](#no-mixed-hash-syntaces)]</sup>

  ```Ruby
  # плохо
  { a: 1, 'b' => 2 }

  # хорошо
  { :a => 1, 'b' => 2 }
  ```

* <a name="hash-key"></a> Применяйте `Hash#key?` вместо `Hash#has_key?` и
  `Hash#value?` вместо `Hash#has_value?`. Матц описывает
  [здесь](http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/43765)
  свои планы исключить эти методы в будущем.
  <sup>[[ссылка](#hash-key)]</sup>

  ```Ruby
  # плохо
  hash.has_key?(:test)
  hash.has_value?(value)

  # хорошо
  hash.key?(:test)
  hash.value?(value)
  ```

* <a name="hash-fetch"></a> Для надежной работы с заданными ключами, о
  существовании которых доподлинно известно, используйте `Hash#fetch`.
  <sup>[[ссылка](#hash-fetch)]</sup>

  ```Ruby
  heroes = { batman: 'Bruce Wayne', superman: 'Clark Kent' }
  # плохо (закравшуюся ошибку можно и не заметить сразу)
  heroes[:batman] # => "Bruce Wayne"
  heroes[:supermann] # => nil

  # хорошо (`Hash#fetch` вызывает `KeyError` и явно указывает на проблему)
  heroes.fetch(:supermann)
  ```

* <a name="hash-fetch-defaults"></a> Задавайте стандартные значения для хешей
  при помощи `Hash#fetch`, не реализуйте эту логику самостоятельно.
  <sup>[[ссылка](#hash-fetch-defaults)]</sup>

  ```Ruby
  batman = { name: 'Bruce Wayne', is_evil: false }

  # плохо (например, при использование оператора `||` мы получим неожиданный
  # результат при ложном значении первого операнда)
  batman[:is_evil] || true # => true

  # хорошо (`Hash#fetch` отрабатывает корректно)
  batman.fetch(:is_evil, true) # => false
  ```

* <a name="use-hash-blocks"></a> Используйте блоки вместо значений `Hash#fetch`
  по умолчанию.<sup>[[ссылка](#use-hash-blocks)]</sup>

  ```Ruby
  batman = { name: 'Bruce Wayne' }

  # плохо (при использовании значения по умолчанию метод его расчета будет
  # вызываться каждый раз, сильно замедляя выполнение программы при
  # многократных вызовах)
    batman.fetch(:powers, get_batman_powers) # get_batman_powers - нагруженный метод

  # хорошо (блоки оцениваются лишь по необходимости, когда вызывается KeyError)
  batman.fetch(:powers) { get_batman_powers }
  ```

* <a name="hash-values-at"></a>
  Используйте `Hash#values_at`, когда вам нужно получить несколько значений хеша
  за один раз.
  <sup>[[ссылка](#hash-values-at)]</sup>

  ```Ruby
  # плохо
  email = data['email']
  username = data['nickname']

  # хорошо
  email, username = data.values_at('email', 'nickname')
  ```

* <a name="ordered-hashes"></a> Вы можете положиться на то, что хеши в Ruby 1.9
  и младше отсортированны.<sup>[[ссылка](#ordered-hashes)]</sup>

* <a name="no-modifying-collections"></a> Никогда не модифицируйте коллекцию в
  процессе ее обхода.<sup>[[ссылка](#no-modifying-collections)]</sup>

* <a name="accessing-elements-directly"></a>
  Получая доступ к элементам коллекций, старайтесь избегать доступа при помощи
  `[n]`, а используйте альтернативные методы доступа, если таковые определены.
  Это обезопасит вас от вызова `[]` на `nil`.
  <sup>[[link](#accessing-elements-directly)]</sup>

  ```Ruby
  # плохо
  Regexp.last_match[1]

  # хорошо
  Regexp.last_match(1)
  ```

* <a name="provide-alternate-accessor-to-collections"></a>
  При определении методов доступа к коллекции, добавьте альтернативную форму,
  чтобы оградить пользователей от необходимости проверки на `nil` перед доступом
  к элементу коллекции.
  <sup>[[link](#provide-alternate-accessor-to-collections)]</sup>

  ```Ruby
  # плохо
  def awesome_things
    @awesome_things
  end

  # хорошо
  def awesome_things(index = nil)
    if index && @awesome_things
      @awesome_things[index]
    else
      @awesome_things
    end
  end
  ```

## Строки

* <a name="string-interpolation"></a> Используйте интерполяцию строк и форматные
  шаблоны, а не конкатенацию строк.
  <sup>[[ссылка](#string-interpolation)]</sup>

  ```Ruby
  # плохо
  email_with_name = user.name + ' <' + user.email + '>'

  # хорошо
  email_with_name = "#{user.name} <#{user.email}>"

  # хорошо
  email_with_name = format('%s <%s>', user.name, user.email)
  ```

* <a name="pad-string-interpolation"></a> Постарайтесь отделять код интерполяции
  пробелами. Это отделит код интерполяции более четко от окружающего кода.
  <sup>[[ссылка](#pad-string-interpolation)]</sup>

  ```Ruby
  "#{ user.last_name }, #{ user.first_name }"
  ```

* <a name="consistent-string-literals"></a> Постарайтесь внедрить единообразных
  стиль кавычек для строчных литералов. В среде программистов на Руби есть два
  популярных стиля, оба из них считаются приемлемыми. Стиль **А** подразумевает
  одинарные кавычки по умолчанию, а стиль **B** двойные кавычки.
  <sup>[[ссылка](#consistent-string-literals)]</sup>

  * **Стиль A:** Используйте одинарные кавычки, если вам не нужна интерполяция строк
    или специальные символы вроде `\t`, `\n`, `'` и т.д.

    ```Ruby
    # плохо
    name = "Bozhidar"

    # хорошо
    name = 'Bozhidar'
    ```

  * **Стиль B:** Используйте двойные кавычки в ваших строчных литералах, если они не
    содержат `"` или экранируйте символы, которые не должны интерполироваться.

    ```Ruby
    # плохо
    name = 'Bozhidar'

    # хорошо
    name = "Bozhidar"
    ```

  Второй стиль, по некоторым мнениям, более распространен среди разработчиков на
  Руби. Однако в этом руководстве оформление строк следует первому правилу.

* <a name="no-character-literals"></a> Не используйте запись для литералов
  алфавитных символов `?x`. Начиная с версии Руби 1.9, этот вариант записи
  избыточен: `?x` будет интерпретироваться в виде `'x'` (строка
  с единственным символом в ней).<sup>[[ссылка](#no-character-literals)]</sup>

  ```Ruby
  # плохо
  char = ?c

  # хорошо
  char = 'c'
  ```

* <a name="curlies-interpolate"></a> Всегда применяйте фигурные скобки `{}`
  вокруг глобальных переменных и переменных экземпляров класса при интерполяции
  строк.<sup>[[ссылка](#curlies-interpolate)]</sup>

  ```Ruby
  class Person
    attr_reader :first_name, :last_name

    def initialize(first_name, last_name)
      @first_name = first_name
      @last_name = last_name
    end

    # плохо (допустимо, но вычурно)
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

* <a name="no-to-s"></a> Не используйте метод `Object#to_s` для интерполируемых
  объектов, он вызывается автоматически при интерполяции.
  <sup>[[ссылка](#no-to-s)]</sup>

  ```Ruby
  # плохо
  message = "This is the #{result.to_s}."

  # хорошо
  message = "This is the #{result}."
  ```

* <a name="concat-strings"></a> Не применяйте метод `String#+`, когда вам нужно
  собрать вместе большие отрезки строк. Вместо этого используйте `String#<<`.
  Конкатенация изменяет экземпляр строки и всегда работает быстрее, чем `String#+`,
  который создает целую кучу новых строковых объектов.
  <sup>[[ссылка](#concat-strings)]</sup>

  ```Ruby
  # хорошо и быстро
  html = ''
  html << '<h1>Page title</h1>'

  paragraphs.each do |paragraph|
    html << "<p>#{paragraph}</p>"
  end
  ```

<!--- @FIXME -->
* <a name="dont-abuse-gsub"></a>
  Don't use `String#gsub` in scenarios in which you can use a faster more specialized alternative.
<sup>[[link](#dont-abuse-gsub)]</sup>

    ```Ruby
    url = 'http://example.com'
    str = 'lisp-case-rules'

    # bad
    url.gsub("http://", "https://")
    str.gsub("-", "_")

    # good
    url.sub("http://", "https://")
    str.tr("-", "_")
    ```


* <a name="heredocs"></a> При использовании многострочных HEREDOC не забывайте,
  что пробелы в начале строк тоже являются частью создаваемой строки. Примером
  хорошего стиля является применение техник, основывающихся на ограничителях,
  для удаления ненужных пробелов.<sup>[[ссылка](#heredocs)]</sup>

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

<!--- @FIXME -->
> Some people, when confronted with a problem, think
> "I know, I'll use regular expressions." Now they have two problems.<br/>
> -- Jamie Zawinski

* <a name="no-regexp-for-plaintext"></a> Не используйте регулярные выражения,
  когда вам нужно просто найди в строке подстроку: `string['text']`.
  <sup>[[ссылка](#no-regexp-for-plaintext)]</sup>

* <a name="regexp-string-index"></a> В простейших случаях вы просто можете
  использовать индексирование строк.<sup>[[ссылка](#regexp-string-index)]</sup>

  ```Ruby
  match = string[/regexp/]             # Возвращает найденные совпадения.
  first_group = string[/text(grp)/, 1] # Возвращает совпадения выделенной группы.
  string[/text (grp)/, 1] = 'replace'  # string => 'text replace'
  ```

* <a name="non-capturing-regexp"></a> Используйте группировку без сохранения,
  если вы не планируете использовать содержание выделенной скобками группы.
  <sup>[[ссылка](#non-capturing-regexp)]</sup>

  ```Ruby
  /(first|second)/   # плохо
  /(?:first|second)/ # хорошо
  ```

* <a name="no-perl-regexp-last-matchers"></a> Откажитесь от использования наследия
  Перла вроде мистических переменных, обозначающих группы совпадений (`$1`, `$2`
  и т.д.). Вместо этого используйте `Regexp.last_match(n)`.
  <sup>[[ссылка](#no-perl-regexp-last-matchers)]</sup>

  ```Ruby
  /(regexp)/ =~ string
  ...

  # плохо
  process $1

  # хорошо
  process Regexp.last_match(1)
  ```

* <a name="no-numbered-regexes"></a> Применение пронумерованных групп
  совпадений может быть сложной задачей. Вместо этого используйте поименованные
  группы с говорящими именами.<sup>[[ссылка](#no-numbered-regexes)]</sup>

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

* <a name="limit-escapes"></a> Классы символов используют лишь небольшой
  набор метасимволов, которые вам придется обрабатывать: `^`, `-`, `\`, `]`,
  поэтому нет нужды экранировать `.` или скобки внутри `[]`.
  <sup>[[ссылка](#limit-escapes)]</sup>

* <a name="caret-and-dollar-regexp"></a> Будьте осторожны с символами `^` и `$`,
  так как они обозначают начало/конец строки в тексте, а не строчного литерала.
  Если вам надо обозначить начало и конец литерала, то используйте `\A` и `\z`.
  Не путайте `\Z` и `\z`: `\Z` является эквивалентом `/\n?\z/`.
  <sup>[[ссылка](#caret-and-dollar-regexp)]</sup>

  ```Ruby
  string = "some injection\nusername"
  string[/^username$/]   # есть совпадение
  string[/\Ausername\z/] # нет совпадения
  ```

* <a name="comment-regexes"></a> Используйте модификатор `x` для сложных регулярных
  выражений. Он поможет вам сделать выражения удобочитаемыми и позволит добавлять
  комментарии. Не забывайте при этом, что пробелы в данном случае игнорируются.
  <sup>[[ссылка](#comment-regexes)]</sup>

  ```Ruby
  regexp = /
    start         # какой-то текст
    \s            # знак пробела
    (group)       # первая группа
    (?:alt1|alt2) # некоторая дизъюнкция
    end
  /x
  ```

* <a name="gsub-blocks"></a> В случае сложных замен либо подстановок `sub`/`gsub`
  можно использовать с блоком или хешем параметров.
  <sup>[[ссылка](#gsub-blocks)]</sup>

## Процентные литералы

* <a name="percent-q-shorthand"></a> Используйте `%()` (это сокращение от `%Q`)
  для строк без переносов, в которых  реализуется интерполяция и присутствуют
  двойные кавычки. Для строк с переносами лучше используйте формат HERE Doc.
  <sup>[[ссылка](#percent-q-shorthand)]</sup>

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

* <a name="percent-q"></a>
  Избегайте `%q`, если это не случай строки с символами кавычек  `'` и `"`
  одновременно  Обычные строки читаются проще, и их следует использовать, если
  нет излишне большого количества символов, которые нужно будет экранировать.
  <sup>[[ссылка](#percent-q)]</sup>

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

* <a name="percent-r"></a>
  Используйте `%r` для регулярных выражений, которые обрабатывают *хотя бы один*
  символ `/`, в остальных случаях используйте стандартный синтаксис.
  <sup>[[ссылка](#percent-r)]</sup>

 ```Ruby
  # плохо
  %r(\s+)

  # хорошо
  %r(^/(.*)$)
  %r(^/blog/2011/(.*)$)
  ```

* <a name="percent-x"></a>
  Откажитесь от использования `%x` кроме случаев, когда вы хотите вызвать
  внешнюю команду с обратными кавычками в теле (что само по себе маловероятно).
  <sup>[[ссылка](#percent-x)]</sup>

  ```Ruby
  # плохо
  date = %x(date)

  # хорошо
  date = `date`
  echo = %x(echo `date`)
  ```

* <a name="percent-s"></a>
  Старайтесь избегать `%s`. По общепринятому мнению, предпочтительным способом
  определения символа с пробелами в имени является `:"some string"`.
  <sup>[[ссылка](#percent-s)]</sup>

* <a name="percent-literal-braces"></a> Используйте `()` в качестве ограничителей
  для всех литералов со знаком `%` кроме `%r`.  Так как круглые скобки очень
  часто используются в самих регулярных выражениях, во многих случаях менее
  частый символ `{` может быть лучшим выбором для ограничителя (разумеется,
  с учетом смысла регулярного выражения).
  <sup>[[ссылка](#percent-literal-braces)]</sup>

  ```Ruby
  # плохо
  %w[one two three]
  %q{"Test's king!", John said.}

  # хорошо
  %w(one two three)
  %q("Test's king!", John said.)
  ```

## Метапрограммирование

* <a name="no-needless-metaprogramming"></a> Откажитесь от метапрограммирования
  ради метапрограммирования как такового.
  <sup>[[ссылка](#no-needless-metaprogramming)]</sup>

* <a name="no-monkey-patching"></a> Не разводите беспорядок в базовых классах
  при написании библиотек (не используйте "monkey patching").
  <sup>[[ссылка](#no-monkey-patching)]</sup>

* <a name="block-class-eval"></a> Используйте `#class_eval` с блоком вместно
  интерполяции значений в строке. Если вы используете интерполяцию, то всегда
  указывайте дополнительно `__FILE__` и `__LINE__`, чтобы информация о стеке
  вызова была осмысленной:<sup>[[ссылка](#block-class-eval)]</sup>

  ```Ruby
  class_eval 'def use_relative_model_naming?; true; end', __FILE__, __LINE__
  ```

  - `#define_method` предпочтительнее, чем `#class_eval { def ... }`

* <a name="eval-comment-docs"></a> При использовании `#class_eval` (или других
  `#eval`) с интерполяцией строк обязательно добавляйте комментарий, который
  будет наглядно показывать, как интерполированные значения будут выглядеть
  (примеры, используемые в исходном коде Rails):<sup>[[ссылка](#eval-comment-docs)]</sup>

  ```Ruby
  # из activesupport/lib/active_support/core_ext/string/output_safety.rb
  UNSAFE_STRING_METHODS.each do |unsafe_method|
    if 'String'.respond_to?(unsafe_method)
      class_eval <<-EOT, __FILE__, __LINE__ + 1
        def #{unsafe_method}(*params, &block)       # def capitalize(*params, &block)
          to_str.#{unsafe_method}(*params, &block)  #   to_str.capitalize(*params, &block)
        end                                       # end

        def #{unsafe_method}!(*params)              # def capitalize!(*params)
          @dirty = true                           #   @dirty = true
          super                                   #   super
        end                                       # end
      EOT
    end
  end
  ```

* <a name="no-method-missing"></a> Избегайте `#method_missing` для целей
  метапрограммирования, так как стек вызова становится нечитаемым, метод не виден
  в `#methods`, опечатки в вызовах методов пройдут незамеченными, например,
  `nukes.launch_state = false`. Используйте делегирование, проксирование или же
  `#define_method`. Если вы используете `#method_missing`:
  <sup>[[ссылка](#no-method-missing)]</sup>

  - обязательно [задайте `#respond_to_missing?`](http://blog.marc-andre.ca/2010/11/methodmissing-politely.html);
  - перехватывайте вызовы только с четко определенными префиксами, например,
    `#find_by_*` -- задайте в своем коде наиболее узкие рамки для
    неопределенностей;
  - вызывайте `#super` в конце ваших выражений;
  - делегируйте вызовы понятным, "немагическим" методам:

    ```Ruby
    # плохо
    def method_missing?(meth, *params, &block)
      if /^find_by_(?<prop>.*)/ =~ meth
        # ... lots of code to do a find_by
      else
        super
      end
    end

    # хорошо
    def method_missing?(meth, *params, &block)
      if /^find_by_(?<prop>.*)/ =~ meth
        find_by(prop, *params, &block)
      else
        super
      end
    end

    # Самым лучшим будет все же использование `#define_method`,
    # так как каждый видимый аргумент будет определен.
    ```

## Разное

* <a name="always-warn"></a> Пишите код, не дающий предупреждений при вызове
  `ruby -w`.<sup>[[ссылка](#always-warn)]</sup>

* <a name="no-optional-hash-params"></a> Не используйте хеши в качестве
  необязательных параметров. Возможно, ваш метод просто делает слишком много.
  Это не касается, однако, методов инициализации объектов.
  <sup>[[ссылка](#no-optional-hash-params)]</sup>

* <a name="short-methods"></a> Старайтесь не писать методы длиннее 10 строк. В
  идеальном случае большинство методов должны быть короче 5 строк. Пустные строки
  не подсчитываются.<sup>[[ссылка](#short-methods)]</sup>

* <a name="too-many-params"></a> Не создаваете методы с более чем тремя-четырьмя
  параметрами.<sup>[[ссылка](#too-many-params)]</sup>

* <a name="private-global-methods"></a> Если вам действительно нужны глобальные
  функции, включайте их в модуль Kernel и сделайте их приватными.
  <sup>[[ссылка](#private-global-methods)]</sup>

* <a name="instance-vars"></a> Используйте переменные модулей вместо глобальных
  переменных.<sup>[[ссылка](#instance-vars)]</sup>

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

* <a name="optionparser"></a> Используйте `OptionParser` для анализа сложных
  аргуметов командрой строки и  `ruby -s` для элеметарных случаев.
  <sup>[[ссылка](#optionparser)]</sup>

* <a name="time-now"></a> Используйте вариант `Time.now`, а не `Time.new`,
  когда хотите получить текущее значение системного времени.
  <sup>[[ссылка](#time-now)]</sup>

* <a name="functional-code"></a> Пишите код в функциональном стиле без изменения
  значений, когда это подходит по смыслу.<sup>[[ссылка](#functional-code)]</sup>

* <a name="no-param-mutations"></a>
  Не изменяйте значения параметров, если только это не есть цель метода.
  <sup>[[ссылка](#no-param-mutations)]</sup>

* <a name="three-is-the-number-thou-shalt-count"></a> Старайтесь не создавать
  вложенные структуры с уровнем вложения больше третьего.
  <sup>[[ссылка](#three-is-the-number-thou-shalt-count)]</sup>

* <a name="be-consistent"></a> Будьте последовательны. В идеальном мире
  последовательно придерживайтесь данного руководства.
  <sup>[[ссылка](#be-consistent)]</sup>

* <a name="common-sense"></a> Руководствуйтесь здравым смыслом.
  <sup>[[ссылка](#common-sense)]</sup>

## Инструментарий

В этом разделе собраны инструменты, которые могут помочь вам автоматически
сверить ваш код на Руби с предписаниями этого руководства.

### РубоКоп

[RuboCop][] &mdash; это утилита проверки стиля
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
чтобы мы смогли вместе создать ресурс, который был бы полезен для всего
сообщества программистов на Руби.

Не стесняйтесь создавать отчеты об ошибках и присылать мне запросы на интеграцию
вашего кода. И заранее большое спасибо за вашу помощь!

Вы можете поддержать проект (и РубоКоп) денежным взносом при помощи
[gittip](https://www.gittip.com/bbatsov).

[![Дай Gittip](https://rawgithub.com/twolfson/gittip-badge/0.2.0/dist/gittip.png)](https://www.gittip.com/bbatsov)

## Как сотрудничать в проекте?

Это просто! Следуйте [руководству по
сотрудничеству](https://github.com/bbatsov/ruby-style-guide/blob/master/CONTRIBUTING.md).

# Лицензирование

![Creative Commons License](http://i.creativecommons.org/l/by/3.0/88x31.png)
Данная работа опубликована на условиях лицензии [Creative Commons Attribution
3.0 Unported License](http://creativecommons.org/licenses/by/3.0/deed.en_US)

# Расскажи другому

Создаваемое сообществом руководство по стилю оформления будет малопригодным для
сообщества, которое об этом руководстве ничего не знает. Делитесь ссылками на
это руководство с вашими друзьями и коллегами доступными вам средствами. Каждый
получаемый нами комментарий, предложение или мнение сделает это руководство еще
чуточку лучше. А ведь мы хотим самое лучшее руководство из возможных, не так ли?

Всего,<br/>
[Божидар](https://twitter.com/bbatsov)

<!--- Links -->
[PEP-8]: http://www.python.org/dev/peps/pep-0008/
[rails-style-guide]: https://github.com/arbox/rails-style-guide/blob/master/README-ruRU.md
[pickaxe]: http://pragprog.com/book/ruby4/programming-ruby-1-9-2-0
[trpl]: http://www.ozon.ru/context/detail/id/5704300/
[entrpl]: http://www.amazon.com/Ruby-Programming-Language-David-Flanagan/dp/0596516177
[transmuter]: https://github.com/TechnoGate/transmuter
[RuboCop]: https://github.com/bbatsov/rubocop
[Liskov]: https://ru.wikipedia.org/wiki/%D0%9F%D1%80%D0%B8%D0%BD%D1%86%D0%B8%D0%BF_%D0%BF%D0%BE%D0%B4%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B8_%D0%91%D0%B0%D1%80%D0%B1%D0%B0%D1%80%D1%8B_%D0%9B%D0%B8%D1%81%D0%BA%D0%BE%D0%B2
[duck-typing]: https://ru.wikipedia.org/wiki/%D0%A3%D1%82%D0%B8%D0%BD%D0%B0%D1%8F_%D1%82%D0%B8%D0%BF%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D1%8F
