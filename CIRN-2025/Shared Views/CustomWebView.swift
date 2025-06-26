//
import WebKit
import SwiftUI

// Custom WebView for loading websites based on a url
// TODO: Add `iOS26` new SwiftUI WebView
struct CustomWebView: UIViewRepresentable {
	
	// Website url passed to load in the webview
	let url: URL
    
	func makeUIView(context: Context) -> WKWebView {
		return WKWebView()
	}
	
	func updateUIView(_ webView: WKWebView, context: Context) {
		// Create `urlRequest` using the `url`
		let request = URLRequest(url: url)
		
		// Show the website in the webview
		webView.load(request)
	}
}

#Preview {
	
	CustomWebView(url: URL(string: "https://mfgren.my.site.com/cirnapp/")!)
}
