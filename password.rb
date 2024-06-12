class Password
  def initialize(conteudo)
    @has_valid_size = false
    @has_upper_case = false
    @has_lower_case = false
    @has_digit = false
    @has_symbol = false

    validate_password(conteudo)

    @conteudo = conteudo
    @power = self.get_power
  end

  def get_power
    @power = 1.25 * @conteudo.length + 62.5
  end

  def conteudo
    @conteudo
  end

  def conteudo=(value)
    @has_valid_size = false
    @has_upper_case = false
    @has_lower_case = false
    @has_digit = false
    @has_symbol = false
    validate_password(value)
    @conteudo = value
  end

  private

  def validate_password(conteudo)
    @has_valid_size = true if has_valid_size?(conteudo)
    conteudo.split('').each do |c|
      @has_upper_case = true if is_upper_case?(c)
      @has_lower_case = true if is_lower_case?(c)
      @has_digit = true if has_digit?(c)
      @has_symbol = true if has_symbol?(c)
    end

    raise_error
  end

  def raise_error
    unless @has_valid_size and @has_upper_case and @has_lower_case and @has_digit and @has_symbol
      error_msg  = 'Invalid Password.'
      error_msg += ' Invalid Size, must have between 10 and 30 characters.' unless @has_valid_size
      error_msg += ' Must Have at least one Upper Case Letter.' unless @has_upper_case
      error_msg += ' Must Have at least one Lower Case Letter.' unless @has_lower_case
      error_msg += ' Must Have at least one Number.' unless @has_digit
      error_msg += ' Must Have at least one Symbol.' unless @has_symbol
      raise error_msg
    end
  end

  def has_valid_size?(conteudo)
    if conteudo.length > 9 and conteudo.length < 31
      return true
    end

    return false
  end

  def is_upper_case?(c)
    if /[[:upper:]]/.match(c)
      return true
    end

    return false
  end

  def is_lower_case?(c)
    if /[[:lower:]]/.match(c)
      return true
    end

    return false
  end

  def has_digit?(c)
    if /\d/.match(c)
      return true
    end

    return false
  end

  def has_symbol?(c)
    if /\W/.match(c)
      return true
    end

    return false
  end

  def has_repetition(conteudo)

  end
end

password = Password.new('danil*QW12')

puts password.get_power

puts password.conteudo

password.conteudo = 'muril*QW15'
puts password.conteudo

# error
password.conteudo = 'danilo'
