class Team < ActiveRecord::Base
    has_many :players
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true


end