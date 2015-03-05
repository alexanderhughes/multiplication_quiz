class Question < ActiveRecord::Base
  belongs_to :quiz
  
  def self.create_from_quiz(quiz)
    Question.create(num1: rand(quiz.factor1..quiz.factor2), num2: rand(quiz.factor1..quiz.factor2))
  end
end