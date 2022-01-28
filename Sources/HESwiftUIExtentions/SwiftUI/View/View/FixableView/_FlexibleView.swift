//
//  File.swift
//  JamalSale
//
//  Created by Hossam on 06/09/2021.
//

import Foundation
import SwiftUI

/// This view is responsible to lay down the given elements and wrap them into
/// multiple rows if needed.

struct _FlexibleView<Data: Collection>: View where Data.Element: Identifiable  , Data.Element : View{
  let availableWidth: CGFloat
  let data: Data
  let spacing: CGFloat
  let alignment: HorizontalAlignment
 @State var elementsSize: [Data.Element.ID: CGSize] = [:]

  var body : some View {
    let computedRows = computeRows()
    return VStack(alignment: alignment , spacing : spacing) {
        ForEach(0..<computedRows.count ) { index in
        HStack(spacing: spacing) {
            if  computedRows.count-1 >= index{
            ForEach(computedRows[index]) { element in
               element
              .readSize { size in
                elementsSize[element.id] = size
              }
          }
            }
            
        }
      }
    }
    
  }

  func computeRows() -> [[Data.Element]] {
    var rows: [[Data.Element]] = [[]]
    var currentRow = 0
    var remainingWidth = availableWidth

    for element in data {
        let elementSize = elementsSize[element.id, default: CGSize(width: availableWidth, height: 1)]

      if remainingWidth - (elementSize.width + spacing) >= 0 {
        rows[currentRow].append(element)
      } else {
        currentRow = currentRow + 1
        rows.append([element])
        remainingWidth = availableWidth
      }

      remainingWidth = remainingWidth - (elementSize.width + spacing)
    }

    return rows
  }
}
