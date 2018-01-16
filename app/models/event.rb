class Event < ApplicationRecord

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :tickets

  def should_generate_new_friendly_id?
    title_changed?
  end

end
