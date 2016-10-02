class Person < ActiveRecord::Base
  validate :name, presence: true
  validate :house_id, presence: true
  belongs_to :house,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: 'House'
end
