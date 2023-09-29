//
//  HomeViewModel.swift
//  CryptoCurrencyApp
//
//  Created by Abhishek Dilip Dhok on 29/09/23.
//

import Foundation

class HomeViewModel: ObservableObject, Identifiable {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()

    init() {
        fetchCoinData()
    }

    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en&precision=2"

        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            
            guard let data = data else {
                return
            }

            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                }
            } catch {
                print("Failed to debug")
            }
        }.resume()
    }

    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        DispatchQueue.main.async {
            self.topMovingCoins = Array(topMovers.prefix(5))
        }
    }
}

