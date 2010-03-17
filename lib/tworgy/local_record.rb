class LocalRecord < Struct.new :id, :name
  @@all_children = {}

  def self.inherited(klass)
    @@all_children[klass] = []
  end
  
  def initialize(id, name)
    self.id = id
    self.name = name
    self.class.const_set(name.titleize.gsub(/ /, ''), self)
    LocalRecord.append_to_all(self.class, self)
  end

  def self.all
    @@all_children[self]
  end

  def self.append_to_all(klass, record)
    @@all_children[klass] << record
  end
  
  def self.selections
    all.collect {|c| [c.name, c.id]}
  end

  def self.find(*args)
    if args.length == 1
      id = args[0]  
      all.find { |c| c.id == id }
    elsif args.length == 2
      if args[0].is_a?(Fixnum)
        find(args[0])
      else
        DBC.assert(false, "No code written to handle args => #{args.inspect}")
      end
    else
      DBC.assert(false, "No code written to handle args => #{args.inspect}")
    end
  end

  def self.pick_random
    all[rand(all.length)]
  end
  
  def to_s
    name
  end   
  
  def <=>(b) 
    self.name <=> b.name
  end
  
  def new_record?
    false
  end
end