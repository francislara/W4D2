class Cat < ApplicationRecord
  CAT_COLORS = ["black", "brown", "orange", "white", "gray"].freeze

  validates :birth_date, :name, :color, :sex, :description, presence: true
  validates :color, inclusion: CAT_COLORS
  validates :sex, inclusion: ["M", "F"]

  has_many :cat_rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    diff = Date.today - birth_date
    diff.to_i / 365
  end


end
