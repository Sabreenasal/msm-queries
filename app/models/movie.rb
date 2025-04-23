# == Schema Information
#
# Table name: movies
#
#  id          :bigint           not null, primary key
#  duration    :integer
#  image_url   :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
end
