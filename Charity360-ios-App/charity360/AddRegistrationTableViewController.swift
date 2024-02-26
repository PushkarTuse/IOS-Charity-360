//
//  AddRegistrationTableViewController.swift
//  charity360
//
//  Created by user1 on 18/01/24.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController {
    
    
    var registration: Registration? {
        let nameOfTheEvent = nameOfTheEventTextField.text ?? ""
        
        let startDate = startDateTimePicker.date
        let endDate = endDateTimePicker.date
        
        let organizationName = organizationNameTextField.text ?? ""
        
        let typeOfEvent = typeOfEventTextField.text ?? ""
        
        return Registration(nameOfTheEvent: nameOfTheEvent, startDate: startDate, endDate: endDate, organizationName: organizationName, typeOfEvent: typeOfEvent)
    }
    

    @IBOutlet weak var nameOfTheEventTextField: UITextField!
    
    @IBOutlet weak var startDateTimeLabel: UILabel!
    @IBOutlet weak var startDateTimePicker: UIDatePicker!
    @IBOutlet weak var endDateTimeLabel: UILabel!
    @IBOutlet weak var endDateTimePicker: UIDatePicker!
    
    
    @IBOutlet weak var organizationNameTextField: UITextField!
    
    @IBOutlet weak var typeOfEventTextField: UITextField!
    
    let startDateTimePickerCallIndexPath = IndexPath(row: 2, section: 1)
    let endDateTimePickerCallIndexPath = IndexPath(row: 4, section: 1)
    let startDateTimeLabelCellIndexPath = IndexPath(row: 1, section: 1)
    let endDateTimeLabelCellIndexPath = IndexPath(row: 3, section: 1)
    var isstartDateTimePickerVisible:Bool = false {
        didSet {
            startDateTimePicker.isHidden = !isstartDateTimePickerVisible
        }
    }
    var isendDateTimePickerVisible:Bool = false {
        didSet {
            endDateTimePicker.isHidden = !isendDateTimePickerVisible
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        startDateTimePicker.minimumDate = midnightToday
        startDateTimePicker.date = midnightToday

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func updateDate() {
        endDateTimePicker.minimumDate = Calendar.current.date(byAdding: .hour, value: 1, to: startDateTimePicker.date)
        
        startDateTimeLabel.text = startDateTimePicker.date.formatted(date: .abbreviated, time: .standard)
        endDateTimeLabel.text = endDateTimePicker.date.formatted(date: .abbreviated, time: .standard)
    }
    
    
    @IBAction func dateValueChanged(_ sender: UIDatePicker) {
        updateDate()
}

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
     */

    /*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
     */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // function for toggling the size of the date wheel
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case startDateTimePickerCallIndexPath where isstartDateTimePickerVisible == false: return 0
        case endDateTimePickerCallIndexPath where isendDateTimePickerVisible == false: return 0
        default:
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case startDateTimePickerCallIndexPath: return 190
        case endDateTimePickerCallIndexPath: return 190
        default:
            return UITableView.automaticDimension
        }
    }
    
    
    // function for toggeling date wheel
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == startDateTimeLabelCellIndexPath && isendDateTimePickerVisible == false {
            isstartDateTimePickerVisible.toggle()
        } else if indexPath == endDateTimeLabelCellIndexPath && isstartDateTimePickerVisible == false {
            isendDateTimePickerVisible.toggle()
        } else if indexPath == startDateTimeLabelCellIndexPath || indexPath == endDateTimeLabelCellIndexPath {
            isstartDateTimePickerVisible.toggle()
            isendDateTimePickerVisible.toggle()
        } else {
            return
        }
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
