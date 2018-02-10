defmodule Deals.Accounts.Encryption do
  alias Comeonin.Argon2
  
  # We use this library for hashing and checking passwords https://github.com/riverrun/comeonin
  # https://en.wikipedia.org/wiki/Argon2
  
  def hash_password(password), do: Argon2.hashpwsalt(password)
  def validate_password(password, hash), do: Argon2.checkpw(password, hash)

end