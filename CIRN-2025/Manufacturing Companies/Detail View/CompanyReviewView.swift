//

import SwiftUI

struct CompanyReviewView: View {
	
	let review: CompanyReview
	
    var body: some View {
		GroupBox {
			VStack(alignment: .leading) {
				HStack(alignment: .top) {
					AsyncImage(url: review.authorAttribution?.photoUri) { image in
						image.resizable()
							.frame(width: 40, height: 40)
							
					} placeholder: {
						Image(systemName: "person")
							.resizable()
							.frame(width: 40, height: 40)
					}
					
					Text(review.text?.text ?? "")
				}
				.frame(maxWidth: .infinity, alignment: .leading)

			}
			
		}
		
    }
}

//#Preview {
//    CompanyReviewView()
//}
