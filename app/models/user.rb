class User < ApplicationRecord
  has_one_attached :avatar

  validates :phone,
            uniqueness: true,
            numericality: true,
            presence: true

  validates :name,
            presence: true

  validates :password,
            length: {in: 6..12}

  validates :api_key,
            uniqueness: true

  # Generates random 10-digit api key
  def generate_api_key
    begin
      key = rand.to_s[2..11]
    end while User.find_by_api_key(key).present?

    self.api_key = key
  end
end
