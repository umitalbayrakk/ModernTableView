
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var producktList:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        pripareList()
    }
    //Listeyi Doldurduğumuz Func.
    private func pripareList(){
        producktList.append(Product(name: "Pantolon", price: "1000 $"))
        producktList.append(Product(name: "Kazak", price: "500 $"))
        producktList.append(Product(name: "Gömlek", price: "700 $"))
        producktList.append(Product(name: "Hırka", price: "400 $"))
        producktList.append(Product(name: "Ayakkabı", price: "2000 $"))
        producktList.append(Product(name: "Kemer", price: "300 $"))
    }
    // ViewDidload ı güncellemek için oluşturduğumuz fonksiyon.
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
}



extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return producktList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = producktList[indexPath.row].name
        content.secondaryText = producktList[indexPath.row].price
        cell.contentConfiguration = content
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select Produckt : \(producktList[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Silinecek Produckt : \(producktList[indexPath.row])")
            producktList.remove(at: indexPath.row)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
