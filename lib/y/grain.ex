defmodule Y.Grain do
  use Ecto.Schema
  import Ecto.Changeset

  schema "grains" do
    field(:address, :string)
    field(:grade, :string)
    field(:latest_price, :string)
    field(:mark_number, :string)
    field(:market_name, :string)
    field(:starting_price, :string)
    field(:status, :string)
    field(:trade_amount, :string)
    field(:variety, :string)
    field(:year, :string)
    field(:trantype, :string)

    timestamps()
  end

  @doc false
  def changeset(grain, attrs) do
    grain
    |> cast(attrs, [
      :market_name,
      :mark_number,
      :year,
      :variety,
      :grade,
      :trade_amount,
      :trantype,
      :starting_price,
      :latest_price,
      :address,
      :status,
      :trantype
    ])
    |> validate_required([
      :market_name,
      :mark_number,
      :year,
      :variety,
      :grade,
      :trade_amount,
      :starting_price,
      :latest_price,
      :address,
      :status,
      :trantype
    ])
  end
end
