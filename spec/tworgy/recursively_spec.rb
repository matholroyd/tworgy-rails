require 'spec_helper'

describe "recursively" do
  it 'should turn the items in the array to strings' do
    [1, 2, [3, 4]].recursively(&:to_s).should == ['1', '2', ['3', '4']]
  end
  
  it 'should turn the items in the hash to strings (except leaves)' do
    {:a => {:b => :c}}.recursively do |ob|
      if ob.is_a?(Hash)
        ob.keys.each do |k|
          ob[k.to_s] = ob[k]
          ob.delete(k)
        end
      end
      ob
    end.should == {'a' => {'b' => :c}}
  end
end
