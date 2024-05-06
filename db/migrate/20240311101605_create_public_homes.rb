class CreatePublicHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :public_homes do |t|

      t.timestamps
    end
  end
end
