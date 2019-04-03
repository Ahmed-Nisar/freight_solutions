class OrderRequest < ApplicationRecord

  belongs_to :user

  validates :order_name, :quantity, :amount, :country, :city, :house_num, presence: true

  geocoded_by :address
  after_validation :geocode

  enum status: [:pending, :accept, :reject, :complete]

  scope :all_pending, -> {where('status = ?', OrderRequest.statuses[:pending])}
  scope :all_accepted, -> {where('status = ?', OrderRequest.statuses[:accept])}
  scope :all_rejected, -> {where('status = ?', OrderRequest.statuses[:reject])}
  scope :all_completed, -> {where('status = ?', OrderRequest.statuses[:complete])}

  def address
      [house_num, city, country].compact.join(', ')
  end
end
