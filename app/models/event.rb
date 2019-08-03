class Event < ApplicationRecord
    belongs_to :user
    has_many :joins
    has_many :joined_users, through: :joins, source: :user

    # has_many :comments, through: :users
    validates :city, :presence => true
    validates :state, :presence => true
    validates :date, :presence => true
    validates :name, :presence => true
end
