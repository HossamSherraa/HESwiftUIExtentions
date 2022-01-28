//
//  File.swift
//  JamalSale
//
//  Created by Hossam on 09/10/2021.
//

import SwiftUI
import AVFoundation
protocol ImagePickerDelegate : AnyObject {
    func didSelectImage(image : UIImage)
    func didSelectVideo(at url : URL)
}
struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) var presentationMode
    weak var delegate : ImagePickerDelegate?
    

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        
        picker.mediaTypes = ["public.image", "public.movie"]
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let parent: ImagePicker

    init(_ parent: ImagePicker) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let uiImage = info[.originalImage] as? UIImage {
            
            parent.delegate?.didSelectImage(image: uiImage)
        }
        if let videoURL = info[.mediaURL] as? URL {
            parent.delegate?.didSelectVideo(at: videoURL)
        }

        parent.presentationMode.wrappedValue.dismiss()
    }
}
