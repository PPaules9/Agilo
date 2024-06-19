import SwiftUI

struct RichTextEditor: UIViewControllerRepresentable {
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: RichTextEditor
        
        init(parent: RichTextEditor) {
            self.parent = parent
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.text = textView.text
        }
    }
    
    @Binding var text: String
    @FocusState.Binding var isFocused: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.text = text
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        viewController.view.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor),
            textView.topAnchor.constraint(equalTo: viewController.view.topAnchor),
            textView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor)
        ])
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let textView = uiViewController.view.subviews.first as? UITextView {
            if textView.text != text {
                textView.text = text
            }
            if isFocused {
                textView.becomeFirstResponder()
            } else {
                textView.resignFirstResponder()
            }
        }
    }
}
