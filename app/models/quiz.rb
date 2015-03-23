class Quiz < ActiveRecord::Base
  has_many :questions
  
  validates :factor1, presence: true, length: { maximum: 100 }, numericality: { only_integer: true}
  validates :factor2, presence: true, length: { maximum: 100 }, numericality: { only_integer: true}
  validates :question_total, presence: true, length: { maximum: 100 }, numericality: { only_integer: true}
  
  after_create(:generate_questions)
  
  def generate_questions
    question_total.times do
      questions.push(Question.create_from_quiz(self))
    end
  end
  
  def next_question
    questions.where(answer: nil).first
  end
  
  def unanswered_questions
    questions.where.not(answer: nil).count
  end
  
  def score
    questions.where(correct: 1).count
  end
  
  def wrong_answers
    incorrect = []
    if score / question_total !=1
      questions.where(correct: 0).find_each do |wrong|
        incorrect.push(["#{wrong.num1} x #{wrong.num2}", wrong.answer.to_s, wrong.num1 * wrong.num2])
      end
    end
    return incorrect
  end
  
#  def wrong_answers
#    incorrect = []
#    if score / question_total != 1
#      for e in questions
#        if e.num1 * e.num2 != e.answer
#          incorrect.push(["#{e.num1} x #{e.num2}", e.answer.to_s, e.num1 * e.num2])
#          #incorrect.push([e.num1.to_s + " x " + e.num2.to_s + " = " + e.answer.to_s, e.num1*e.num2])
#        end
#      end
#    end
#    return incorrect
#  end
    
  def congrats
    if score / question_total == 1
      return "Perfect score! Great work!"
    else
      return "Keep practicing!"
    end
  end
end
