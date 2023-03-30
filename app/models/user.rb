class User < ApplicationRecord

    has_secure_password
    has_secure_token :confirmation_token
    validates :username, 
        format: { with: /[a-zA-Z0-9]/, message: 'invalid username' },
        uniqueness: { case_sensitive: false }

    validates :mail, 
        format: { with: /\A[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+.[a-zA-Z.]/, message: 'invalid mail'}, 
        uniqueness: { case_sensitive: false }

end
