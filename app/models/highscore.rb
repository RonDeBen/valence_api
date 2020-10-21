class Highscore < ApplicationRecord
    

    def self.top_all
        Highscore.all.sort_by { |h| -h[:level] }.uniq { |h| h[:uniq_id] }.first(100)
    end

    def self.top_week
        Highscore.where(created_at: Time.now.last_week.sunday..Time.now.sunday).sort_by { |h| -h[:level] }.uniq { |h| h[:uniq_id] }.first(100)
    end

    def self.top_day
        Highscore.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).sort_by { |h| -h[:level] }.uniq { |h| h[:uniq_id] }.first(100)
    end

    def self.level_to_beat(id)
        highscores = Highscore.top_day
        lowest_highscore = (highscores.length > 99) ? highscores.last : 0
        my_top_score = Highscore.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day, uniq_id: id).first
        if(my_top_score.nil?)
            lowest_highscore
        else
            (my_top_score.level > lowest_highscore.level) ? my_top_score.level : lowest_highscore.level
        end
    end

    def self.remove_outer_scores
        inner_scores = Highscore.top_all + Highscore.top_week + Highscore.top_day
        (Highscore.all - inner_scores).each do |score|
            score.destroy
        end
    end
end
