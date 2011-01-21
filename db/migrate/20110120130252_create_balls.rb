class CreateBalls < ActiveRecord::Migration

  def self.up
    create_table :balls do |t|
      t.integer 'ball', :null => false
      t.integer 'lotto_draw_count', :default => 0, :null => false
    end
  end

  def self.down
    drop_table :balls
  end
end
