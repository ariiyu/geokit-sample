require 'geokit-rails'

namespace :spot do
  desc "Get near spots sorted by distance and some rating"
  task :get_near_spots => :environment do
    origin_spot = Spot.where(name: '渋谷駅').first
    # origin_spot自身を含まない、rating 4以上の、20件までのスポットを、origin_spotから近い順に取得する
    near_spots = Spot.where.not(name: origin_spot.name).where('rating >= ?', 4).by_distance(:origin => origin_spot).limit(20)
    pp near_spots
  end
end