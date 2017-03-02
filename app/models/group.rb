class Group < ApplicationRecord
  # before_save { self.name = name.downcase }
  has_many :associations
  has_many :users, :through => :associations
  validates :name,  presence: true, length: { maximum: 50 },
                    uniqueness: { case_sensitive: false }
  attr_accessor :remember_token

    # Remembers a group in the database for use in persistent sessions.
    def remember
      self.remember_token = Group.new_token
    end

end
