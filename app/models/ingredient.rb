class Ingredient < ApplicationRecord
  has_many :doses, inverse_of: :ingredient
  has_many :cocktails, through: :doses
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
