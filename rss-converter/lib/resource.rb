class Resource

  attr_reader :uri, :type, :properties

  def initialize(uri, type)
    @uri = uri
    @type = type
    @properties = {}
  end

  def add_property(name, value)
    @properties[name] = value
    self
  end

end
