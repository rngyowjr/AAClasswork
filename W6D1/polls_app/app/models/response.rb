# == Schema Information
#
# Table name: responses
#
#  id              :bigint           not null, primary key
#  user_id         :integer
#  answerchoice_id :integer
#

class Response < ApplicationRecord
  belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User 

  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answerchoice_id,
  class_name: :AnswerChoice 

  has_one :question,
  through: :answer_choice,
  source: :question

  def sibling_responses
    #original_id = Response.id
      Response.question.responses#.where.not('id = original_id)

  end
end
