class Order < ApplicationRecord
  has_many :order_details
  has_many :items, through: :order_details
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }

  def address_display
  '〒' + post_code + ' ' + address + ' ' + name
  end

  enum status: { waiting_for_payment: 0, payment_confirmation: 1, production: 2, preparation_for_shipping: 3, sent: 4 }


end
