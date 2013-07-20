=begin
HW 1-4: BASIC OBJECT ORIENTED PROGRAMMING

Part A: Create a class Dessert with getters and setters for name and calories. Define instance methods healthy?, which returns true if a dessert has less than 200 calories, and delicious? which returns true for all desserts.

Here is the framework:

class Dessert
    def initialize(name, calories)
        # Your code here
    end

    def healthy?
        # Your code here
    end

    def delicious?
        # Your code here
    end
end
Note: You may define additional helper methods.

Part B: Create a class JellyBean that extends Dessert, and add a getter and setter for flavor. Modify delicious? to return false if the flavor is "black licorice" (but delicious? should still return true for all other flavors and for all non-JellyBean desserts).

The JellyBean class should look like this:

class JellyBean < Dessert
    def initialize(name, calories, flavor)
        # Your code here
    end

    def delicious?
        # Your code here
    end
end
Note: As before, you may define additional helper methods.
=end
class Dessert
  attr_accessor :name
  attr_accessor :calories
  
  def initialize(name, calories)
    @name=name
    @calories=calories
  end
  
  def healthy?
     @calories<200 
  end
 
  def delicious?
    true
  end
end
 
class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(name, calories, flavor)
    @name=name 
    @calories=calories
    @flavor=flavor
  end
  
  def delicious?
    if @flavor== "black licorice"
      false
    else
      true
    end
  end
end
 
