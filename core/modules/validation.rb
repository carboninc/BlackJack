# Validation
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  # Class Method Validate: get params and types for validation
  module ClassMethods
    attr_accessor :validation

    def validate(name, type)
      @validation ||= []
      @validation << { attr: name, type: type }
    end
  end

  # Validation of attributes depending on the selected method
  module InstanceMethods
    def validate!
      Player.validation.each do |attr|
        method = "validate_#{attr[:type]}".to_sym
        send(method, attr[:attr])
      end
      true
    end

    private

    def validate_presence(attr)
      value = instance_variable_get("@#{attr}")
      raise 'Имя не должно быть пустым' if value.empty? || value.nil?
    end

    def validate_name_length(attr)
      value = instance_variable_get("@#{attr}")
      raise 'Имя должно содержать не менее 3 символов' if value.length < 3
    end
  end
end
