class HighScorePresenter < BasePresenter
  #presents :high_score

  def printed_game_title
    game.upcase
  end

  def scored_date
    #high_score.created_at.strftime("%d %b %Y")
    created_at.strftime("%d %b %Y")
  end

  def scored_badge
    h.content_tag :span, "Best", class: "badge badge-success"
  end
end