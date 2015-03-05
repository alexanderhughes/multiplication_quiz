class Quiz < ActiveRecord::Base
  has_many :questions
  
  validates :factor1, presence: true, length: { maximum: 100 }
  validates :factor2, presence: true, length: { maximum: 100 }
  validates :question_total, presence: true, length: { maximum: 100 }
  
  after_create(:generate_questions)
  
  def generate_questions
    questions.push(Question.create_from_quiz(self))
  end
end
