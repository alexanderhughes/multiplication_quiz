class QuestionsController < ApplicationController
  def update
    @question = Question.find(params[:id])
    @question.update_attribute(:answer, params[:answer])
    if @question.answer == (@question.num1 * @question.num2)
      @question.update_attribute(:correct, 1)
    else
      @question.update_attribute(:correct, 0)
    end
    redirect_to(quiz_path(@question.quiz))
  end
end