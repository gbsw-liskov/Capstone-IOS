//
//  GoMapView.swift
//  Eodigo
//
//  Created by 김은찬 on 9/8/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("지도")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top)
                Text("지도 페이지입니다")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 4)
                Spacer()
            }
            .padding(.bottom, 80)
            .navigationTitle("지도")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MapView()
}
