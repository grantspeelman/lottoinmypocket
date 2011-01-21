class CreateLottoDrawDivisions < ActiveRecord::Migration
  def self.up
    create_table 'lotto_draw_divisions' do |t|
      t.belongs_to :lotto_draw
      t.integer 'number', :null => false
      t.integer 'payout', :null => false
      t.integer 'winners', :default => 0, :null => false
    end
  end

  def self.down
    drop_table :lotto_draw_divisions
  end
end
