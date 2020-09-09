json.scores do 
    json.array! @highscores, partial: 'highscores/highscore', as: :highscore
end