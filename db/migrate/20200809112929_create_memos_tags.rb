class CreateMemosTags < ActiveRecord::Migration[6.0]
  def change
    create_table :memos_tags do |t|
      t.references  :memo,  null: false, foreign_key: true
      t.references  :tag,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
