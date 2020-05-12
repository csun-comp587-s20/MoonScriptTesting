--Pull request 3: Unit Tests for Classes part 1.
--This pull request should cover OOP properties of classes
--Included: inheratance & properties
--Partially included: Super class types.

--Basic class with assignment value

class Foo
   new: =>
     @color = "blue"

instance = Foo!

print assert instance.color == "blue"
--Sanity Check
--assert instance.color == "purple"

--Continue to evolve class

class Foo
      get_color: => @color

      new: =>
        @color = "blue"

instance = Foo!
print assert instance\get_color! == "blue"


class Foo
  color: "blue"
  get_color: => @color

instance = Foo!
print assert instance\get_color! == "blue"
print assert Foo.color == "blue"


--Inheritance Testing & Properties

class Bar
  get_property: => @[@property]
  new: (@property) =>

class Foo extends Bar
      color: "pink"

instance = Foo "color"
print assert instance\get_property! == "pink"


class Cookie
class Milk extends Cookie

instance = Cookie!

print assert Cookie.__name == "Cookie"
print assert Milk.__name == "Milk"
print assert Milk.__parent == Cookie
print assert instance.__class == Cookie

--Private variables in classes
--According to documentation only "new" is set to public
--Without keyword it is automatically private and not able to be called
--directly without getter method.

class Sparkle
    @height: 10

Sparkle.color = "blue"

instance = Sparkle!
print assert instance.color == nil
print assert instance.height == nil


--Precedence with class properties
--Moonscript @ denotes a class property over a base property.
--Documentation states that class properties should always overwrite

class Jinx
   @item: "rocket launcher"
   item: "belt"

print assert "rocket launcher" == Jinx.item


--Beginning of super class testing
--Super constructor testing: Super constructor should always be called.

class Cake
   new: (@property) =>

class Frosting extends Cake
   new: (@flavor) =>
     super "flavor"

--Super constructor will be used here
panecito = Frosting "cottoncandy"

print assert panecito.property == "flavor"
print assert panecito.flavor == "cottoncandy"
--Sanity Check
--print assert panecito.flavor == "flavor"
