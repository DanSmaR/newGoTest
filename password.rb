class Password
  def initialize(conteudo)
    @conteudo = conteudo
    unless has_valid_size? and is_upper_case? and is_lower_case? and has_digit? and has_symbol?
      raise 'Invalid Password'
    end
    puts 'Valid Password'
    @power = self.get_power
  end

  def get_power
    @power = 1.25 * @conteudo.length + 62.5
  end

  private

  def has_valid_size?
    if @conteudo.length > 9 and @conteudo.length < 31
      return true
    end

    return false
  end

  def is_upper_case?
    @conteudo.split('').each do |c|
      if /[[:upper:]]/.match(c)
        return true
      end
    end

    return false
  end

  def is_lower_case?
    @conteudo.split('').each do |c|
      if /[[:lower:]]/.match(c)
        return true
      end
    end

    return false
  end

  def has_digit?
    @conteudo.split('').each do |c|
      if /\d/.match(c)
        return true
      end
    end

    return false
  end

  def has_symbol?
    @conteudo.split('').each do |c|
      if /\W/.match(c)
        return true
      end
    end

    return false
  end
end


password = Password.new('danil*QW12')

puts password.get_power
