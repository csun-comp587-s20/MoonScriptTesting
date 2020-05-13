--Pull number 4
--Testing classes and super methods continued
--Super methods here are very confusing. I read the documentation
--3 times to understand all unique cases
--These are the cases that I could identify as unique for using super

class Nums
  _count: 111
  counter: => @_count

class eightNums extends Nums
  counter: => "%08d"\format super!

instance = eightNums!
print assert instance\counter! == "00000111"



class Base
  _count: 111
  counter: =>
       @_count

class Thing extends Base
  other_method: => super\counter!

--Should take method from super, 111
instance = Thing!
print assert instance\other_method! == 111



--The super class method belongs to Page, not words.
--Has to do with inheritance and the extension

class Page
class Words extends Page
    get_super: => super

instance = Words!
print assert instance\get_super! == Page


class Foo
   count: 1
   get_count: => @count

class Bar extends Foo
   get_count: => "this is wrong"
   get_method: => super\get_count

instance = Bar!

--the Double exclamation point I do not understand fully.
--if one exclamation is left result is a pointer to the function
print assert instance\get_method!! == 1

class SuperBase
  @cons: "super cons"
  cons: "base cons"

--Base should take on the super constructor in SuperBase
class Base extends SuperBase
print assert "super cons"== Base.cons

--Similar Test, but without base and super method
class Hello
  prop: "world"

class Goodbye extends Hello
--Goodbye should inherit everything from Hello
print assert "world"== Goodbye.prop

--Calling this one a trickle down, not the official name
--Testing to see if methods trace back up

class One
  @a: =>
    1
-- Expecting 1 + 2
class Two extends One
  @a: =>
    super! + 2

-- should be 1 + 2 + 3 because super! calls from two.
class Three extends Two
   @a: =>
     super! + 3

class Four extends Three
   @a: =>
     super! + 4

print assert Four\a! == 10


--Dealing with parent classes and overwriting constructors

class Foo
   @value: "foo"
   num: => 1205
   char: => "a"

class Bar
   @value: "bar"
   num: => 0131
   char: => "b"

class Bass extends Foo
   num: =>
     super! + 1
   get_super: =>
      super

instance = Bass!

print assert "a" == instance\char!
print assert 1206 == instance\num!
print assert Foo == instance\get_super!

Bass.__parent = Bar
setmetatable Bass.__base, Bar.__base

print assert "b" == instance\char!
print assert 0132 == instance\num!
print assert Bar == instance\get_super!
