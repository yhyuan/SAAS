#http://www.nach-vorne.de/2007/4/24/attr_accessor-on-steroids/
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s  # make sure it's a string
    attr_reader attr_name  # create the attribute's getter
    attr_reader attr_name + "_history" # create bar_history getter
    #class_eval "your code here, use %Q for multiline strings"
 
    define_method "#{attr_name}=" do |value|
       history = instance_variable_get( "@#{attr_name}_history" )
       if (!history.kind_of?(Array))
          history = [nil]          
       end
       history.push(value)
       instance_variable_set( "@#{attr_name}_history", history )
       instance_variable_set( "@#{attr_name}", value )
    end
    define_method "#{attr_name}_history" do
       instance_variable_get( "@#{attr_name}_history" )      
    end 
  end
end
 
class Foo
  attr_accessor_with_history :bar
end
 
f = Foo.new
f.bar = 1
f.bar = 2
puts f.bar_history # => if your code works, should be [nil,1,2]
f = Foo.new
f.bar = 4
puts f.bar_history