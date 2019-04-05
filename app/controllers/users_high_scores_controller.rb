class UsersHighScoresController < ApplicationController
  def new
    @score_form = UsersHighScoreForm.new
  end

  def create
    @score_form = UsersHighScoreForm.new(form_params)
    if(@score_form.save!)
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def form_params
    params.require(:users_high_score_form).permit(:first_name, :last_name, :score, :game)
  end
end