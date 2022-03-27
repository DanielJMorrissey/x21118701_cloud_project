class Band < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :genre
end
