class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }

    before_save :downcase_email

    private

    def downcase_email
    self.email = email.downcase
    end

  end
