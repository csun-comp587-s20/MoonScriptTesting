--If deconstruction works, then {1,2,3} = {a,b,c} and {d,e,f} = {1,2,3}
--Testing for basic one value inputs.

input = {1,2,3}
{a,b,c} = {1,2,3}
{d,e,f} = input

print assert a == 1
print assert b == 2
print assert c == 3
print assert d == 1
print assert e == 2
print assert f == 3

-- On purpose
--assert f == 1

--Testing with key's
influencers =
      youtube: "David Dobrik"
      instagram: "Kylie Jenner"
      tiktok: "Charlie"


print assert influencers.youtube == "David Dobrik"
print assert influencers.instagram == "Kylie Jenner"
-- Sanity Check
--print assert influencers.instagram == "David Dobrik"
print assert influencers.tiktok == "Charlie"


teachers =
 cs:
  name: "Kyle Dewey"
  location: {
    "Jacaranda Hall"
    "2221"
  }

{cs:{:name, location: {hall, room}}} = teachers


print assert name == "Kyle Dewey"
print assert hall == "Jacaranda Hall"
--Sanity Check
--assert room == "Jacaranda Hall"
print assert room == "2221"

--Test with different names
moreteachers =
  cs:
   name: "Kyle Dewey"
   location: {
     "Jacaranda Hall"
     "2221"
   }
  math:
   name: "Patrick Star"
   location: {
     "Bikini Bottom"
     "Rock"
   }
  science:
   name: "Rick Sanchez"
   location: {
     "Earth"
     "C-137"
   }


{cs:{:name, location: {hall, room}},math:{:name, location: {city, house}},science:{:name, location:{planet, dimension}}} = moreteachers


--assertion fails...
--assert math.name == "Patrick Star"
--assertion passes like so

--THIS WILL INDEX INTO NIL
--Location is a table
print assert moreteachers.cs.location.hall == Nil

print assert moreteachers.math.name == "Patrick Star"
print assert city == "Bikini Bottom"
print assert house == "Rock"
print assert planet == "Earth"
print assert dimension == "C-137"


--Changing the variable names

object =
 hello: "world"
 day: "tuesday"
 length: 20

{hello: hello, day: weekday, length: inches} = object

print assert hello == "world"
print assert weekday== "tuesday"
print assert inches == 20
--OLD KEY CANNOT BE USED TO RESTRUCTURE, failures
--print assert day == "tuesday"
--print assert length = 20


--Summary for destructuring data:
-- Destructuring data works as described and can be overwritten. Documentation states that loops can be used with this to abstract data. This will be tested in the next pull request.
