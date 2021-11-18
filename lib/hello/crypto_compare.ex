defmodule BitcoinService.CryptoCompare do 
    import HTTPoison
    @url "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,AUD"

    def price() do 
        case HTTPoison.get(@url) do 
            {:ok, %{status_code: 200, body: body}} -> Poison.decode!(body)
            {:ok, %{status_code: 404}} -> # 404 Not Found Error
        end
    end
end