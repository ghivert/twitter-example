class User < ApplicationRecord
  # L’utilisateur doit pouvoir garder un mot de passe sécurisé.
  has_secure_password

  # L’email ne doit pas être nul, et doit être unique dans toute la base.
  validates :email, presence: true, uniqueness: true
end

# "azerty"
# "password" => "anrsitdl86438rnauiten"
# bcrypt("password") # => "anrsitdl86438rnauiten"
