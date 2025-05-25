import ccxt
def main():
    bitget = ccxt.bitget()
    bitget.load_markets()
    ticker = bitget.fetch_ticker('BTC/USDT')
    print(ticker)

if __name__ == "__main__":
    main()