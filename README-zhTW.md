# 序幕

> 風格是從偉大事物中分離出的美好事物。 <br/>
> -- Bozhidar Batsov

作為 Ruby 開發者，有一件總是令我煩心的事 &mdash; Python 開發者有一份好的程式風格參考指南([PEP-8](http://www.python.org/dev/peps/pep-0008/)) 而我們永遠沒有一份官方指南，一份記錄 Ruby 程式風格及最佳實踐的指南。而我們確信風格很重要。我也相信這些好傢伙們，像我們是 Ruby 開發者，應該可以自己產生一份這夢寐以求的文件。

這份指南開始是作為我們公司內部 Ruby 程式指南(由我所寫的)。進行到某個部分時，我決定要把我的成果貢獻給廣大的 Ruby 社群，而且這個世界需要來自另一個公司內部的一點幫助。然而這個世界也可以從由社群制定及驅動的一系列 Ruby 程式慣例、實踐及風格中受益。

在開始寫這份指南時，我收到世界上很多優秀 Ruby 社群用戶們的反饋。感謝所有的建議及幫助！我們同心協力創造一個能夠讓每一個 Ruby 開發者受益的資源。

順道一提，如果你對 Rails 有興趣，你可以看看這份與之互補的 [Ruby on Rails 3 風格指南](https://github.com/bbatsov/rails-style-guide)。

# Ruby 風格指南

這份 Ruby 風格指南向你推薦現實世界中，Ruby 程式設計師如何寫出可被別的 Ruby 程式設計師維護的程式碼。一份風格指南，反映出現實世界中的用法，並有一個理想，幫助人們避免使用危險的程式碼 &mdash; 不管它看起來有多好。

本指南分成數個相關規則的小節。我試著在每個規則後說明理由（如果省略的話，我相信理由相當明顯）。

我沒有想到所有的規則 &mdash; 他們大致上是基於，我作為一個專業軟體工程師的廣泛生涯，從 Ruby 社群成員所得到的反饋及建議，和數個高度評價的 Ruby 程式設計資源，像是 ["Programming Ruby 1.9"](http://pragprog.com/book/ruby3/programming-ruby-1-9) 以及 ["The Ruby Programming Language"](http://www.amazon.com/Ruby-Programming-Language-David-Flanagan/dp/0596516177)。

本指南仍在進行改善中 &mdash; 某些規則缺乏實例，某些規則沒有例子來清楚地展示它們。在最後交付時，這些議題會被解決 &mdash; 就先把它們記在心理吧。

你可以使用 [Transmuter](https://github.com/TechnoGate/transmuter) 來產生本指南的一份 PDF 或 HTML 副本。

## 原始碼排版

> 幾乎每人都深信，每一個除了自己的風格都又醜又難讀。把 "除了自己的" 拿掉，他們或許是對的...<br/>
> -- Jerry Coffin (論縮排)

* 使用 `UTF-8` 作為原始檔案的編碼。
* 每個縮排層級使用兩個**空格**。

    ```Ruby
    # 好
    def some_method
      do_something
    end

    # 不好 - 四個空格
    def some_method
        do_something
    end
    ```
* 使用 Unix 風格的行編碼 (預設包含 BSD/Solaris/Linux/OSX 的使用者，Windows 使用者要特別小心。)
    * 如果你使用 Git ，你也許會想加入下面這個配置設定，來保護你的專案被 Windows 的行編碼侵入：
    	```$ git config --global core.autocrlf true```

* 使用空格來圍繞運算元，逗點 `,` 、冒號 `:` 及分號 `;` 之後，圍繞 `{` 和 `}` 之前。
  空格可能對（大部分）Ruby 直譯器來說是無關緊要的，但正確的使用是寫出可讀性高的程式碼的關鍵。

    ```Ruby
    sum = 1 + 2
    a, b = 1, 2
    1 > 2 ? true : false; puts 'Hi'
    [1, 2, 3].each { |e| puts e }
    ```
    唯一的例外是當使用指數運算元時：

    ```Ruby
    # 不好
    e = M * c ** 2

    # 好
    e = M * c**2
    ```
* 不要有空格在 `(` 、 `[` 之後，或 `]` 、 `)` 之前。

    ```Ruby
    some(arg).other
    [1, 2, 3].length
    ```
* 把 `when` 跟 `case` 縮排在同一層。我知道很多人不同意這一點，但這是 "The Ruby Programming Language" 及 "Programming Ruby" 所設立的風格。

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

* 在 `def` 之間使用空行，並且把方法分成合乎邏輯的段落。

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
* 當一個方法呼叫的參數擴展至多行時，排列它們。

    ```Ruby
    # 一開始（一行太長）
    def send_mail(source)
      Mailer.deliver(to: 'bob@example.com', from: 'us@example.com', subject: 'Important message', body: source.text)
    end

    # 不好（一般的縮排）
    def send_mail(source)
      Mailer.deliver(
        to: 'bob@example.com',
        from: 'us@example.com',
        subject: 'Important message',
        body: source.text)
    end

    # 不好（兩倍縮排）
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
* 使用 RDoc 以及它的慣例來撰寫 API 文件。不要在註解區塊及 `def` 之前放一個空行。
* 讓每一行保持在少於 80 個字元。
* 避免尾隨的空白（trailing whitesapce）。

## 語法

* 使用 `def` 時，當有參數時使用括號。當方法不接受任何參數時，省略括號。

     ```Ruby
     def some_method
       # 省略主體
     end

     def some_method_with_arguments(arg1, arg2)
       # 省略主體
     end
     ```

* 永遠不要使用 `for` ，除非你很清楚為什麼。大部分情況應該使用迭代器來取代。`for` 是由 `each` 所實作的（所以你加入了一層的迂迴），但出乎意料的是 — `for` 並沒有包含一個新的視野 (不像是 `each`）而在這個區塊中定義的變數將會被外部所看到。

    ```Ruby
    arr = [1, 2, 3]

    # 不好
    for elem in arr do
      puts elem
    end

    # 好
    arr.each { |elem| puts elem }
    ```

* 永遠不要在多行的 `if/unless` 使用 `then`

    ```Ruby
    # 不好
    if some_condition then
      # 省略主體
    end

    # 好
    if some_condition
      # 省略主體
    end
    ```

* 偏愛三元運算元 `? : ` 勝於 `if/then/else/end` 結構
* 它更為常見及更精準。

    ```Ruby
    # 不好
    result = if some_condition then something else something_else end

    # 好
    result = some_condition ? something : something_else
    ```
* 使用一個表達式給一個三元運算元的分支。這也意味著三元運算符不要寫成巢狀式。巢狀情況使用 `if/else` 結構。

    ```Ruby
    # 不好
    some_condition ? (nested_condition ? nested_something : nested_something_else) : something_else

    # 好
    if some_condition
      nested_condition ? nested_something : nested_something_else
    else
      something_else
    end
    ```
* 永遠不要使用 `if x: ...` — 它已經在 Ruby 1.9 被移除了。使用三元運算元來取代。

    ```Ruby
    # 不好
    result = if some_condition: something else something_else end

    # 好
    result = some_condition ? something : something_else
    ```
* 永遠不要使用 `if x; ...` 使用三元運算元來取代。

* 一行的情況使用 `when x then ...` 。替代方案的語法 `when x: ...` 在 Ruby 1.9 被移除了。

* 永遠不要使用 `when x; ...` 。參考前一個規則。

* 布林表達式使用 `&&/||`，控制流程使用 `and/or`。（經驗法則：如果你需要使用外部括號，你正在使用錯誤的運算元。）

    ```Ruby
    # 布林表達式
    if some_condition && some_other_condition
      do_something
    end

    # 控制流程
    document.saved? or document.save!
    ```
* 避免多行的 `? : `（三元運算元），使用 `if/unless` 來取代。

* 當你有單行的主體時，偏愛 `if/unless` 修飾符。另一個好的方法是使用控制流程的 `and/or` 。

    ```Ruby
    # 不好
    if some_condition
      do_something
    end

    # 好
    do_something if some_condition

    # 另一個好方法
    some_condition and do_something
    ```

* 否定條件偏愛 `unless` 優於 `if`  （或是控制流程 `or`）。

    ```Ruby
    # 不好
    do_something if !some_condition

    # 好
    do_something unless some_condition

    # 另一個好方法
    some_condition or do_something
    ```
* 永遠不要使用 `unless` 搭配 `else`。 將它們改寫成肯定條件。

    ```Ruby
    # 不好
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
* 不要使用括號圍繞 `if/unless/while` 的條件式，除非這條件包含了一個賦值（見下面使用 `=` （一個賦值）的回傳值）。

    ```Ruby
    # 不好
    if (x > 10)
      # 省略主體
    end

    # 好
    if x > 10
      # 省略主體
    end

    # 好
    if (x = self.next_value)
      # 省略主體
    end
    ```

* 忽略圍繞方法參數的括號，如內部 DSL (如：Rake, Rails, RSpec)，Ruby 中帶有 "關鍵字" 狀態的方法（如：`attr_reader`, `puts`）以及屬性存取方法。所有其他的方法呼叫，使用括號圍繞參數。

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

* 單行區塊喜好 `{...}` 勝於 `do..end`。多行區塊避免使用 `{...}`（多行串連總是醜陋）。在 `do...end` 、 "控制流程" 及"方法定義"，永遠使用 `do...end` （如 Rakefile 及某些 DSL）。串連時避免使用 `do...end`。

    ```Ruby
    names = ["Bozhidar", "Steve", "Sarah"]

    # 好
    names.each { |name| puts name }

    # 不好
    names.each do |name|
      puts name
    end

    # 好
    names.select { |name| name.start_with?("S") }.map { |name| name.upcase }

    # 不好
    names.select do |name|
      name.start_with?("S")
    end.map { |name| name.upcase }
    ```
    某些人會爭論多行串連時，使用`{...}`看起來還可以，但他們應該問問自己 — 這樣程式碼真的可讀嗎以及不能把區塊內容取出來放到絕妙的方法中嗎。

* 避免在不需要的場合時使用 `return` 。

    ```Ruby
    # 不好
    def some_method(some_arr)
      return some_arr.size
    end

    # 好
    def some_method(some_arr)
      some_arr.size
    end
    ```
* 當賦予預設值給方法參數時，使用空格圍繞 `=` 運算元。

    ```Ruby
    # 不好
    def some_method(arg1=:default, arg2=nil, arg3=[])
      # 做些事情...
    end

    # 好
    def some_method(arg1 = :default, arg2 = nil, arg3 = [])
      # 做些事情...
    end
    ```

    然而幾本 Ruby 書建議第一個風格，第二個風格在實踐中更為常見（並可爭議地可讀性更高一點）。

* 避免在不需要的場合使用續行 `\`。在實踐中，盡量避免使用續行。

    ```Ruby
    # 不好
    result = 1 - \
             2

    # 好 (但仍然醜的跟地獄一樣）
    result = 1 \
             - 2
    ```

* 使用 `=`（一個賦值）的回傳值是好的，但用括號環繞賦值。


    ```Ruby
    # 好 — 演示賦值的目標用途
    if (v = array.grep(/foo/)) ...

    # 不好
    if v = array.grep(/foo/) ...
    
    # 也很好 — 演示賦值的目標用途及有正確的優先順序
    if (v = self.next_value) == "hello" ...
    ```
* 隨意使用 `||=` 來初始化變數

    ```Ruby
    # 僅在name為nil或false時，把名字設為 Bozhidar。
    name ||= 'Bozhidar'
    ```

* 不要使用 `||=` 來初始化布林變數。（想看看如果現在的值剛好是 `false` 時會發生什麼。）

    ```Ruby
    # 不好 — 會把 enabled 設成真，即便它本來是假。
    enabled ||= true

    # 好
    enabled = true if enabled.nil?
    ```
* 避免使用 Perl 風格的特別變數（像是 `$0-9`, `` $` ``, 等等）。它們看起來非常神祕以及不鼓勵使用一行的腳本。

* 避免在方法名與左括號之間放一個空格。

    ```Ruby
    # 不好
    f (3 + 2) + 1

    # 好
    f(3 + 2) + 1
    ```
* 如果方法的第一個參數由左括號開始，永遠在這個方法呼叫裡使用括號。舉個例子，寫 `f((3+2) + 1)`。

* 總是使用 `-w` 來執行 Ruby 直譯器，如果你忘了某個上述的規則，它就會警告你！

* 當你的雜湊鍵是符號時，使用 Ruby 1.9 雜湊字面語法。

    ```Ruby
    # 不好
    hash = { :one => 1, :two => 2 }

    # 好
    hash = { one: 1, two: 2 }
    ```
* 使用新的 lambda 字面語法。

    ```Ruby
    # 不好
    lambda = lambda { |a, b| a + b }
    lambda.call(1, 2)

    # 好
    lambda = ->(a, b) { a + b }
    lambda.(1, 2)
    ```
* 未使用的區塊參數使用 `_` 。

    ```Ruby
    # 不好
    result = hash.map { |k, v| v + 1 }

    # 好
    result = hash.map { |_, v| v + 1 }
    ```

## 命名

> 程式設計的真正難題是替事物命名及無效的快取。<br/>
> -- Phil Karlton

* 方法與變數使用蛇底式小寫（snake_case）。
* 類別與模組使用駝峰式大小寫（CamelCase）。（保留像是 HTTP、RFC、XML 這種縮寫為大寫）
* 其他常數使用尖叫蛇底式大寫（SCREAMING_SNAKE_CASE）。
* 判斷式（predicate）方法的名字（回傳布林值的方法）應以問號結尾。(即 `Array#empty?` )
* 有潛在 "危險" 的方法（即改動 `self` 或改動參數、 `exit!` 等等）應以驚嘆號結尾。
* 在短的區塊使用 `reduce` 時，把參數命名為 `|a, e|` (累加器，元素)
* 當定義二元運算元時，把參數命名為 `other` 。

    ```Ruby
    def +(other)
      # 省略主體
    end
    ```
* 偏好 `map` 勝於 `collect` ， `find` 勝於 `detect` ， `select` 勝於 `find_all` ， `reduce` 勝於 `inject` 以及 `size` 勝於 `length` 。這不是一個硬性要求；如果使用別名增加了可讀性，使用它沒關係。這些有押韻的方法名是從 Smalltalk 繼承而來，在別的語言不常見。鼓勵使用 `select` 而不是 `find_all` 的理由是它跟 `reject` 搭配起來是一目了然的。

## 註解 (Comment)

> 良好的程式碼是最佳的文件。當你要加一個註解時，捫心自問，<br/>
> "如何改善程式碼讓它不需要註解？" 改善程式碼然後記錄下來使它更簡潔。 <br/>
> -- Steve McConnell

* 撰寫自我記錄的程式碼並忽略之後的小節。我是認真的！
* 比一個單字長的註解要大寫及使用標點符號。句號後使用[一個空格](http://en.wikipedia.org/wiki/Sentence_spacing)。
* 避免多餘的註解

    ```Ruby
    # 不好
    counter += 1 # 把計數器加一
    ```
* 保持現有的註解是最新的。沒有註解比過時的註解好。
* 避免替爛程式碼寫註解。重構程式碼讓它們看起來一目了然。（要嘛就做，要嘛不做 ― 不要只是試試看。）

## 註釋 (Annotation)

* 註釋應該直接寫在相關程式碼那行之後。
* 註釋關鍵字後方伴隨著一個冒號及空白，接著一個描述問題的記錄。
* 如果需要用多行來描述問題，之後的行要放在 `#` 號後面並縮排兩個空白。

    ```Ruby
    def bar
      # FIXME: 這在 v3.2.1 版本之後會異常當掉，或許與
      #   BarBazUtil 的版本更新有關
      baz(:quux)
    end
    ```
* 在問題是顯而易見的情況下，任何的文件會是多餘的，註釋應該要留在可能有問題的那行。這個用法是例外而不是規則。

    ```Ruby
    def bar
      sleep 100 # OPTIMIZE
    end
    ```
* 使用 `TODO` 來標記之後應被加入的未實現功能或特色。
* 使用 `FIXME` 來標記一個需要修復的程式碼。
* 使用 `OPTIMIZE` 來標記可能影響效能的緩慢或效率低落的程式碼。
* 使用 `HACK` 來標記代碼異味，其中包含了可疑的編碼實踐以及應該需要重構。
* 使用 `REVIEW` 來標記任何需要審視及確認正常動作的地方。舉例來說：`REVIEW: 我們確定用戶現在是這麼做的嗎？`
* 如果你覺得適當的話，使用其他你習慣的註釋關鍵字，但記得把它們記錄在專案的 `README` 或類似的地方。

## 類別

* 當設計類別階層時，確認它們符合 [Liskov 代換原則](http://en.wikipedia.org/wiki/Liskov_substitution_principle)。
* 盡可能讓你的類別越[堅固](http://en.wikipedia.org/wiki/SOLID_(object-oriented_design\))越好。
* 永遠替類別提供一個適當的 `to_s` 方法給來表示領域模型（domain model）。

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

* 使用 `attr` 這類函數來定義瑣碎的 accessor 或 mutators。

    ```Ruby
    # 不好
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
  
* 考慮加入工廠方法來提供額外合理的方式，來創造一個特定類別的實體。

    ```Ruby
    class Person
      def self.create(options_hash)
        # 省略主體
      end
    end
    ```
* 偏好[鴨子類型](http://en.wikipedia.org/wiki/Duck_typing)勝於繼承。

    ```Ruby
    # 不好
    class Animal
      # 抽象方法
      def speak
      end
    end

    # 繼承高層次的類別 (superclass)
    class Duck < Animal
      def speak
        puts 'Quack! Quack'
      end
    end

    # 繼承高層次的類別 (superclass)
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
* 由於繼承中 "討厭的" 行為，避免使用類別變數 (`@@`)。

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

    如同你所看到的，在類別階級中的所有類別其實都共享一個類別變數。應該通常偏好使用實體變數而不是類別變數。

* 依據方法的目的用途指定適當的可視層級 (`private` ,`protected` )。別把所有方法都設為 `public` （方法的預設值）。我們現在是在寫 *Ruby* ，不是 *Python* 。
* `public`, `protected`, `private` 和方法定義有一樣的縮排。在每一個上方留一個空行。

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
* 使用 `def slef.method` 來定義 singleton 方法。這讓方法更能抵抗重構帶來的變化。

    ```Ruby
    class TestClass
      # 不好
      def TestClass.some_method
        # 省略主體
      end

      # 好
      def self.some_other_method
        # 省略主體
      end

      # 也有可能且當你要定義多個
      # singleton時的便利方法
      class << self
        def first_method
          # 省略主體
        end

        def second_method_etc
          # 省略主體
        end
      end
    end
    ```

## 異常

* 不要封鎖異常。

    ```Ruby
    begin
      # 這裡發生了一個異常
    rescue SomeError
      # 救援子句完全沒有做事
    end
    ```
* 不要為了控制流程而使用異常。

    ```Ruby
    # 不好
    begin
      n / d
    rescue ZeroDivisionError
      puts "Cannot divide by 0!"
    end

    # 好
    if d.zero?
      puts "Cannot divide by 0!"
    else
      n / d
    ```
  
* 避免救援 `Exception` 類別。

    ```Ruby
    # 不好 
    begin
      # 這裡發生了一個異常
    rescue
      # 異常處理
    end

    # 仍不好
    begin
      # 這裡發生了一個異常
    rescue Exception
      # 異常處理
    end
    ```

* 把較具體的異常放在救援串連的較上層，不然它們永遠不會被救援。

    ```Ruby
    # 不好
    begin
      # 一些程式碼
    rescue Exception => e
      # 一些處理
    rescue StandardError => e
      # 一些處理
    end

    # 好
    begin
      # 一些程式碼
    rescue StandardError => e
      # 一些處理
    rescue Exception => e
      # 一些處理
    end
    ```  
* 在 ensure 區塊中釋放你程式的外部資源。

    ```Ruby
    f = File.open("testfile")
    begin
      # .. 處理
    rescue
      # .. 錯誤處理
    ensure
      f.close unless f.nil?
    end
    ```
* 偏愛使用標準函式庫的異常處理勝於導入新的異常類別。

## 集合

* 當你需要使用一個字串的陣列時，偏好使用 `%w` 的字面陣列語法。

    ```Ruby
    # 不好
    STATES = ['draft', 'open', 'closed']

    # 好
    STATES = %w(draft open closed)
    ```
* 避免在陣列中創造巨大的間隔。


    ```Ruby
    arr = []
    arr[100] = 1 # 現在你有一個很多 nil 的陣列
    ```
* 當處理獨一無二的元素時，使用 `Set` 來替代 `Array` 。`Set` 實現了不重複的無序數值集合。`Set` 是陣列直觀的內部操作功能與雜湊的快速存取的混合體。
* 使用符號取代字串作為雜湊鍵。 

    ```Ruby
    # 不好
    hash = { 'one' => 1, 'two' => 2, 'three' => 3 }

    # 好
    hash = { one: 1, two: 2, three: 3 }
    ```
* 避免使用可變的物件作為鍵值。
* 優先使用新的 1.9 字面雜湊語法而不是 => (hashrocket) 語法。

    ```Ruby
    # 不好
    hash = { :one => 1, :two => 2, :three => 3 }

    # 好
    hash = { one: 1, two: 2, three: 3 }
    ```
* 相信這個事實吧， 1.9 的雜湊是有序的。
* 在遍歷一個集合時，不要改動它。

## 字串

* 偏好字串插值 (interpolation)，而不是字串串接 (concatenation)。

    ```Ruby
    # 不好
    email_with_name = user.name + ' <' + user.email + '>'

    # 好
    email_with_name = "#{user.name} <#{user.email}>"
    ```
* 當你不需要插入特殊符號如 `\t`, `\n`, `'`, 等等時，偏好單引號的字串。

    ```Ruby
    # 不好
    name = "Bozhidar"

    # 好
    name = 'Bozhidar'
    ```
* 不要使用 `{}` 圍繞要被插入字串的實體變數。

    ```Ruby
    class Person
      attr_reader :first_name, :last_name

      def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
      end

      # 不好
      def to_s
        "#{@first_name} #{@last_name}"
      end

      # 好
      def to_s
        "#@first_name #@last_name"
      end
    end
    ```
* 當你需要建構龐大的資料區段（chunk）時，避免使用 `String#+` 。
  使用 `String#<<` 來替代。字串串接在對的地方改變字串實體，並且永遠比 `String#+` 來得快，`String#+` 創造了一堆新的字串物件。

    ```Ruby
    # 好也比較快
    html = ''
    html << '<h1>Page title</h1>'

    paragraphs.each do |paragraph|
      html << "<p>#{paragraph}</p>"
    end
    ```

## 正規表示法

* 如果你只需要在字串中簡單的搜索文字，不要使用正規表示法：`string['text']`
* 針對簡單的字串查詢，你可以直接在字串索引中直接使用正規表示法。

    ```Ruby
    match = string[/regexp/]             # 獲得匹配正規表示法的內容
    first_group = string[/text(grp)/, 1] # 或得分組的內容
    string[/text (grp)/, 1] = 'replace'  # string => 'text replace'
    ```
* 當你不需要替結果分組時，使用非分組的群組。

    ```Ruby
    /(first|second)/   # 不好
    /(?:first|second)/ # 好
    ```
* 避免使用 `$1-9`，因為它們很難追蹤它們包含什麼。可以使用命名群組來替代。

    ```Ruby
    # 不好
    /(regexp)/ =~ string
    ...
    process $1

    # 好
    /(?<meaningful_var>regexp)/ =~ string
    ...
    process meaningful_var
    ```
* 字元類別只有幾個你需要關心的特殊字元：`^`, `-`, `\`, `]`，所以你不用逃脫字元 `.` 或在 `[]` 的中括號。
* 小心使用 `^` 與 `$` ，它們匹配的是一行的開始與結束，不是字串的開始與結束。如果你想要匹配整個字串，使用 `\A` 與 `\z`。(譯註：`\Z` 實為 `/\n?\z/`，使用 `\z` 才能匹配到有含新行的字串的結束)

    ```Ruby
    string = "some injection\nusername"
    string[/^username$/]   # 匹配
    string[/\Ausername\Z/] # 無匹配
    ```
* 針對複雜的正規表示法，使用 `x` 修飾符。這讓它們的可讀性更高並且你可以加入有用的註解。只是要小心忽略的空白。

    ```Ruby
    regexp = %r{
      start         # 一些文字
      \s            # 空白字元
      (group)       # 第一組
      (?:alt1|alt2) # 一些替代方案
      end
    }x
    ```

* 針對複雜的替換，`sub` 或 `gsub` 可以與區塊或雜湊來使用。

## 百分比字面 

* 隨意使用 `%w` 。

    ```Ruby
    STATES = %w(draft open closed)
    ```
* 使用 `%()` 給需要插值與嵌入雙引號的單行字串。多行字串，偏好使用 heredocs 。

    ```Ruby
    # 不好（不需要插值）
    %(<div class="text">Some text</div>)
    # 應該使用 '<div class="text">Some text</div>'

    # 不好（沒有雙引號）
    %(This is #{quality} style)
    # 應該使用 "This is #{quality} style"

    # 不好（多行）
    %(<div>\n<span class="big">#{exclamation}</span>\n</div>)
    # 應該是一個 heredoc

    # 好（需要插值、有雙引號以及單行）
    %(<tr><td class="name">#{name}</td>)
    ```
* 正規表示法要匹配多於一個的 `/` 字元時，使用 `%r`。

    ```Ruby
    # 不好
    %r(\s+)

    # 仍不好
    %r(^/(.*)$)
    # 應當是 /^\/(.*)$/

    # 好
    %r(^/blog/2011/(.*)$)
    ```
* 避免 `%q`, `%Q`, `%x`, `%s` 以及 `%W`。
* 偏好 `()` 作為所有 `%` 字面的分隔符。

## 元程式設計

* 寫一個函式庫時不要在核心類別搗亂（不要替它們加 monkey patch）

* 偏好區塊形式的 `class_eval` 勝於字串插值 (string-interpolated)的形式。 
  - 當你使用字串插值形式時，總是提供 `__FILE__` 及 `__LINE__`，使你的 backtrace 看起來有意義：

    ```ruby
    class_eval "def use_relative_model_naming?; true; end", __FILE__, __LINE__
    ```
    
  - 偏好 `define_method` 勝於 `class_eval{ def ... }`
    
* 當使用 `class_eval` （或其它的 `eval`）搭配字串插值時，添加一個註解區塊，來顯示如果做了插值的樣子（我從 Rails 程式碼學來的一個實踐）： 

    ```ruby
    # 從 activesupport/lib/active_support/core_ext/string/output_safety.rb
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
* 元程式設計避免使用 `method_missing`。會讓 Backtraces 變得很凌亂；行為沒有列在 `#methods` 裡；拼錯的方法呼叫可能默默的工作（`nukes.luanch_state = false`)。考慮使用 delegation, proxy, 或是 `define_method` 來取代。如果你必須使用 `method_missing`，
  - 確保[也定義了 `respond_to?`](http://devblog.avdi.org/2011/12/07/defining-method_missing-and-respond_to-at-the-same-time/)
  - 僅捕捉字首定義良好的方法，像是 `find_by_*` ― 讓你的程式碼愈肯定(assertive)愈好。
  - 在最後的敘述句(statement)呼叫 `super`
  - 從 delegate 到 assertive, 不神奇的(non-magical)方法：

    ```ruby
    # 不好
    def method_missing?(meth, *args, &block)
      if /^find_by_(?<prop>.*)/ =~ meth
        # ... lots of code to do a find_by
      else
        super
      end
    end

    # 好
    def method_missing?(meth, *args, &block)
      if /^find_by_(?<prop>.*)/ =~ meth
        find_by(prop, *args, &block)
      else
        super
      end
    end

    # 而最好的是，在每個可找到的屬性被宣告時，使用 `define_method`。
    ```

## 其它

* `ruby -w` 寫出安全的程式碼。
* 避免使用雜湊作為選擇性參數。這個方法是不是做太多事情了？
* 避免方法長於 10 行程式碼（LOC）。理想上，大部分的方法會小於5行。空行不算進 LOC 裡。
* 避免參數列表長於三或四個參數。
* 如果你真的需要，加入 "全域" 變數到核心以及把它們設為私有的。
* 使用實體變數而不是全域變數。

    ```Ruby
    # 不好
    $foo_bar = 1

    # 好
    class Foo
      class << self
        attr_accessor :bar
      end
    end

    Foo.bar = 1
    ```
* 當 `alias_method` 可以做到時，避免使用 `alias` 。
* 使用 `OptionParser` 來解析複雜的命令行選項及 `ruby -s` 來處理瑣碎的命令行選項。
* 用函數式的方法寫程式，在有意義的情況下避免賦值。
* 避免不需要的元程式設計。
* 不要變動參數，除非那是方法的目的。
* 避免超過三行的巢狀區塊。
* 保持一致性。在理想的世界裡，遵循這些準則。
* 使用常識。


# 貢獻

在本指南所寫的每個東西都不是定案。這只是我渴望想與同樣對 Ruby 程式設計風格有興趣的大家一起工作，以致於最終我們可以替整個 Ruby 社群創造一個有益的資源。

歡迎開票或發送一個帶有改進的更新請求。在此提前感謝你的幫助！

# 口耳相傳

一份社群策動的風格指南，對一個社群來說，只是讓人知道有這個社群。推特這個指南，分享給你的朋友或同事。我們得到的每個註解、建議或意見都可以讓這份指南變得更好一點。而我們想要擁有的是最好的指南，不是嗎？
