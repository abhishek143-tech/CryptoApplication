//
//  TopMoversItemView.swift
//  CryptoCurrencyApp
//
//  Created by Abhishek Dilip Dhok on 29/09/23.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin: Coin
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(.orange)
                .padding(.bottom, 8)

            HStack(spacing: 2) {
                Text(coin.symbol)
                    .font(.caption)
                    .fontWeight(.bold)

                Text(coin.currentPrice.toCurrency())
                    .font(.caption)
                    .foregroundStyle(Color(.gray))

            }

            Text(coin.priceChangePercentage24H.toPercent())
                .font(.title2)
                .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140)
        .background(Color("BackgroundColor"))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 2)
        )
    }
}

