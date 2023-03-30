from web3 import Web3, EthereumTesterProvider, HTTPProvider

api_key = "hVbG92ySsi1erjiuUj-__BvVa4TfCIxp"
url = "https://eth-goerli.alchemyapi.io/v2/hVbG92ySsi1erjiuUj-__BvVa4TfCIxp"
web3 = Web3(Web3.HTTPProvider(url))

#w3 = Web3(EthereumTesterProvider())
#print(w3.isConnected())

