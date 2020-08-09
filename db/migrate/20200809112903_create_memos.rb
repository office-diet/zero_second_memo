class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.string      :theme, null: false
      t.text        :text,  null: false
      t.references  :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
