class CartesianProduct
  include Enumerable
     def initialize(array1,array2)
        @array1 = array1
        @array2 = array2
     end
     def each  
        @array1.each do |i|
             @array2.each do |j|
                  yield [i,j]
             end           
        end
     end #while def each
end #class 
c = CartesianProduct.new([:a,:b,:c],[4,5])
c.each { |elt| puts elt.inspect }
#[:a, 4]
#[:a, 5]
#[:b, 4]
#[:b, 5]
#[:c, 4]
#[:c, 5]
c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)