class Resource

  attr_reader :uri, :type, :properties

  def initialize(uri, type)
    @uri = uri
    @type = type
    @properties = {}
  end

  def add_property(name, value)
    raise "name can't be nil or empty" if name.nil? || name.empty?
    unless value.nil? 
        @properties[name] = value
        define_singleton_method(name){ @properties[name]}
    end
    self
  end

end
