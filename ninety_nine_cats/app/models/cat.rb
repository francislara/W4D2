class Cat < ApplicationRecord
  CAT_COLORS = ["black", "brown", "orange", "white", "gray"].freeze

  validates :birth_date, :name, :color, :sex, :description, presence: true
  validates :color, inclusion: CAT_COLORS
  validates :sex, inclusion: ["M", "F"]



  def age
    diff = Date.today - birth_date
    diff.to_i / 365
  end


end
