defmodule Mix.Tasks.Yy do
  @moduledoc false
  use Mix.Task
  alias Mix.Tasks.Yy
  alias Y.Grain
  alias Y.Repo
  import Ecto.Query, only: [from: 2]

  def run(_) do
    {:ok, _} = Application.ensure_all_started(:y)
    {:ok, pid} = Agent.start_link(fn -> %{} end)
    u1(b(), pid)
  end

  def a(dqqq) do
    uu = "http://123.127.88.167:8888/tradeClient/observe/requestList?specialNo="
    u = uu <> dqqq

    dd = HTTPotion.get(u).body |> Jason.decode!()
  end

  def s(d) do
    attr = %{
      market_name: "guojia",
      mark_number: d["requestAlias"],
      year: "15",
      variety: d["varietyName"],
      grade: d["gradeName"],
      trade_amount: d["num"],
      starting_price: d["basePrice"],
      latest_price: d["currentPrice"],
      address: d["requestBuyDepotName"],
      status: d["statusName"],
      trantype: "拍卖"
    }

    changeset = Grain.changeset(%Grain{}, attr)
    Repo.insert(changeset)
  end

  def b do
    uuu = "http://123.127.88.167:8888/tradeClient/observe/specialList"
    dqq = HTTPotion.get(uuu).body |> Jason.decode!()
  end

  def j(j) do
    if String.to_integer(j["remainSeconds"]) <= 2 do
      s(j)
    end
  end

  def d(dd, y, pid) do
    if dd["status"] == "no" || dd["status"] == "end" do
      "over"
    else
      grain(y, pid)
    end
  end

  def grain(y, pid) do
    dd = a(y)

    if dd["status"] == "yes" do
      Enum.each(dd["rows"], fn jj ->
        j(jj)
      end)

      grain(y, pid)
    else
      d(dd, y, pid)
    end
  end

  def u1(b, pid) when b != [] do
    qww = Agent.get(pid, & &1)

    Enum.each(b, fn x ->
      y = x["specialNo"]

      if Map.has_key?(qww, y) do
        unless Process.alive?(qww[y]) do
          Agent.update(pid, fn j -> Map.delete(j, y) end)
        end
      else
        i = spawn(Yy, :grain, [y, pid])

        Agent.update(pid, fn j -> Map.put(j, y, i) end)
      end
    end)

    u1(b, pid)
  end

  def u1(b, pid) when b == [] do
    IO.puts("结束")
  end
end
