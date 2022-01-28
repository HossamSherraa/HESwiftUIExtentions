//
//  FlexibleView.swift
//  JamalSale
//
//  Created by Hossam on 06/09/2021.
//

import SwiftUI

/// Facade of our view, its main responsibility is to get the available width
/// and pass it down to the real implementation, `_FlexibleView`.
struct FlexibleView<Data: Collection>: View where Data.Element: Identifiable , Data.Element : View {
  let data: Data
  let spacing: CGFloat
  let alignment: HorizontalAlignment
  
  @State private var availableWidth: CGFloat = 0

  var body: some View {
    ZStack(alignment: Alignment(horizontal: alignment, vertical: .center)) {
      Color.clear
        .frame(height: 1)
        .readSize { size in
          availableWidth = size.width
        }

      _FlexibleView(
        availableWidth: availableWidth,
        data: data,
        spacing: spacing,
        alignment: alignment
      )
      
    }
  }
}
