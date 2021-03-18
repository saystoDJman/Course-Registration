
import UIKit

class Subcell: UITableViewCell {

    @IBOutlet weak var subName:UILabel!
    @IBOutlet weak var time:UILabel!
    @IBOutlet weak var cost:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setSubCell (subject : ArrayClass){
        subName.text = subject.subject
        time.text = String(subject.time)
        cost.text = String(subject.cost)
        
    }

}

