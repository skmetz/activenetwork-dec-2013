require 'delegate'

class Fixnum
  def to_container_number
    begin
      Object.const_get("ContainerNumber#{self}")
    rescue NameError
      ContainerNumber
    end.new(self)
  end
end

class ContainerNumber < SimpleDelegator
  def pred
    __getobj__.pred.to_container_number
  end

  def to_s
    "#{inventory} #{container}"
  end

  def container
    'bottles'
  end

  def inventory
    __getobj__.to_s
  end

  def action
    'Take one down and pass it around'
  end
end

class ContainerNumber0 < ContainerNumber
  def inventory
    'no more'
  end

  def action
    'Go to the store and buy some more'
  end

  def pred
    99.to_container_number
  end
end

class ContainerNumber1 < ContainerNumber
  def container
    'bottle'
  end

  def action
    'Take it down and pass it around'
  end
end
