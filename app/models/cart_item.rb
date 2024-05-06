class CartItem < ApplicationRecord
# devise :database_authenticatable, :registerable,
#   :recoverable, :rememberable, :validatable

  belongs_to :item
  belongs_to :customer

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

    # 小計を求めるメソッド
    def subtotal
        item.with_tax_price * amount
    end

    def with_tax_price
      (price * 1.1).floor
    end



end
