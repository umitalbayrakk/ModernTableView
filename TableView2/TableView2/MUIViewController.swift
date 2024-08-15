
import UIKit

class MUIViewController: UIViewController {
    
    @IBOutlet weak var tabelView: UITableView!
    var producktList:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
    }
    
    private func setupTableView(){
        tabelView.dataSource = self
        tabelView.delegate = self
        pripareList()
    }
    
    private func pripareList(){
        producktList.append(Product(name: "Pantolon", price: "1000 $"))
        producktList.append(Product(name: "Kazak", price: "500 $"))
        producktList.append(Product(name: "Gömlek", price: "700 $"))
        producktList.append(Product(name: "Hırka", price: "400 $"))
        producktList.append(Product(name: "Ayakkabı", price: "2000 $"))
        producktList.append(Product(name: "Kemer", price: "300 $"))
    }
    
 
}


extension MUIViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return producktList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let produckt = producktList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "producktID") as! ProducktTableViewCell
        cell.producktNameLabel.text = producktList[indexPath.row].name
        cell.priceLabel.text = producktList[indexPath.row].price
        cell.delegate = self
        return cell
    }
}

extension MUIViewController:ProducktTableViewCellInterface{
    func clickedFavButton(for cell: ProducktTableViewCell) {
        if let indexPath = tabelView.indexPath(for: cell){
            print("Favorite prod : \(producktList[indexPath.row])")
        }
    }
    
    func clickedBuyButton(for cell: ProducktTableViewCell) {
        if let indexPath = tabelView.indexPath(for: cell) {
            print("Buy Prod  \(producktList[indexPath.row])")
        }
    }
    

    
    
}
