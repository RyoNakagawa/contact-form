class CreateInquiryKinds < ActiveRecord::Migration
  def change
    create_table :inquiry_kinds do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
