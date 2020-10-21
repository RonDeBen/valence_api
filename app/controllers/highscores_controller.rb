class HighscoresController < ApplicationController
    skip_before_action :verify_authenticity_token

    def top_day
        @highscores = Highscore.top_day
        render 'highscores/index'
    end

    def top_week
        @highscores = Highscore.top_week
        render 'highscores/index'
    end

    def top_all
        @highscores = Highscore.top_all
        render 'highscores/index'
    end

    def send_score
        @highscore = Highscore.new(name: params[:name], level: params[:level], seconds: params[:seconds], uniq_id: params[:uniq_id])
        @highscore.save!
        Highscore.remove_outer_scores
        render 'highscores/my_score'
    end

    def level_to_beat
        @level = Highscore.level_to_beat(params[:uniq_id])
        render 'highscores/level_to_beat'
    end
end
