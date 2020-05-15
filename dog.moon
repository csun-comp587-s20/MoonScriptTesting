class Dog
   @name = name
   @breed = breed
   @color = color
   @owner = owner
   trick_list: {}

   add_name: (name) =>
      @name = name
   add_breed: (breed) =>
      @breed = breed
   add_color: (coat_color) =>
      @color = coat_color
   add_owner: (owner_name) =>
      @owner = owner_name
   add_trick: (trick_name) =>
      table.insert @trick_list, trick_name


my_dog = Dog!
my_dog\add_name "Beans"
my_dog\add_breed "Aussie"
my_dog\add_color "brown"
my_dog\add_trick "roll over"
my_dog\add_trick "speak"
my_dog\add_trick "sit"
my_dog\add_trick "stay"
my_dog\add_trick "follow"

print "My dog's name is", my_dog.name
print "My dog's breed is", my_dog.breed
print trick for trick in *my_dog.trick_list  
