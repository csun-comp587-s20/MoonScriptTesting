--Deconstruction Continued with for loops

--Testing name
tuples = {
  {"hello", "world"}
  {"egg", "sandwich"}
  {"iced", "coffee" }

}

for {left, right} in *tuples
  assert left == "hello" or "egg" or "iced"
  assert right == "world" or "sandwich" or "coffee"
  --Sanity Check: this fails
  --assert left == "cookie"



--Testing with numbers

pairs = {
  {2, 5}
  {6, 4}
  {5, 9}
  {10, 4}
  {6, 7}
  {2, 15}
}

answers = {10, 24, 45, 40, 42, 30}

for {x, y} in *pairs
  for answer in *answers
    if x * y == answer
       print "assertion passed: #{x} * #{y} = #{answer}"

--According to documentation this is the limits deconstruction goes...I will use deconstruction to help automate some test cases


--Conditionals in assignment statements, using if and unless



is_pink = (item) ->
--If adding or: item == "_" or "_" assertions fail...
  if item == "keyboard"
    true
  else
    false

result = if is_pink "keyboard"
  "Keyboard is pink"
else
  "Sorry, that is not pink."

testmsg = if assert result == "Keyboard is pink"
  "assertion passed: Keyboard is pink" 
else
  "failed"

print testmsg


resultf = if is_pink "coffee"
  "coffee is pink"
else
  "coffee is not pink"

failmsg = if resultf == "coffee is not pink"
  "assertion passed: coffee is indeed not pink"
else
  "assertion failed: coffee was pink"

print failmsg


--Adding test to show or failure mentioned above
--According to documentation, this should pass, but it does not

is_tired = (person) ->
  if person == "elena" or "kyle" --this or results in failure
    true
  else
    false

testerror = if is_tired "helen"
  "Helen is tired?"
else
  "They are not tired"

errormsg = if assert testerror == "Helen is tired?"
  "assertion is false positive: Helen shouldn't be tired. Only elena and kyle"
else
  "assertion passed: nvm no error"

print errormsg


--Testing without or, using nested ifs

is_tired2 = (person) ->
  if person == "elena"
    true
  if person == "kyle"
    true
  else
    false

testerror2 = if is_tired2 "helen"
  "Helen is tired?"
else
  "They are not tired"

errormsg = if testerror2 == "They are not tired"
  "assertion passed: Correct, Helen is not tired"
else
  "assertion failed: Helen should not be tired"

print errormsg

test3 = if is_tired2 "elena"
  "elena is tired"
else
  "elena should be tired"

msg = if test3 == "elena is tired"
 "assertion passed: elena is tired."
else
  "assertion failed: elena should be tired"

print msg

--I am led to believe that if statements have errors according to documentation....
