class QuizzesController < ApplicationController
  def new
    @quiz = Quiz.new
  end
  
  def create
    @quiz = Quiz.create(quiz_params)
    if @quiz.errors.empty?
      redirect_to quiz_path(@quiz)
    else
      render :new
    end
  end

  def show
    @quiz = Quiz.find(params[:id])
    @question = @quiz.next_question
    if @question == nil
      redirect_to(results_quiz_path(@quiz))
    end
  end
  
  def results
    @quiz = Quiz.find(params[:id])
  end
  
  private
  def quiz_params
    params[:quiz].permit(:factor1, :factor2, :question_total)
  end
end