Rails.application.routes.draw do

  get 'highscores/top_all' => 'highscores#top_all'
  get 'highscores/top_week' => 'highscores#top_week'
  get 'highscores/top_day' => 'highscores#top_day'

  post 'highscores/level_to_beat' => 'highscores#level_to_beat'

  post 'highscores' => 'highscores#send_score'
end
