//
//  AllCoinsView.swift
//  CryptoCurrencyApp
//
//  Created by Abhishek Dilip Dhok on 29/09/23.
//

import SwiftUI
import Kingfisher

struct CoinRowView: View {
    let coin: Coin
    var body: some View {
        HStack {
            // Market Cap Rank
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundStyle(.gray)

            // Image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)

            // Coin Name Info
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)

                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)

            }
            .padding(.leading, 2)

            Spacer()
            // Coin Price Info

            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)

                Text(coin.priceChangePercentage24H.toPercent())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)

            } 
            .padding(.trailing, 2)
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

