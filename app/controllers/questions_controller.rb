class QuestionsController < ApplicationController
  def update
    @question = Question.find(params[:id])
    @question.update_attribute(:answer, params[:answer])
    redirect_to(quiz_path(@question.quiz))
  end
end