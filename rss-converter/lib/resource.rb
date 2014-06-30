class Resource

  attr_reader :uri, :type, :properties

  def initialize(uri, type)
    @uri = uri
    @type = type
    @properties = {}
  end

  def add_property(name, value)
    raise "name can't be nil or empty" if name.nil? || name.empty?
    @properties[name] = value
    define_singleton_method(name){ @properties[name]}
    self
  end

end
