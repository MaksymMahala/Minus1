//
//  PriceView.swift
//  Minus1
//
//  Created by Max on 01.10.2024.
//

import SwiftUI

struct RecentCoinsView: View {
    @ObservedObject var webSocketManager: WebSocketManager
    @ObservedObject var viewModel: CryptoCompactInfoViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.recentCryptocurrencies, id: \.id) { cryptocurrency in
                    CoinCell(webSocketManager: webSocketManager, viewModel: viewModel, symbol: cryptocurrency.symbol, cryptocurrency: cryptocurrency)
                }
            }
        }
        .onAppear {
            viewModel.fetchRecentCryptocurrencies()
        }
    }
}

struct RecentCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RecentCoinsView(webSocketManager: WebSocketManager(), viewModel: CryptoCompactInfoViewModel())
                .previewDevice("iPhone 16 Pro")
                .previewDisplayName("iPhone 16 Pro")
            
            RecentCoinsView(webSocketManager: WebSocketManager(), viewModel: CryptoCompactInfoViewModel())
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
        }
    }
}
