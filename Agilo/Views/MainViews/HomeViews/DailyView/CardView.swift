import SwiftUI


struct CardView: View {
    var imageName: String
    var title: String
    var subtitle: String
    var duration = Date.now
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                HStack {
                    Image(systemName: "calendar.badge.clock")
                    Text(formattedDate(duration))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .frame(height: 80)

            Spacer()
            if let image = UIImage(named: imageName) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .gray, radius: 5, x: 0, y: 2)
        
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yyyy"
        return formatter.string(from: date)
    }
}


