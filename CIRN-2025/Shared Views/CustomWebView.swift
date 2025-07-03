//
import WebKit
import SwiftUI

// Custom WebView for loading websites based on a url
// TODO: Add `iOS26` new SwiftUI WebView
struct CustomWebView: UIViewRepresentable {
	
	// Website url passed to load in the webview
	let websiteType: WebsiteTypes
    
	func makeUIView(context: Context) -> WKWebView {
		return WKWebView()
	}
	
	func updateUIView(_ webView: WKWebView, context: Context) {
		// Create `urlRequest` using the `url`
		let request = URLRequest(url: websiteType.website)
		
		// Show the website in the webview
		webView.load(request)
	}
}

#Preview {
	
	CustomWebView(websiteType: .aboutUs)
}
