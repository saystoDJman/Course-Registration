

import UIKit

class DoneViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var selProgram: ArrayClass?
    var addedSubjects = [ArrayClass]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        addedSubjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = addedSubjects[indexPath.row]//the index of the selected row in the tableView
        let cell = secondTable.dequeueReusableCell(withIdentifier: "selectedcell") as! SelecctedSubViewController
        cell.setCourseCell(course : course)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selProgram = addedSubjects[indexPath.row]
    }
    
    
    @IBOutlet weak var secondTable: UITableView!
    @IBOutlet weak var totaltime: UILabel!
    @IBOutlet weak var totalcost: UILabel!
    @IBOutlet weak var textDisplay: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!

    var tottime: Int = 0
    var totcost: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textDisplay.text = "Please Check Subjects and Register"
        
        secondTable.tableFooterView = UIView()
        
        secondTable.delegate = self
        secondTable.dataSource = self
        
        total()
 
    }
    
    func total(){
        tottime = 0
        totcost = 0.0
        for course in addedSubjects{
            tottime += course.time
            totcost += course.cost
        }
        totaltime.text = String(tottime)
        totalcost.text = String(totcost)
        
        if tottime > 19 {
            textDisplay.textColor = .systemRed
            textDisplay.text = "Total Hours permitted(19Hrs) exceeded"
        }
    }
    
    
    @IBAction func deleteCoursePressed(_ sender: Any){
        if addedSubjects.isEmpty{
            textDisplay.textColor = .systemRed
            textDisplay.text = "There is no Subject to Delete"
        }else if selProgram == nil{
            textDisplay.textColor = .systemRed
            textDisplay.text = "Please Select Program to delete"
        }else{
            var removeIndex = 0
            let deleteCourse = selProgram?.subject ?? "course"
            for index in 0..<addedSubjects.count {
                if(deleteCourse == addedSubjects[index].subject) {
                    removeIndex = index
                }
            }
            addedSubjects.remove(at: removeIndex)
            total()
            self.selProgram = nil
            secondTable.reloadData()
        }
        textDisplay.text = ""
        
    }
    
    @IBAction func registerStudent(_ sender: Any){
        if addedSubjects.isEmpty{
            textDisplay.textColor = .systemRed
            textDisplay.text = "Minimum one program needed to Register"
        }else if tottime > 19{
            textDisplay.textColor = .systemRed
            textDisplay.text = "Total Hours must not exceed 19Hrs"
        }else{
            textDisplay.textColor = .systemGreen
            textDisplay.text = "Student Registration Succesfull"
            addedSubjects.removeAll()
            secondTable.reloadData()
        }
    }
    
    @IBAction func backtosubject(_ sender: Any){
        performSegue(withIdentifier: "back", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "back"{
            let destination = segue.destination as? ViewController
            destination?.addedSubjects = self.addedSubjects
        }
    }
    
}

