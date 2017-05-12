class Cocktail < ApplicationRecord
  has_many :doses, inverse_of: :cocktail, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  has_attachment :photo
end
