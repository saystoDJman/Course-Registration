


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var tableView:UITableView!
    var subjectClass = [ArrayClass]()
    var selProgram: ArrayClass?
    var addedSubjects = [ArrayClass]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        subjectClass.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let course = subjectClass[indexPath.row]//the index of the selected row in the tableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "subcell") as! Subcell
        cell.setSubCell(subject: course )
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selProgram = subjectClass[indexPath.row]
        textdisplay.text = ""
    }
    
    @IBOutlet weak var textdisplay: UILabel!
    @IBOutlet weak var addProgram: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        subjectClass.append(ArrayClass(subject:"Java",time: 5,cost: 1600.0))
        subjectClass.append(ArrayClass(subject:"Python",time: 4,cost: 1850.0))
        subjectClass.append(ArrayClass(subject:"Database",time: 3,cost: 1300.0))
        subjectClass.append(ArrayClass(subject:"Web Development",time: 4,cost: 1200.0))
        subjectClass.append(ArrayClass(subject:"iOS Develeopment",time: 5,cost: 2200.0))
        subjectClass.append(ArrayClass(subject:"Android Development",time: 5,cost: 2000.0))
        subjectClass.append(ArrayClass(subject:"System Analysis",time: 4,cost: 1900.0))
        subjectClass.append(ArrayClass(subject:"Cloud Computing",time: 3,cost: 1250.0))
        subjectClass.append(ArrayClass(subject:"Machine Learning",time: 5,cost: 2300.0))
        subjectClass.append(ArrayClass(subject:"Problem Solving",time: 3,cost: 950.0))
        
        textdisplay.text = "Please Add subjects to Register"
        
    }
    
    
    @IBAction func addSubject(_ sender: Any){
        
        if selProgram == nil{
            textdisplay.textColor = .systemRed
            textdisplay.text = "Please select Subject to Add"
        }else{
            var flag = 0
            let addsub = selProgram?.subject ?? "ArrayClass"
            for course in addedSubjects{
                if addsub == course.subject{
                    flag = 1
                }
            }
            
            if flag == 0{
                self.addedSubjects.append(selProgram!)
                textdisplay.textColor = .systemGreen
                textdisplay.text = "Added to My Cart"
            }else{
                textdisplay.textColor = .systemRed
                textdisplay.text = "One Program can be added only once"
            }
        }
        
    }
    
    @IBAction func gotoRegistration(_ sender: Any){
        performSegue(withIdentifier: "registration", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registration"{
            let destination = segue.destination as? DoneViewController
            destination?.addedSubjects = self.addedSubjects
        }
    }

}

    


    
    
    
 
