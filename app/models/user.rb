class User < ApplicationRecord
    include Gravtastic
    gravtastic
    
    mount_uploader :avator, AvatorUploader

    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                     format: { with: VALID_EMAIL_REGEX },
                     uniqueness: { case_sensitive: false }
    validate :avator_size
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    private
        def avator_size
            if avator.size > 5.megabytes
                errors.add(:avator, "should be less than 5MB")
            end
        end
end
