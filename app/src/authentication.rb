class Authentication
  def initialize email, password
    @email, @password = email, password
  end

  def token
    if user && password_matches?
      @token = user.id
    else
      nil
    end
  end

  private

  def password_matches?
    PasswordEncryptor.new(@password) == user.encrypted_password
  end

  def user
    @_user ||= User.where(email: @email).first
  end
end
