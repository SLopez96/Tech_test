class User < ApplicationRecord
    has_secure_password


    def create(username, password)
        @user = User.new
        @user.username = username
        @user.password = password
        @user.save
    end
end
