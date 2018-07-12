defmodule Y.Repo.Migrations.CreateGrains do
  use Ecto.Migration

  def change do
    create table(:grains) do
      add(:market_name, :string)
      add(:mark_number, :string)
      add(:year, :string)
      add(:variety, :string)
      add(:grade, :string)
      add(:trade_amount, :string)
      add(:starting_price, :string)
      add(:latest_price, :string)
      add(:address, :string)
      add(:status, :string)

      timestamps()
    end
  end
end
