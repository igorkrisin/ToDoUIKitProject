import UIKit
import CoreData


class CreateNewToDoVC: UIViewController {
    
    private let manager = CoreManager.shared
    var todo: Todo?
    
    @IBOutlet weak var textFieldFieldToDo: UITextField!
    var dataTextfield = ""

    
    @IBOutlet weak var leftItemButton: UINavigationItem!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Создание кастомной кнопки "Back" с изображением
        let backLeftButton = UIBarButtonItem(image: UIImage(named: "cross"), style: .plain, target: self, action: #selector(backButtonTapped))
        
        let saveRightButton = UIBarButtonItem(image: UIImage(named: "done"), style: .plain, target: self, action: #selector(saveButtonTapped))
        
        backLeftButton.stileForUIBarButton(button: backLeftButton)
        saveRightButton.stileForUIBarButton(button: saveRightButton)
        textFieldFieldToDo.text = dataTextfield
        
        navigationItem.leftBarButtonItem = backLeftButton
        navigationItem.rightBarButtonItem = saveRightButton
    }
    
    @objc func backButtonTapped() {
        // Обработка нажатия на кастомную кнопку "Back"
        navigationController?.popViewController(animated: true)
    }
       
    
    @objc func saveButtonTapped(_ sender: Any) {
        if self.todo == nil {
            self.manager.addNewTodo(name: textFieldFieldToDo.text ?? "", hourses: "00", minutes: "00", seconds: "00")
        } else {
            self.todo?.updateTodo(newName: textFieldFieldToDo.text ?? "")
        }
        navigationController?.popViewController(animated: true)
    }
    
    
}

