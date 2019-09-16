import Foundation

class QuestionBank {
    
    var list = [Question]()
    
    init() {
        
        let item = Question(text: "В 2014 году Аральское море полностью высохло.", correctAnswer: false)
        
        
        list.append(item)
        
        
        list.append(Question(text: "На самом деле Наполеон Бонапарт был ростом около 180 сантиметров.", correctAnswer: false))
        list.append(Question(text: "К началу Первой мировой войны в Африке не было ни одного независимого государства.", correctAnswer: false))
        
        list.append(Question(text: "В 60–80-х годах курс доллара составлял меньше одного рубля.", correctAnswer: true))
        
        list.append(Question(text: "Политика самоизоляции началась в Японии в эпоху Эдо.", correctAnswer: true))
        
        list.append(Question(text: "В 1935 году Нобелевской премией мира был награжден человек из Третьего рейха.", correctAnswer: true))
        list.append(Question(text: "Первым программистом в истории считается женщина.", correctAnswer: true))
        
        list.append(Question(text: "Рибосомы – это органеллы клетки, в которых образуется энергия, необходимая для существования организма.", correctAnswer: false))
        
        list.append(Question(text: "Российский город Дербент древнее египетского Каира.", correctAnswer: true))
        
        list.append(Question(text: "Период творчества Пабло Пикассо в Барселоне называется «розовым».", correctAnswer: false))
        
        list.append(Question(text: "Первую железную дорогу общественного пользования, рассчитанную на паровозы, построили в США.", correctAnswer: false))
        
        list.append(Question(text: "Эдвард Дженнер открыл пенициллин и его целебные свойства в начале XX века.", correctAnswer: false))
        
        list.append(Question(text: "Чтобы построить Дворец Советов, увенчанный 100-метровой статуей Ленина, советские власти взорвали храм Христа Спасителя.", correctAnswer: true))
    
    
}


}
