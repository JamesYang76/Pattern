class UsersHighScoreForm < ApplicationForm
  attr_accessor :first_name, :last_name
  attr_accessor :score, :game

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :score, presence: true

  private

  def persist!
    user = User.create!(first_name: first_name,last_name: last_name)
    user.create_high_score!(score: score, game: game)
  end
end