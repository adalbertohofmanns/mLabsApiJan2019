class Dependent < ApplicationRecord
  belongs_to :user
  validates :name, :parentesco, :user, presence: true
end
