//
import SwiftUI

struct RatingView: View {
	
	@Binding var rating: Int?

	var label = ""

	var maximumRating = 5

	var offImage: Image?
	var onImage = Image(systemName: "star.fill")

	var offColor = Color.gray
	var onColor = Color.yellow
	
	var body: some View {
		HStack {
			if label.isEmpty == false {
				Text(label)
			}

			ForEach(1..<maximumRating + 1, id: \.self) { number in
				Button {
					rating = number
				} label: {
					image(for: number)
						.foregroundStyle(number > rating ?? 0 ? offColor : onColor)
						
				}
			}
		}
	}
	
	func image(for number: Int) -> Image {
		if number > rating ?? 0 {
			offImage ?? onImage
		} else {
			onImage
			
		}
	}
}

#Preview {
	@Previewable @State var rating: Int? = 1
	RatingView(rating: .constant(nil))
}
