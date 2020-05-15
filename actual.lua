local Dog
do
  local _class_0
  local _base_0 = {
    trick_list = { },
    add_name = function(self, name)
      self.name = name
    end,
    add_breed = function(self, breed)
      self.breed = breed
    end,
    add_color = function(self, coat_color)
      self.color = coat_color
    end,
    add_owner = function(self, owner_name)
      self.owner = owner_name
    end,
    add_trick = function(self, trick_name)
      return table.insert(self.trick_list, trick_name)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function() end,
    __base = _base_0,
    __name = "Dog"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  local self = _class_0
  self.name = name
  self.breed = breed
  self.color = color
  self.owner = owner
  Dog = _class_0
end
local my_dog = Dog()
my_dog:add_name("Beans")
my_dog:add_breed("Aussie")
my_dog:add_color("brown")
my_dog:add_trick("roll over")
my_dog:add_trick("speak")
my_dog:add_trick("sit")
my_dog:add_trick("stay")
my_dog:add_trick("follow")
print("My dog's name is", my_dog.name)
print("My dog's breed is", my_dog.breed)
local _list_0 = my_dog.trick_list
for _index_0 = 1, #_list_0 do
  local trick = _list_0[_index_0]
  print(trick)
end
