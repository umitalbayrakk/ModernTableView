
import UIKit

protocol ProducktTableViewCellInterface:AnyObject {
    func clickedFavButton(for cell: ProducktTableViewCell)
    func clickedBuyButton(for cell: ProducktTableViewCell)
}

class ProducktTableViewCell: UITableViewCell {
    
    @IBOutlet weak var producktNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    weak var delegate: ProducktTableViewCellInterface?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func clickedFavoriteButton(_ sender: Any) {
        delegate?.clickedFavButton(for: self)
    }
    
    @IBAction func clickedBuyButton(_ sender: Any) {
        delegate?.clickedBuyButton(for: self)
    }
    
}
