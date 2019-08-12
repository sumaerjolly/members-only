class User < ApplicationRecord
    has_many :posts
    before_create :assign_remember_token
    validates :password, presence: true, length: {minimum: 6}
    validates :password_confirmation, presence: true
    validates :email, presence: true , format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
    has_secure_password


    private
    def assign_remember_token
        token = SecureRandom.urlsafe_base64
        self.remember_token = Digest::SHA1.hexdigest(token.to_s)
    end 
end
