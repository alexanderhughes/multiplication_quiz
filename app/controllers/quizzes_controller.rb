class QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
  end
  
  def create
    @quiz = Quiz.create(quiz_params)
    redirect_to quiz_path(@quiz)
  end

  def show
    @quiz = Quiz.find(params[:id])
  end
  
  private
  def quiz_params
    params[:quiz].permit(:factor1, :factor2, :question_total)
  end
end
