class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.references :inquiry_kind, index: true, foreign_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.text :detail, null: false

      t.timestamps null: false
    end
  end
end
