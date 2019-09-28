require 'action_view'
require 'action_view/helpers'

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLOR = ["Pink", "Black", "Ginger"]
  validates :birth_date, :name, :description, presence: true
  validates :color, inclusion: COLOR, presence: true 
  validates :sex, inclusion: ["M", "F"]

  def age
    time_ago_in_words(birth_date)
  end


end
