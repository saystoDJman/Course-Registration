


import UIKit

class SelecctedSubViewController: UITableViewCell {

    @IBOutlet weak var subject:UILabel!
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
    
    func setCourseCell (course: ArrayClass){
        subject.text = course.subject
        time.text = String(course.time)
        cost.text = String(course.cost)
        
    }

}
