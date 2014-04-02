# Prelúdio

> Modelos são importantes. <br/>
> --Oficial Alex Murphy de J. / RoboCop

Uma coisa que sempre me incomodou como um desenvolvedor Ruby - desenvolvedores Python tem uma ótima referência de estilo de programação ([PEP-8] (http://www.python.org/dev/peps/pep-0008/)) e nós nunca tivemos um guia oficial, documentando um estilo de codificação em Ruby e as melhores práticas. E eu acredito que o estilo importe. Eu também acredito que uma grande comunidade hacker, tal como Ruby tem, deve ser capaz de produzir este documento tão cobiçado.

Este guia começou sua vida com as diretrizes internas de codificação em Ruby (escrito por mim mesmo). Em um dado momento eu decidi que o trabalho que estava fazendo poderia ser interessante para os membros da comunidade Ruby em geral e que o mundo não tinha necessidade para outra diretriz interna de uma empresa. Mas o mundo certamente poderia se beneficiar de um conjunto de práticas, expressões idiomáticas e prescrições de estilo de programação Ruby orientado e sancionado pela Comunidade.

Desde a criação do guia, eu recebi um monte de feedback de
Membros da excepcional comunidade Ruby mundo a fora. Obrigado por
todas as sugestões e o apoio! Juntos podemos fazer um recurso
benéfico para cada desenvolvedor Ruby lá fora.

A propósito, se você está no Rails você pode querer verificar o
complementar [Ruby on Rails 3 & 4 Style Guide](https://github.com/bbatsov/rails-style-guide).

O Guia de Estilo Ruby

Este guia de estilo Ruby recomenda as melhores práticas para que programadores reais de Ruby possam escrever códigos que possam ser mantidos por outros programadores reais de Ruby. Um guia de estilo que reflete o uso que o mundo real está acostumado e um
guia de estilo que se prende a um ideal que foi rejeitado pelo povo supõe-se que o melhor é não usá-lo para nada – não importa o quão bom seja.

O guia é separado em várias seções de regras relacionadas. Tenho
Tentei adicionar a lógica por trás das regras (se estiver omitido, eu assumi que é bastante óbvio).

Eu não vim com todas as regras do nada - são na maioria
com base na minha extensa carreira como profissional de engenharia de software, comentários e sugestões dos membros da comunidade Ruby e
vários recursos de programação Ruby altamente recomendados, tais como
["Programming Ruby 1.9"](http://pragprog.com/book/ruby4/programming-ruby-1-9-2-0) e ["The Ruby Programming Language"](http://www.amazon.com/Ruby-Programming-Language-David-Flanagan/dp/0596516177).

Há algumas áreas em que não há nenhum consenso na Comunidade Ruby em relação um determinado estilo (como estilo de declaração de cadeia de caracteres literais, espaçamento dentro de hashes literais, posição do ponto no método de encadeamento multi-linha, etc.). Em tais situações, todos os estilos populares são reconhecidos e cabe a você escolher um e aplicá-lo de forma consistente.

O guia ainda é um trabalho em andamento - algumas regras possuem exemplos escassos, algumas regras não tem exemplos que as ilustrem claramente. No devido tempo, estas questões serão abordadas - apenas mantenha-los em mente por enquanto.

Você pode gerar um PDF ou uma cópia HTML deste guia usando
[Transmuter](https://github.com/TechnoGate/transmuter).

[RuboCop](https://github.com/bbatsov/rubocop) é um analisador de código,
baseado neste guia de estilo.

Traduções do guia estão disponíveis nos seguintes idiomas:

* [Chinês simplificado](https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhCN.md)
* [Chinês tradicional](https://github.com/JuanitoFatas/ruby-style-guide/blob/master/README-zhTW.md)
* [Francês](https://github.com/porecreat/ruby-style-guide/blob/master/README-frFR.md)
* [Japonês](https://github.com/fortissimo1997/ruby-style-guide/blob/japanese/README.ja.md)
* [Espanhol](https://github.com/alemohamad/ruby-style-guide/blob/master/README-esLA.md)
* [Vietnamita](https://github.com/scrum2b/ruby-style-guide/blob/master/README-viVN.md)

## Tabela de conteúdos

* [Layout do código fonte](#source-code-layout)
* [Sintaxe](#syntax)
* [Nomenclatura](#naming)
* [Comentários](#comments)
  * [Anotações em Comentário](#comment-annotations)
* [Classes](#classes--modules)
* [Exceções](#exceptions)
* [Coleções](#collections)
* [Strings](#strings)
* [Expressões Regulares](#regular-expressions)
* [Literais Percentuais](#percent-literals)
* [Meta-programação](#metaprogramming)
* [Miscelânea](#misc)
* [Ferramentas](#tools)

# # Layout do código fonte

> Quase todo mundo está convencido que todos os estilos, exceto os seus são
> feios e ilegíveis. Deixe de lado o "exceto seus próprios" e eles estarão
> Provavelmente certo... <br/>
> -- Jerry Coffin (sobre recuo)

* Use 'UTF-8' como a codificação do arquivo de fonte.
* Use dois ** espaços ** por nível de recuo (conhecido como soft tabs). Nada de hard tabs.

  ```Ruby
  # mau - quatro espaços
  def some_method
      do_something
  end

  # bom
  def some_method
    do_something
  end
  ```

* Use o finais de linha no estilo Unix. (* Usuários BSD/Solaris/Linux/OS X estão cobertos por padrão, usuários do Windows precisam ter cuidado extra).
* Se você estiver usando o Git, você pode querer adicionar a seguinte
definição de configuração para proteger o seu projeto do aterrorizante fim de linha do Windows:

```bash
$ git config --global core.autorcrlf true
```

* Não use ';' para separar as declarações e expressões. Como um
corolário - use uma expressão por linha.

```Ruby
# mau
puts 'foobar'; # ponto e vírgula supérfluo

puts 'foo'; puts 'bar' # duas expressões na mesma linha

# bom
puts 'foobar'

puts 'foo'
puts 'bar'

puts 'foo', 'bar' # isto aplica-se ao puts em particular
```

* Preferir um formato de linha única para as definições de classe sem corpo.

```Ruby
# mau
class FooError < StandardError
end

# ok
class FooError < StandardError; end

# bom
FooError = Class.new(StandardError)
```

Evite o métodos de linha única. Embora sejam um tanto populares no
selvagem, existem algumas peculiaridades sobre a sintaxe de definição
Isso torna seu uso indesejável. De qualquer forma - não deveria haver mais do que uma expressão em um método de linha única.

```Ruby
# mau
def muito; alguma_coisa; alguma_outra_coisa; end

# ok - Observe que o primeiro ; é necessário
def metodo_sem_parenteses; corpo; end

# ok - Observe que o segundo ; é opcional
def metodo_sem_parenteses; corpo; end

# okish - sintaxe válida, mas sem o ; é difícil de ler
def metodo() corpo end

# Bom
def metodo
  corpo
end
```

Uma exceção à regra são os métodos de corpo vazio.

```Ruby
# bom
def no_op; fim
```

* Use espaços em torno de operadores, após vírgulas, dois-pontos e ponto e vírgula, em volta do `{` e antes do `}`. Espaço em branco pode ser (na maioria dos casos) irrelevante para o intérprete de Ruby, mas sua utilização correcta é a chave para escrever um código facilmente legível.

```Ruby
sum = 1 + 2
a, b = 1, 2
1 > 2 ? true : false; puts 'Hi'
[1, 2, 3].each { |e| puts e }
```

A única exceção, sobre os operadores, é o operador de expoente:

```Ruby
# mau
e = M * c * * 2

# bom
e = M * c**2
```

' {' e '}' merecem um pouco de esclarecimento, pois eles são usados
para blocos e hashes literais, bem como expressões incorporadas em
seqüências de caracteres. Para hash, dois estilos literais são considerados aceitáveis.

```Ruby
# boa - espaço após { e antes }
{ um: 1, dois: 2 }

# boa - sem espaço após { e antes }
{um: 1, dois: 2}
```

A primeira variante é ligeiramente mais legível (e sem dúvida mais
popular na comunidade Ruby em geral). A segunda variante tem
a vantagem de adicionar a diferença visual entre o bloco e hash
literais. Qualquer um que você escolher - aplique-o de forma consistente.

Com as expressões incorporadas, há também duas opções aceitáveis:

```Ruby
# boa - sem espaços
"string #{expr}"

# ok - indiscutivelmente mais legível
"string #{ expr }"
```

O primeiro estilo é extremamente mais popular e é geralmente
aconselhados a ficar com ele. O segundo, por outro lado, é
(sem dúvidas) um pouco mais legível. Como com hashes - escolha um estilo e aplique-o de forma consistente.

* Sem espaços após `(`, `[` ou antes `]`, `)`.

```Ruby
alguns(arg).outro
[1, 2, 3].size
```

* Sem espaço após `!`.

```Ruby
# mau
! algo

# bom
!algo
```

* Idente `when` no nível do `case`. Eu sei que muitos discordariam com isso, mas é o estilo estabelecido em ambos "The Ruby Programming Language" e "Programming Ruby".

```Ruby
# mau
case
  when song.name = = 'Misty'
    puts 'Não!'
  when song.duration > 120
    puts 'Muito tempo'!
  when Time.now.hour > 21
    puts "É tarde demais"
  else
    Song.Play
end

# bom
case
when song.name = = 'Misty'
  coloca 'Não!'
when song.duration > 120
  coloca 'Muito tempo'!
when Time.now.hour > 21
  coloca "É tarde demais"
else
  Song.Play
end
```

* Quando você atribuir o resultado de uma expressão condicional a uma variável, preservar o alinhamento normal dos seus ramos.

' ' Ruby
# ruim - muito complicado
tipo = case ano
when 1850..1889 then 'Blues'
when 1890..1909 then 'Ragtime'
when 1910..1929 then 'New Orleans Jazz'
when 1930..1939 then 'Swing'
when 1940..1950 then 'Bebop'
else 'Jazz'
end

resultado = if condicao
  calc_algo
else
  calc_outro_algo
end

# boa - é evidente o que está acontecendo
tipo = case ano
       when 1850..1889 then 'Blues'
       when 1890..1909 then 'Ragtime'
       when 1910..1929 then 'New Orleans Jazz'
       when 1930..1939 then 'Swing'
       when 1940..1950 then 'Bebop'
       mais 'Jazz'
       end

resultado = if condicao
              calc_algo
            else
              calc_outro_algo
            end
  

# bom (e um pouco mais largamente eficiente)
kind =
  case ano
  when 1850..1889 then 'Blues'
  when 1890..1909 then 'Ragtime'
  when 1910..1929 then 'New Orleans Jazz'
  when 1930..1939 then 'Swing'
  when 1940..1950 then 'Bebop'
  else 'Jazz'
  end

resultado =
  if condicao
    calc_algo
  else
    calc_outro_algo
  end
```