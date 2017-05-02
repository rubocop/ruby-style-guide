# 序幕

> 风格能把好的事物变成伟大的事物。 <br/>
> -- Bozhidar Batsov

作为一个 Ruby 开发者，有一件总是令我烦心的事 &mdash; Python 开发者有一份好的编程风格参考指南([PEP-8](http://www.python.org/dev/peps/pep-0008/)) 而我们永远没有一份官方指南，一份记录 Ruby 编程风格及最佳实践的指南。而我们确信风格很重要。我也相信这些好家伙们，像我们是 Ruby 开发者，应该有能力自己写一份这个梦寐以求的文档。

这份指南开始是作为我们公司内部的 Ruby 编程指南(由我所写的)。进行到某个部分时，我决定要把我的成果贡献给广大的 Ruby 社群，而且这个世界需要从另一个公司内部的一点帮助。然而这个世界也可以从由社群制定及策动的一系列 Ruby 编程惯例、实践及风格中受益。

在开始写这份指南时，我收到世界上很多优秀 Ruby 社群用户们的反馈。感谢所有的建议及帮助！我们同心协力创造一个能够让每一个 Ruby 开发者受益的资源。

# Ruby 风格指南

这份 Ruby 风格指南向你推荐现实世界中，Ruby 程序员如何写出可被别的Ruby程序员维护的代码。一份风格指南，反映出现实世界中的用法，带有一个理想，帮助人们避免使用危险的代码 &mdash; 不管它看起来有对好。

本指南分成数个相关规则的小节。我试着在每个规则后说明理由（如果省略的话，我相信理由是显而易见的）。

我没有想到所有的规则 &mdash; 他们大致上是基于，我作为一个专业软体工程师的广泛生涯，从 Ruby 社群成员所得到的反馈及建议，和数个高度评价的 Ruby 程式设计资源，像是 ["Programming Ruby 1.9"](http://pragprog.com/book/ruby3/programming-ruby-1-9) 以及 ["The Ruby Programming Language"](http://www.amazon.com/Ruby-Programming-Language-David-Flanagan/dp/0596516177)。

本指南仍在完善中 &mdash; 某些规则缺乏实例，某些规则没有例子来清楚地演示它们。在最后交付时，这些议题将会被解决 &mdash; 就先把它们记在心理吧。

你可以使用 [Transmuter](https://github.com/TechnoGate/transmuter) 来产生本指南的一份 PDF 或 HTML 复本。

## 源代码排版

> 几乎每人都深信，除了自己的，每一个风格都又丑又难读。把 "除了自己的" 拿掉，他们或许是对的...<br/>
> -- Jerry Coffin (论缩排)

* 使用 `UTF-8` 作为源文件的编码。
* 每个缩排层级使用两个**空格**。

    ```Ruby
    # 好
    def some_method
      do_something
    end

    # 差 - 四个空格
    def some_method
        do_something
    end
    ```
* 使用 Unix 风格的行编码(缺省涵盖 BSD/Solaris/Linux/OSX 的用户，Windows 用户要格外小心。)
    * 如果你使用 Git ，你也许会想加入下面这个配置，来保护你的项目被 Windows 的行编码侵入：
    ```$ git config --global core.autocrlf true```

* 使用空格来围绕操作符，逗号 `,` 、冒号 `:` 及分号 `;` 之后，围绕在 `{` 和 `}` 之前。
  空格可能对（大部分）Ruby 直译器来说是无关紧要的，但正确的使用是写出可读性高的代码的关键。

    ```Ruby
    sum = 1 + 2
    a, b = 1, 2
    1 > 2 ? true : false; puts 'Hi'
    [1, 2, 3].each { |e| puts e }
    ```
    唯一的例外是当使用指数操作符时：

    ```Ruby
    # 差
    e = M * c ** 2

    # 好
    e = M * c**2
    ```
* 不要有空格在 `(` 、 `[` 之后，或 `]` 、 `)` 之前。

    ```Ruby
    some(arg).other
    [1, 2, 3].length
    ```
* 把 `when` 跟 `case` 缩排在同一层。我知道很多人不同意这一点，但这是 "The Ruby Programming Language" 及 "Programming Ruby" 所使用的风格。

    ```Ruby
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

* 在 `def` 之间使用空行，并且把方法分成合乎逻辑的段落。

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
* 当一个方法呼叫的参数扩展至多行时，排列它们。

    ```Ruby
    # 一开始（一行太长）
    def send_mail(source)
      Mailer.deliver(to: 'bob@example.com', from: 'us@example.com', subject: 'Important message', body: source.text)
    end

    # 差（一般的缩排）
    def send_mail(source)
      Mailer.deliver(
        to: 'bob@example.com',
        from: 'us@example.com',
        subject: 'Important message',
        body: source.text)
    end

    # 差（两倍缩排）
    def send_mail(source)
      Mailer.deliver(
          to: 'bob@example.com',
          from: 'us@example.com',
          subject: 'Important message',
          body: source.text)
    end

    # 好
    def send_mail(source)
      Mailer.deliver(to: 'bob@example.com',
                     from: 'us@example.com',
                     subject: 'Important message',
                     body: source.text)
    end
    ```
* 使用 RDoc 以及它的惯例来撰写 API 文档。不要在注解区块及 `def` 之前放一个空行。
* 让每一行保持少于 80 个字符。
* 避免尾随的空白。

## 语法

* 使用 `def` 时，当有参数时使用括号。当方法不接受任何参数时，省略括号。

     ```Ruby
     def some_method
       # body omitted
     end

     def some_method_with_arguments(arg1, arg2)
       # body omitted
     end
     ```

* 永远不要使用 `for` ，除非你很清楚为什么。大部分情况应该使用迭代器来取代。 `for` 是由 `each` 所实作的（所以你加入了一层的迂回），但出乎意料的是 — `for` 并没有包含一个新的视野(不像是 `each` ）而在这个区块中定义的变量将会被外部所看到。

    ```Ruby
    arr = [1, 2, 3]

    # 差
    for elem in arr do
      puts elem
    end

    # 好
    arr.each { |elem| puts elem }
    ```

* 永远不要在多行的 `if/unless` 使用 `then`

    ```Ruby
    # 差
    if some_condition then
      # body omitted
    end

    # 好
    if some_condition
      # body omitted
    end
    ```

* 偏爱三元操作符 `? : ` 胜于 `if/then/else/end` 结构
* 它更为常见及更精准。

    ```Ruby
    # 差
    result = if some_condition then something else something_else end

    # 好
    result = some_condition ? something : something_else
    ```
* 使用一个表达式给一个三元操作符的分支。这也意味着三元操作符不要嵌套。嵌套情况使用 `if/else` 结构。

    ```Ruby
    # 差
    some_condition ? (nested_condition ? nested_something : nested_something_else) : something_else

    # 好
    if some_condition
      nested_condition ? nested_something : nested_something_else
    else
      something_else
    end
    ```
* 永远不要使用 `if x: ...` — 它已经在 Ruby 1.9 被移除了。使用三元操作符来取代。

    ```Ruby
    # 差
    result = if some_condition: something else something_else end

    # 好
    result = some_condition ? something : something_else
    ```
* 永远不要使用 `if x: ...` 使用三元操作符来取代。

* 一行的情况使用 `when x then ...`。替代方案的语法 `when x: ...` 在 Ruby 1.9 被移除了。

* 永远不要使用 `when x: ...`。参考前一个规则。

* 布尔表达式使用 `&&/||`，控制流程使用 `and/or`。 （经验法则：如果你需要使用外部括号，你正在使用错误的操作符。）

    ```Ruby
    # 布尔表达式
    if some_condition && some_other_condition
      do_something
    end

    # 控制流程
    document.saved? or document.save!
    ```
* 避免多行的 `? : `（三元操作符），使用 `if/unless` 来取代。

* 偏爱 `if/unless` 修饰符当你有单行的主体。另一个好的方法是使用控制流程的 `and/or`。

    ```Ruby
    # 差
    if some_condition
      do_something
    end

    # 好
    do_something if some_condition

    # 另一个好方法
    some_condition and do_something
    ```

* 否定条件偏爱 `unless` 优于 `if`（或是控制流程 `or`）。

    ```Ruby
    # 差
    do_something if !some_condition

    # 好
    do_something unless some_condition

    # 另一个好方法
    some_condition or do_something
    ```
* 永远不要使用 `unless` 搭配 `else` 。将它们改写成肯定条件。

    ```Ruby
    # 差
    unless success?
      puts 'failure'
    else
      puts 'success'
    end

    # 好
    if success?
      puts 'success'
    else
      puts 'failure'
    end
    ```
* 不要使用括号围绕 `if/unless/while` 的条件式，除非这条件包含了一个赋值（见下面使用 `=` （一个赋值）的返回值）。

    ```Ruby
    # 差
    if (x > 10)
      # body omitted
    end

    # 好
    if x > 10
      # body omitted
    end

    # 好
    if (x = self.next_value)
      # body omitted
    end
    ```

* 忽略围绕方法参数的括号，如内部 DSL (如：Rake, Rails, RSpec)，Ruby 中带有 "关键字" 状态的方法（如：`attr_reader`, `puts`）以及属性存取方法。所有其他的方法呼叫使用括号围绕参数。

    ```Ruby
    class Person
      attr_reader :name, :age

      # 忽略
    end

    temperance = Person.new('Temperance', 30)
    temperance.name

    puts temperance.age

    x = Math.sin(y)
    array.delete(e)
    ```

* 单行区块喜好 `{...}` 胜于 `do..end`。多行区块避免使用 `{...}`（多行串连总是​​丑陋）。在 `do...end` 、 "控制流程" 及 "方法定义" ，永远使用 `do...end` （如 Rakefile 及某些 DSL）。串连时避免使用 `do...end`。

    ```Ruby
    names = ["Bozhidar", "Steve", "Sarah"]

    # 好
    names.each { |name| puts name }

    # 差
    names.each do |name|
      puts name
    end

    # 好
    names.select { |name| name.start_with?("S") }.map { |name| name.upcase }

    # 差
    names.select do |name|
      name.start_with?("S")
    end.map { |name| name.upcase }
    ```
    某些人会争论多行串连时，使用 `{...}` 看起来还可以，但他们应该问问自己— 这样代码真的可读吗以及不能把区块内容取出来放到绝妙的方法中吗。

* 避免在不需要的场合时使用 `return` 。


    ```Ruby
    # 差
    def some_method(some_arr)
      return some_arr.size
    end

    # 好
    def some_method(some_arr)
      some_arr.size
    end
    ```
* 当赋予缺省值给方法参数时，使用空格围绕 `=` 操作符。

    ```Ruby
    # 差
    def some_method(arg1=:default, arg2=nil, arg3=[])
      # 做些什么...
    end

    # 好
    def some_method(arg1 = :default, arg2 = nil, arg3 = [])
      # 做些什么...
    end
    ```

    然而几本 Ruby 书建议第一个风格，第二个风格在实践中更为常见（并可争议地可读性更高一点）。

* 避免在不需要的场合使用续行 `\` 。在实践中，尽量避免使用续行。

    ```Ruby
    # 差
    result = 1 - \
             2

    # 好 (但仍丑的跟地狱一样）
    result = 1 \
             - 2
    ```

* 使用 `=`（一个赋值）的返回值是好的，但用括号环绕赋值。


    ```Ruby
    # 好 — 演示赋值的目标用途
    if (v = array.grep(/foo/)) ...

    # 差
    if v = array.grep(/foo/) ...
    
    # 也很好 — 演示赋值的目标用途及有正确的优先序
    if (v = self.next_value) == "hello" ...
    ```
* 随意使用 `||=` 来初始化变量

    ```Ruby
    # 仅在 name 为 nil 或 false 时，把名字设为 Bozhidar。
    name ||= 'Bozhidar'
    ```

* 不要使用 `||=` 来初始化布尔变量。 （想看看如果现在的值刚好是 `false` 时会发生什么。）

    ```Ruby
    # 差 — 会把 enabled 设成真，即便它本来是假。
    enabled ||= true

    # 好
    enabled = true if enabled.nil?
    ```
* 避免使用 Perl 风格的特别变量（像是 `$0-9`, ``$```, 等等）。它们看起来非常神秘以及不鼓励使用一行的脚本。

* 避免在方法名与左括号之间放一个空格。

    ```Ruby
    # 差
    f (3 + 2) + 1

    # 好
    f(3 + 2) + 1
    ```
* 如果方法的第一个参数由左括号开始，永远在这个方法呼叫里使用括号。举个例子，写 `f((3+2) + 1)`。

* 总是使用 `-w` 来执行 Ruby 直译器，如果你忘了某个上述的规则，它就会警告你！

* 当你的哈希键是符号时，使用 Ruby 1.9 哈希字面语法。

    ```Ruby
    # 差
    hash = { :one => 1, :two => 2 }

    # 好
    hash = { one: 1, two: 2 }
    ```
* 使用新的 lambda 字面语法。

    ```Ruby
    # 差
    lambda = lambda { |a, b​​| a + b }
    lambda.call(1, 2)

    # 好
    lambda = ->(a, b) { a + b }
    lambda.(1, 2)
    ```
* 未使用的区块参数使用 `_` 。

    ```Ruby
    # 差
    result = hash.map { |k, v| v + 1 }

    # 好
    result = hash.map { |_, v| v + 1 }
    ```

## 命名

> 程式设计的真正难题是替事物命名及无效的缓存。 <br/>
> -- Phil Karlton

* 方法与变量使用蛇底式小写（snake_case）。
* 类别与模组使用驼峰式大小写（CamelCase）。 （保留像是HTTP、RFC、XML 这种缩写为大写）
* 其他常数使用尖叫蛇底式大写（SCREAMING_SNAKE_CASE）。
* 判断式方法的名字（返回布尔值的方法）应以问号结尾。 (即 `Array#empty?` )
* 有潜在 "危险" 的方法（即改动 `self` 或改动参数、 `exit!` 等等）应以惊叹号结尾。
* 在短的区块使用 `reduce` 时，把参数命名为 `|a, e|` (累加器，元素)
* 当定义二元操作符时，把参数命名为 `other` 。

    ```Ruby
    def +(other)
      # body omitted
    end
    ```
* 偏好 `map` 胜于 `collect` ， `find` 胜于 `detect` ， `select` 胜于 `find_all` ， `reduce` 胜于 `inject` 以及 `size` 胜于 `length` 。这不是一个硬性要求；如果使用别名增加了可读性，使用它没关系。这些有押韵的方法名是从 Smalltalk 继承而来，在别的语言不常见。鼓励使用 `select` 而不是 `find_all` 的理由是它跟 `reject` 搭配起来是一目了然的。

## 注释

> 良好的代码是最佳的文档。当你要加一个注释时，扪心自问，<br/>
> "如何改善代码让它不需要注释？" 改善代码然后记录下来使它更简洁。 <br/>
> -- Steve McConnell

* 撰写自我记录的代码然后忽略之后的小节。我是认真的！
* 比一个单词长的注释要大写及使用标点符号。句号后使用[一个空格](http://en.wikipedia.org/wiki/Sentence_spacing)。
* 避免冗赘的注释

    ```Ruby
    # 差
    counter += 1 # 把计数器加一
    ```
* 保持现有的注释是最新的。没有注解比过时的注释好。
* 避免替烂代码写注解。重构代码让它们看起来一目了然。 （要嘛就做，要嘛不做― 不要只是试试看。）

## 注解

* 注解应该直接写在相关代码那行之后。
* 注解关键字后方，伴随着一个冒号及空白，接着一个描述问题的记录。
* 如果需要用多行来描述问题，之后的行要放在 `#` 号后面并缩排两个空白。

    ```Ruby
    def bar
      # FIXME: 这在v3.2.1 版本之后会异常崩溃，或许与
      #   BarBazUtil 的版本更新有关
      baz(:quux)
    end
    ```
* 在问题是显而易见的情况下，任何的文档会是多余的，注解应该要留在可能有问题的那行。这个用法是例外而不是规则。

    ```Ruby
    def bar
      sleep 100 # OPTIMIZE
    end
    ```
* 使用 `TODO` 来标记之后应被加入的未实现功能或特色。
* 使用 `FIXME` 来标记一个需要修复的代码。
* 使用 `OPTIMIZE` 来标记可能影响效能的缓慢或效率低落的代码。
* 使用 `HACK` 来标记代码异味，其中包含了可疑的编码实践以及应该需要重构。
* 使用 `REVIEW` 来标记任何需要审视及确认正常动作的地方。举例来说： `REVIEW: 我们确定用户现在是这么做的吗？ `
* 如果你觉得是适当的话，使用其他习惯的注解关键字，但记得把它们记录在项目的 `README` 或类似的地方。

## 类别

* 当设计类别阶层时，确认它们符合[Liskov 代换原则](http://en.wikipedia.org/wiki/Liskov_substitution_principle)。
* 尽可能让你的类别越[坚固](http://en.wikipedia.org/wiki/SOLID_(object-oriented_design\))越好。
* 永远替类别提供一个适当的 `to_s` 方法给来表示领域模型。

    ```Ruby
    class Person
      attr_reader :first_name, :last_name

      def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
      end

      def to_s
        "#@first_name #@last_name"
      end
    end
    ```
* 使用 `attr` 这类函数来定义琐碎的 accessor 或 mutators。

    ```Ruby
    # 差
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

    # 好
    class Person
      attr_reader :first_name, :last_name

      def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
      end
    end
    ```
  
* 考虑加入工厂方法来提供额外合理的方式，创造一个特定类别的实体。

    ```Ruby
    class Person
      def self.create(options_hash)
        # body omitted
      end
    end
    ```

* 偏好[鸭子类型](http://en.wikipedia.org/wiki/Duck_typing)胜于继承。

    ```Ruby
    # 差
    class Animal
      # 抽象方法
      def speak
      end
    end

    # 继承高层级的类别
    class Duck < Animal
      def speak
        puts 'Quack! Quack'
      end
    end

    # 继承高层级的类别
    class Dog < Animal
      def speak
        puts 'Bau! Bau!'
      end
    end

    # 好
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

* 由于继承中 "讨厌的" 行为，避免使用类别变量( `@@` )。

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

    如同你所看到的，在类别阶级中的所有类别其实都共享一个类别变量。应该通常偏好使用实体变量而不是类别变量。

* 依据方法的目的用途指定适当的可视层级(`private` ,`protected` )。别把所有方法都设为 `public` （方法的缺省值）。我们现在是在写 *Ruby* ，不是 *Python* 。
* `public`, `protected`, `private` 和方法定义有一样的缩排。在每一个上方留一个空行。

    ```Ruby
    class SomeClass
      def public_method
        # ...
      end

      private
      def private_method
        # ...
      end
    end

* 使用`def slef.method` 来定义singleton 方法。这让方法更能抵抗重构带来的变化。

    ```Ruby
    class TestClass
      # 差
      def TestClass.some_method
        # body omitted
      end

      # 好
      def self.some_other_method
        # body omitted
      end

      # 也有可能及当你要定义多个
      # singleton时的便利方法
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

## 异常

* 不要封锁异常。

    ```Ruby
    begin
      # 这里发生了一个异常
    rescue SomeError
      # 拯救子句完全没有做事
    end
    ```
* 不要为了控制流程而使用异常。

    ```Ruby
    # 差
    begin
      n / d
    rescue ZeroDivisionError
      puts "Cannot divide by 0!"
    end

    # 好
    if n.zero?
      puts "Cannot divide by 0!"
    else
      n / d
    ```
  
* 避免拯救 `Exception` 类别。

    ```Ruby
    # 差
    begin
      # 这里发生了一个异常
    rescue
      # 异常处理
    end

    # 仍然差
    begin
      # 这里发生了一个异常
    rescue Exception
      # 异常处理
    end
    ```

* 把较具体的异常放在救援串连的较上层，不然它们永远不会被拯救。

    ```Ruby
    # 差
    begin
      # 一些代码
    rescue Exception => e
      # 一些处理
    rescue StandardError => e
      # 一些处理
    end

    # 好
    begin
      # 一些代码
    rescue StandardError => e
      # 一些处理
    rescue Exception => e
      # 一些处理
    end
    ```
* 在 ensure 区块中释放你的程式的外部资源。

    ```Ruby
    f = File.open("testfile")
    begin
      # .. 处理
    rescue
      # .. 错误处理
    ensure
      f.close unless f.nil?
    end
    ```
* 偏爱使用标准函式库的异常处理胜于导入新的异常类别。

## 集合

* 当你需要使用一个字串的数组时，偏好使用 `%w` 的字面数组语法。

    ```Ruby
    # 差
    STATES = ['draft', 'open', 'closed']

    # 好
    STATES = %w(draft open closed)
    ```
* 避免在数组中创造巨大的间隔。


    ```Ruby
    arr = []
    arr[100] = 1 # 现在你有一个很多 nil 的数组
    ```
* 当处理独一无二的元素时，使用 `Set` 来替代 `Array` 。 `Set` 实现了不重复的无序数值集合。 `Set`是数组直观的内部操作功能与哈希的快速存取的混合体。
* 使用符号取代字串作为哈希键。

    ```Ruby
    # 差
    hash = { 'one' => 1, 'two' => 2, 'three' => 3 }

    # 好
    hash = { one: 1, two: 2, three: 3 }
    ```
* 避免使用可变的对象作为键值。
* 优先使用新的 1.9 字面哈希语法而不是 => (hashrocket) 语法。

    ```Ruby
    # 差
    hash = { :one => 1, :two => 2, :three => 3 }

    # 好
    hash = { one: 1, two: 2, three: 3 }
    ```
* 信任这个事实， 1.9 的哈希是有序的。
* 在遍历一个集合时，不要改动它。

## 字串

* 偏好字串插值（interpolation），而不是字串串接（concatenation）。

    ```Ruby
    # 差
    email_with_name = user.name + ' <' + user.email + '>'

    # 好
    email_with_name = "#{user.name} <#{user.email}>"
    ```
* 当你不需要插入特殊符号如 `\t`, `\n`, `'`, 等等时，偏好单引号的字串。

    ```Ruby
    # 差
    name = "Bozhidar"

    # 好
    name = 'Bozhidar'
    ```
* 不要使用 `{}` 围绕要被插入字串的实体变量。

    ```Ruby
    class Person
      attr_reader :first_name, :last_name

      def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
      end

      # 差
      def to_s
        "#{@first_name} #{@last_name}"
      end

      # 好
      def to_s
        "#@first_name #@last_name"
      end
    end
    ```
* 当你需要建构庞大的资料区块（chunk）时，避免使用 `String#+` 。
  使用 `String#<<` 来替代。字串串接在对的地方改变字串实体，并且永远比 `String#+` 来得快，`String#+` 创造了一堆新的字串对象。

    ```Ruby
    # 好也比较快
    html = ''
    html << '<h1>Page title</h1>'

    paragraphs.each do |paragraph|
      html << "<p>#{paragraph}</p>"
    end
    ```

## 正則表示法

* 如果你只需要在字串中简单的搜索文字，不要使用正則表示法：`string['text']`
* 针对简单的字串查询，你可以直接在字串索引中直接使用正則表示法。

    ```Ruby
    match = string[/regexp/] # 获得匹配正則表示法的内容
    first_group = string[/text(grp)/, 1] # 或得分组的内容
    string[/text (grp)/, 1] = 'replace' # string => 'text replace'
    ```
* 当你不需要替结果分组时，使用非分组的群组。

    ```Ruby
    /(first|second)/ # 差
    /(?:first|second)/ # 好
    ```
* 避免使用 `$1-9`，因为它们很难追踪它们包含什么。可以使用命名群组来替代。

    ```Ruby
    # 差
    /(regexp)/ =~ string
    ...
    process $1

    # 好
    /(?<meaningful_var>regexp)/ =~ string
    ...
    process meaningful_var
    ```
* 字符类别只有几个你需要关心的特殊字元：`^`, `-`, `\`, `]`，所以你不用逃脱字元 `.` 或在 `[]` 的中括号。
* 小心使用 `^` 与 `$` ，它们匹配的是一行的开始与结束，​​不是字串的开始与结束。如果你想要匹配整个字串，使用 `\A` 与 `\Z`。

    ```Ruby
    string = "some injection\nusername"
    string[/^username$/] # matches
    string[/\Ausername\Z/] # don't match
    ```
* 针对复杂的正則表示法，使用 `x` 修饰符。这让它们的可读性更高并且你可以加入有用的注释。只是要小心忽略的空白。

    ```Ruby
    regexp = %r{
      start # 一些文字
      \s # 空白字元
      (group) # 第一组
      (?:alt1|alt2) # 一些替代方案
      end
    }x
    ```

* 针对复杂的替换，`sub` 或 `gsub` 可以与区块或哈希来使用。

## 百分比字面

* 随意使用 `%w` 。

    ```Ruby
    STATES = %w(draft open closed)
    ```
* 使用 `%()` 给需要插值与嵌入双引号的单行字串。多行字串，偏好使用 heredocs 。

    ```Ruby
    # 差（不需要插值）
    %(<div class="text">Some text</div>)
    # 应该使用'<div class="text">Some text</div>'

    # 差（没有双引号）
    %(This is #{quality} style)
    # 应该使用 "This is #{quality} style"

    # 差（多行）
    %(<div>\n<span class="big">#{exclamation}</span>\n</div>)
    # 应该是一个 heredoc

    # 好（需要插值、有双引号以及单行）
    %(<tr><td class="name">#{name}</td>)
    ```
* 正則表示法要匹配多于一个的 `/` 字元时，使用 `%r`。

    ```Ruby
    # 差
    %r(\s+)

    # 仍然差
    %r(^/(.*)$)
    # 应当是 /^\/(.*)$/

    # 好
    %r(^/blog/2011/(.*)$)
    ```
* 避免 `%q`, `%Q`, `%x`, `%s` 以及 `%W`。
* 偏好 `()` 作为所有 `%` 字面的分隔符。

## 元编程

* 写一个函式库时不要在核心类别捣乱（不要替它们加 monkey patch）

## 其它

* `ruby -w` 写安全的代码。
* 避免使用哈希作为选择性参数。这个方法是不是做太多事了？
* 避免方法长于 10 行代码（LOC）。理想上，大部分的方法会小于5行。空行不算进LOC里。
* 避免参数列表长于三或四个参数。
* 如果你真的需要，加入"全域" 变量到核心以及把它们设为私有的。
* 使用类别变量而不是全域变量。

    ```Ruby
    # 差
    $foo_bar = 1

    # 好
    class Foo
      class << self
        attr_accessor ​​:bar
      end
    end

    Foo.bar = 1
    ```
* 当 `alias_method` 可以做到时，避免使用 `alias` 。
* 使用 `OptionParser` 来解析复杂的命令行选项及 `ruby -s` 来处理琐碎的命令行选项。
* 用函数式的方法编程，在有意义的情况下避免赋值。
* 避免不需要的元编程。
* 不要变动参数，除非那是方法的目的。
* 避免超过三行的区块嵌套。
* 保持一致性。在理想的世界里，遵循这些准则。
* 使用常识。


# 贡献

在本指南所写的每个东西都不是定案。这只是我渴望想与同样对 Ruby 编程风格有兴趣的大家一起工作，以致于最终我们可以替整个Ruby社群创造一个有益的资源。

欢迎开票或发送一个带有改进的更新请求。在此提前感谢你的帮助！

# 口耳相传

一份社群策动的风格指南，对一个社群来说，只是让人知道有这个社群。微博转发这份指南，分享给你的朋友或同事。我们得到的每个注解、建议或意见都可以让这份指南变得更好一点。而我们想要拥有的是最好的指南，不是吗？