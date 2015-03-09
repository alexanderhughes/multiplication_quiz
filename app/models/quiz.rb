class Quiz < ActiveRecord::Base
  has_many :questions
  
  validates :factor1, presence: true, length: { maximum: 100 }
  validates :factor2, presence: true, length: { maximum: 100 }
  validates :question_total, presence: true, length: { maximum: 100 }
  
  after_create(:generate_questions)
  
  def generate_questions
    question_total.times do
      questions.push(Question.create_from_quiz(self))
    end
  end
  
  def next_question
    questions.where(answer: nil).first
  end
  
  def score
    score = 0
    for e in questions
      if e.num1 * e.num2 == e.answer
        e.correct = 1
        score += 1
      else
        e.correct == 0
      end        
    end
    return score
  end
end
