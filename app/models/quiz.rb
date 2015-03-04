class Quiz < ActiveRecord::Base
  validates :factor1, presence: true, length: { maximum: 100 }
  validates :factor2, presence: true, length: { maximum: 100 }
  validates :question_total, presence: true, length: { maximum: 100 }
end
