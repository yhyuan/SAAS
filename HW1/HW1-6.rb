class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id, *args)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      if(method_id == :in)
          singular_currency = args[0].to_s.gsub( /s$/, '')
          if @@currencies.has_key?(singular_currency)
              self / @@currencies[singular_currency]
          else
              super
          end
      else
          super
      end
    end
  end
end
 
#puts 5.dollars.in(:euros)
#puts 10.euros.in(:rupees)
 
class String
  def method_missing(method_id)
      if(method_id == :palindrome?)
          str = self.gsub(/\W/, "").downcase
          if(str == str.reverse)
              true
          else
              false
          end
      else
          super
      end
  end
end
 
#puts "A man, a plan, a canal - Panama".palindrome?
 
module Enumerable
  def method_missing(method_id)
      if(method_id == :palindrome?)
          #str = self.gsub(/\W/, "").downcase
          #print self
          list1 = []
          self.each { |number| list1.push (number) }
          list2 = []
          self.reverse_each { |number| list2.push (number) }
          if(list1 == list2)
              true
          else
              false
          end
      else
          super
      end
  end
end
 
puts [1,2,3,2,1].palindrome?