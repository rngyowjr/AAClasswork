# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  answer      :string           not null
#  question_id :integer
#

class AnswerChoice < ApplicationRecord

  belongs_to :question,
  primary_key: :id,
  foreign_key: :question_id,
  class_name: :Question

  has_many :responses,
  primary_key: :id,
  foreign_key: :answerchoice_id,
  class_name: :Response 

end
