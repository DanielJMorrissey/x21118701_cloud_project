class Band < ApplicationRecord
  # making sure name and genre are filled
  validates_presence_of :name
  validates_presence_of :genre
end
