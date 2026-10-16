import UIKit
struct FavoriteBook {
    let title: String
    let description: String
    let imageName: String
}

class ViewController: UIViewController {
    @IBOutlet weak var bookImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let books: [FavoriteBook] = [
        FavoriteBook(title: "Маленький принц",
                     description: "История о дружбе, любви и важных вещах в жизни.",
                     imageName: "book1"),
        
        FavoriteBook(title: "Один из нас лжёт",
                     description: "Детектив о пяти школьниках и опасных секретах.",
                     imageName: "book2"),
        
        FavoriteBook(title: "Цветы для Элджернона",
                     description: "История об интеллекте, чувствах и человечности.",
                     imageName: "book3"),
        
        FavoriteBook(title: "Таймлесс",
                     description: "Приключения и тайны путешествий во времени.",
                     imageName: "book4"),
        
        FavoriteBook(title: "451 градус по Фаренгейту",
                     description: "Антиутопия об обществе, где запрещены книги.",
                     imageName: "book5"),
        
        FavoriteBook(title: "Гордость и предубеждение",
                     description: "Классическая история о любви и предрассудках.",
                     imageName: "book6"),
        
        FavoriteBook(title: "Маленькие женщины",
                     description: "История взросления четырёх сестёр.",
                     imageName: "book7"),
        
        FavoriteBook(title: "Портрет Дориана Грея",
                     description: "Роман о красоте, молодости и морали.",
                     imageName: "book8"),
        
        FavoriteBook(title: "Джейн Эйр",
                     description: "История независимой девушки и её жизненного пути.",
                     imageName: "book9"),
        
        FavoriteBook(title: "Книжный вор",
                     description: "История девочки и силы книг во время войны.",
                     imageName: "book10")
    ]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bookImageView.contentMode = .scaleAspectFit
        descriptionLabel.numberOfLines = 0
        titleLabel.numberOfLines = 0
        
        showBook(at: currentIndex)
    }
    
    func showBook(at index: Int) {
        let book = books[index]
        
        titleLabel.text = book.title
        descriptionLabel.text = book.description
        bookImageView.image = UIImage(named: book.imageName)
    }
    
    @IBAction func randomBookButtonTapped(_ sender: UIButton) {
        guard books.count > 1 else { return }
        
        var newIndex: Int
        
        repeat {
            newIndex = Int.random(in: 0..<books.count)
        } while newIndex == currentIndex
        
        currentIndex = newIndex
        showBook(at: currentIndex)
    }
}
