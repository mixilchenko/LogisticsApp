//
//  LoyaltyViewController.swift
//  LogisticsApp
//
//  Created by mix.ilchenko on 18.03.2018.
//  Copyright © 2018 Smart Logistics. All rights reserved.
//

import UIKit

class LoyaltyViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var text = NSAttributedString()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadText()
        label.attributedText = text
    }
    
    func loadText() {
        text = "Сегодня ATC CL осуществляет полный спектр услуг по содействию российским компаниям во внешнеторговой деятельности с Китаем, странами Юго-Восточной Азии и Европы, предлагает как готовые отраслевые, так и уникальные комплексные логистические и консалтинговые решения. В широкий перечень услуг, оказываемых ATC CL, входят консалтинг и аутсорсинг ВЭД, организация и поддержка торговых контрактов с партнерами в Китае, странах Юго-Восточной Азии и Европы, морские и железнодорожные контейнерные перевозки, авиаперевозка грузов, мультимодальные транспортные услуги, консолидация и перевозка сборных грузов, таможенное оформление, обработка и хранение грузов на складах в России и за её пределами.<br><br><b>Мы предлагаем:</b><br><ol><li>Работа по удобным и проверенным транспортным схемам;</li><li>Предоставление персонального консультанта;</li><li>Работа  диспетчерской службы 24 часа в сутки;</li><li>Прозрачность в партнерских отношениях;</li><li>Ответственность на всех этапах сотрудничества;</li><li>Соблюдение сроков доставки;</li><li>Автоматизация планирования грузоперевозок;</li><li>Индивидуальный подход к поставленным задачам.</ol>".toHTML()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
