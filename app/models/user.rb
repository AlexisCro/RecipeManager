class User < ApplicationRecord

    has_secure_password
    has_secure_token :confirmation_token
    has_secure_token :recover_password_token

    validates :firstname, presence: true
    validates :lastname, presence: true

    validates :username, 
        format: { with: /[a-zA-Z0-9]/, message: 'invalid username' },
        uniqueness: { case_sensitive: false }

    validates :mail, 
        format: { with: /\A[a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+.[a-zA-Z.]/, message: 'invalid mail'},
        uniqueness: { case_sensitive: false },
        on: %i[create]

    has_one :cookbook

    UPDATE_PARAMS = %i[mail lastname firstname password password_confirmation]

    def to_session
        {id: id}
    end

    def full_name
        return "#{firstname} #{lastname}"
    end
end
