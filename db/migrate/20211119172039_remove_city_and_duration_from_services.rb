class RemoveCityAndDurationFromServices < ActiveRecord::Migration[6.1]
  def change
    remove_column :services, :duration, :integer
    remove_column :services, :city, :string
  end
end
