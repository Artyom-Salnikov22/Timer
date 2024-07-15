//
//  TableViewController.swift
//  timer
//
//  Created by Артём Сальников on 13.07.2024.
//

import UIKit

class TableViewController: UITableViewController {

    var  arrayNews = [News(name: "Покажи мне Луну", imagename: "Moon", desc: "1960-е, космическая гонка СССР и США. Келли Джонс — акула маркетинга, которую привлекают для работы над имиджем исторической американской миссии по первому полету человека на Луну. На случай, если экипаж «Аполлона-11» все-таки не долетит до спутника, маркетологи решают снять постановочные кадры высадки астронавтов на поверхность Луны."), News(name: "Астрал", imagename: "Astral", desc: "После гибели родителей студента Респати мучают кошмары, а сам он обнаруживает, что может проникать в чужие сны. Когда зло из сновидений начинает воздействовать на реальную жизнь и ставит под угрозу девушку Респати, ему нужно научиться действовать в этих снах, чтобы ее спасти. Но попасть в сон - не самое сложное. Куда сложнее, изменив его, выбраться обратно, ведь для этого нужно разгадать тайны сомнии."), News(name: "Ночной Замес", imagename: "Night", desc: "Группа подростков проникает ночью в мебельный магазин и под лозунгом защиты природы устраивает там настоящий погром. Два брата-охранника пытаются поймать взломщиков, но из-за несчастного случая один из них погибает. Второго же ослепляет ярость, и он устраивает настоящую резню. Систематично, изощренно и крайне жестоко он устраняет молодых людей. Единственный шанс на спасение - это дотянуть до утра. Возможно, вместе с рассветом придет и спасение. Но увидит солнечный свет далеко не каждый..."), News(name: "Дэдпул и Росомаха", imagename: "Deadpool", desc: "Ведя тихий образ жизни, Уэйд Уилсон попадает в организацию «Управление временными изменениями» (УВИ), что заставляет его вернуться к альтер-эго Дэдпула и изменить историю с помощью Росомахи."), News(name: "Бордерленс", imagename: "Borderlands", desc: "Одна из самых известных охотниц за головами во Вселенной, по имени Лилит, терпеть не может две вещи: Пандору - свою родную планету, и Атласа – редкого отброса и влиятельного бандита. И все же ей придется иметь дело и с тем, и с другим: отправившись на поиски дочери Атласа на Пандору, она объединяется с другими искателями приключений. Вместе эти далеко не герои должны сразиться с инопланетной расой, жестокими охотниками, раскрыть один из самых страшных секретов планеты и, в придачу, спасти мир от надвигающегося зла! Если кто и способен все это провернуть со стилем, то это они.")]
    
    var currentIndex = 0

        // Таймер для периодического вывода данных
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
    }
    
    @objc func updateUI() {
        currentIndex += 1
        if currentIndex >= arrayNews.count {
            
            currentIndex = 0
        }
        
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNews.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let news = arrayNews[(currentIndex + indexPath.row) % arrayNews.count]
        
        cell.labelName.text = news.name
        cell.descName.text = news.desc
        cell.ImageView.image = UIImage(named: news.imagename)
        
        let date = DateFormatter()
        date.dateFormat = "HH:mm:ss"
        cell.labelTime.text = date.string(from: Date())

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 699
    }
    

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

}
