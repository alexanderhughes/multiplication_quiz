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
  
  def counter
    counter = 0
    for e in questions
      if e.answer != nil
        counter += 1
      else
        counter = counter
      end
    end
    return counter + 1
  end
  
  def score
    score = 0
    for e in questions
      if e.num1 * e.num2 == e.answer
        e.correct == 1
        score += 1
      else
        e.correct == 0
      end        
    end
    return score
  end
  
  def wrong_answers
    incorrect = []
    if score / question_total != 1
      for e in questions
        if e.num1 * e.num2 != e.answer
          incorrect.push(["#{e.num1} x #{e.num2}", e.answer.to_s, e.num1 * e.num2])
          #incorrect.push([e.num1.to_s + " x " + e.num2.to_s + " = " + e.answer.to_s, e.num1*e.num2])
        end
      end
    end
    return incorrect
  end
    
  def congrats
    if score / question_total == 1
      return "Perfect score! Great work!"
    else
      return "Keep practicing!"
    end
  end
end
