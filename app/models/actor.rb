# == Schema Information
#
# Table name: actors
#
#  id         :bigint           not null, primary key
#  dob        :date
#  image_url  :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
end
