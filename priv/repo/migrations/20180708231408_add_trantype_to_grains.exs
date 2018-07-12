defmodule Y.Repo.Migrations.AddTrantypeToGrains do
  use Ecto.Migration

  def change do
    alter table(:grains) do
      add(:trantype, :string)
    end

    create(index("grains", [:mark_number], unique: true))
  end
end
