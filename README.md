# Swift Utils Kit

## Topics
* General
    * [System info](#systeminfo)
    * [Localize](#localize)
* Extensions
    * [Collection](#collection)
    * [Data](#data)
    * [Date](#date)
    * [DateFormatter](#dateformatter)
    * [Dictionary](#dictionary)
    * [Encodable](#encodable)
    * [JSONDecoder](#jsondecoder)
    * [JSONEncoder](#jsonencoder)
    * [NSObject](#nsobject)
    * [String](#string)
    * [UIColor](#uicolor)
    * [UIFont](#uifont)
    * [UIView](#uiview)

## `General`

### System info
---
* `var appVersionAndBuild: String { get }`
    
    ```swift
    let system = SystemInfo()
    //App version: 1.0.0
    //Build number 1
    system.appVersionAndBuild //"1001"
    ```

* `var appVersion: String { get }`
    
    ```swift
    let system = SystemInfo()
    //App version: 1.0.0
    system.appVersion //"1.0.0"
    ```
    
* `var appBuild: String { get }`

    ```swift
    let system = SystemInfo()
    //App build: 1
    system.appVersion //"1"
    ```

#### Localize
---
* `static func string(key: String, bundle: Bundle = .main) -> String`

    ```swift
    Localize.string(key: "home_title")
    ```


## `Extensions`

#### Collection
---
* `var isNotEmpty: Bool { get }`

    ```swift
    let array = [String]()
    array.isNotEmpty
    ```
* `subscript (safe index: Index) -> Element?`

    ```swift
    let array = ["John", "Mary"]
    array[safe: 0] // John
    array[safe: -1] // nil
    ```

#### Data
---
* `func decoded<T: Decodable>(as type: T.Type, using decoder: JSONDecoder = .defaultDecoder()) throws -> T`

    ```swift
    struct People: Decodable { 
        ...
    }
    
    let data = Data()
    data.decoded(as: People.self)
    ```

#### Date
---
Default format options
*   ```
     * "yyyy-MM-dd hh:mm:ss"
     * "yyyy-MM-dd"
     * "MMMM, yyyy"
     * "MM, yyyy"
    ```

* `func day(calendar: Calendar = .current) -> Int`

    ```swift
    // returns a number
    Date().day()
    ```

* `func toString(format: String = DateFormatType.serverShort.rawValue, 
               dateFormatter: DateFormatter = .defaultFormatter()) -> String`

    ```swift
    Date().toString() //it uses: .serverShort
    ```

* `func toFormat(_ format: String = DateFormatType.serverShort.rawValue) -> Date?`

    ```swift
    //when we want to convert a date from Presentation to Infrastructure layer or vice versa
    Date().toFormat("yyyy")
    ```

* `func dayWihSuffix(calendar: Calendar = .current) -> String`

    ```swift
    "2024-03-05"
        .toDate()
        .dayWihSuffix() // returns: "5th"
    ```

#### DateFormatter
---
This is an importante usage because for consistence, it's expect to use thesame formatter in the whole app.

* `static func defaultFormatter(dateFormat: String = DateFormatType.serverLong.rawValue) -> DateFormatter`

    ```swift
    DateFormatter.defaultFormatter()
    ```

#### Dictionary
---
* `func toData() -> Data?`

    ```swift
    let dict: [String: Any] = ["id": 1, "name": "John"]
    dict.toData()
    ```

#### Encodable
---

*   ```swift
    struct People: Encodable { 
        let id: Int
    }
    ```

* `func toData(encoder: JSONEncoder = .defaultEncoder()) -> Data?`

    ```swift
    let people = People(id: 1)
    people.toData()
    ```

* `func toJson(encoder: JSONEncoder = .defaultEncoder()) -> [String: Any]?`

    ```swift
    let people = People(id: 1)
    people.toJson() //["id": 1]
    ```

#### JSONDecoder
---
* `static func defaultDecoder(dateFormatter: DateFormatter = .defaultFormatter()) -> JSONDecoder`

    ```swift
    JSONDecoder.defaultDecoder()
    ```

#### JSONEncoder
---
* `static func defaultEncoder(dateFormatter: DateFormatter = .defaultFormatter()) -> JSONEncoder`

    ```swift
    JSONEncoder.defaultDecoder()
    ```

#### NSObject
---
It's a good option when we want to register cells on TableViews.

*   ```swift
    let tableView = UITableView(...)
    tableView.register(PeopleTableViewCell.self, 
                       forCellReuseIdentifier: PeopleTableViewCell.className)
    ```

* `static var className: String { get }`
    `var className: String { get }`
    
    ```swift
    final class PeopleTableViewCell: NSObject {
        ...
    }
    
    PeopleTableViewCell.className
    //or
    let cell = PeopleTableViewCell(...)
    cell.className
    ```

* `func asKind<T>(of: T.Type) -> T?`

    ```swift
    final class PeopleViewController: UIViewController { ... }
    let anyObject: NSObject = PeopleViewController()
    anyObject.asKind(of: UIViewController.self)
    ```

#### String
---

* `func removeCharacters(_ characters: [Character] = defaultCharactersToRemove) -> String`

    ```swift
    let word = "*4 . john"
    word.removeCharacters() //*4john
    //or
    word.removeCharacters([" ",".", "*", "4"]) //john
    ```

* `func onlyNumbers() -> String`

    ```swift
    "1b2c3d".onlyNumbers() //"123"
    ```

* `func toDate(format: String = DateFormatType.showShort.rawValue, dateFormatter: DateFormatter = .defaultFormatter()) -> Date?`

    * 1º option:
        ```swift
        "March, 2024".toDate()
        ```
    
    * 2º option:
        ```swift
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        "25-03-2024".toDate(dateFormatter: formatter) //succeed
        ```

#### UIColor
---

* `convenience init?(hex: String)`

    ```swift
    let color = UIColor(hex: "#AABBCC") //succeed
    let color = UIColor(hex: "AABBCC") //succeed
    ```

#### UIFont
---

* `static func custom(family: String, size: CGFloat, defaultFont: UIFont = defaultFont) -> UIFont`

    ```swift
    UIFont.custom(family: "font_name_on_info.plist", size: 12)
    ```

#### UIView
---
* `var isVisible: Bool { get set }`

    ```swift
    UIView().isVisible = true
    UIView().isHidden = true
    ```

* `func clipAsCircle() -> UIView`

    ```swift
    let view = UIView()
    view.clipAsCircle()
    ```

* `func cornerRadius(value: CGFloat) -> UIView`

    ```swift
    let view = UIView()
    view.cornerRadius(radius: 5.0)
    ```

* `func cornerRadius(radius: CGFloat, cornerMask: CACornerMask) -> UIView`

    ```swift
    let view = UIView()
    view.cornerRadius(radius: 5.0, cornerMask: [.layerMaxXMaxYCorner])
    ```

* `func configureBorder(color: UIColor = UIColor.lightGray,
                                                   thickness: CGFloat = 0.5,
                                                   cornerRadius: CGFloat = 0) -> UIView`

    ```swift
    let view = UIView()
    view.configureBorder()
    ```

* `func addShadow(color: UIColor = .black,
                   opacity: Float = 0.2,
                   shadowRadius: CGFloat = 2,
                   offset: CGSize = .init(width: -0.05, height: 0.05),
                   cornerRadius: CGFloat = 4) -> UIView`

    ```swift
    let view = UIView()
    view.addShadow()
    ```

* `func addGradient(colors: [UIColor], flow: ColorFlow = .leftRight) -> UIView`

    ```swift
    let view = UIView()
    view.addGradient(colors: [.red, .blue, .orange])
    ```

* `func centerInSuperview()`

    ```swift
    let view1 = UIView()
    let view2 = UIView()
    
    view1.addSubview(view2)
    view2.centerInSuperview()
    ```

* `func anchor(_ view: UIView, distance: CGFloat = 8)`

    ```swift
    let view1 = UIView()
    let view2 = UIView()
    
    view1.anchor(view2)
    ```






