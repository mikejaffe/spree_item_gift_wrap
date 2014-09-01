class CreateSpreeGiftWraps < ActiveRecord::Migration
  def change
    create_table :spree_gift_wraps do |t|
    	t.integer :line_item_id
    	t.text :gift_text
    	t.decimal :price,  :precision => 12,:scale => 2
      t.timestamps
    end
  end
end
