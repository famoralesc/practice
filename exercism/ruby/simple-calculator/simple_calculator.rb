class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  class UnsupportedOperation < StandardError; end

  def self.operation_map
    {
      :+ => :sum_operation,
      :/ => :div_operation,
      :* => :mult_operation
    }
  end

  def self.calculate(first_operand, second_operand, operation)
    unless operation
      raise UnsupportedOperation
    end
    method = self.operation_map[operation.to_sym]
    if method
      send(method, first_operand, second_operand)
    else
      raise UnsupportedOperation
    end
  end

  def self.sum_operation(first_operand, second_operand)
    begin
      result = first_operand + second_operand
    rescue TypeError => e
      raise ArgumentError
    end
    "#{first_operand} + #{second_operand} = #{result}"
  end
  
  def self.div_operation(first_operand, second_operand)
    begin
      result = first_operand / second_operand
    rescue ZeroDivisionError => e
      return "Division by zero is not allowed."
    end
    "#{first_operand} / #{second_operand} = #{first_operand / second_operand}"
  end

  def self.mult_operation(first_operand, second_operand)
    begin
      result = first_operand * second_operand
    rescue TypeError => e
      raise ArgumentError
    end
    "#{first_operand} * #{second_operand} = #{result}"
  end

end
