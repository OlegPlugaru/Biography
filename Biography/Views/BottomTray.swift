//
//  BottomTray.swift
//  Biography
//
//  Created by Oleg Plugaru on 28.07.2024.
//

import SwiftUI

struct BottomTray: View {
    
    let selectedPerson: Person?
    var isScrollDisabled = true
    
    var body: some View {
        ZStack {
            if self.selectedPerson != nil {
                VStack(spacing: 0) {
                    Rectangle().fill(Color.gray.opacity(0.4))
                        .frame(width: 40, height: 4)
                        .cornerRadius(4)
                    
                    Text(self.selectedPerson?.name ?? "")
                        .font(.system(size: 30, weight: .semibold))
                        .padding(.vertical)
                    
                    Divider()
                    
                    ScrollView(showsIndicators: false) {
                        Text(self.selectedPerson?.description ?? "")
                            .padding()
                        
                        if self.selectedPerson?.sections != nil {
                            Divider()
                            
                            ForEach(self.selectedPerson!.sections!) { section in
                                SectionCarousel(section: section)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .disabled(self.isScrollDisabled)
                }
            }
        }
        .multilineTextAlignment(.leading)
        .background(.white)
        .foregroundColor(.black)
    }
}

#Preview {
    BottomTray(selectedPerson: Person.stubbed[0], isScrollDisabled: false )
}
