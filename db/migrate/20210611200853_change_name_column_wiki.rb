class ChangeNameColumnWiki < ActiveRecord::Migration[6.0]
  def change
    rename_column :wikis, :type, :kind
  end
end
