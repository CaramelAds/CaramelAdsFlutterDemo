Version 9.20.0

## ENG ( RUS version below )
## How to use:

Open the Flutter project and nested project in Android directory with Android Studio.
The main code for launching is located in the Android project, it does not have to be changed. As you see the code from Flutter project should launch the methods from android project.

1. Add links to our maven-repository to build.gradle (project) in the Android project:

          ```
          allprojects {
            repositories {
              google()
              jcenter()
              maven { url "https://maven.caramelads.com/repository/maven-releases" }
              maven { url "https://android-sdk.is.com/" }              
            }
          }
          ```


2. Add compiler options and dependency to build.gradle (app) in the Android project:

          ```
          compileOptions {
             targetCompatibility JavaVersion.VERSION_1_8
             sourceCompatibility JavaVersion.VERSION_1_8
           }

            dependencies {
              ...
              implementation('com.caramelads:sdk:9.20.0')
              ...
            }
            ```

3. Scenarios of ads showing

    Attention:

    If you use our sdk before new time-request rules pls remove old integration code and our old proguard-rules.pro (except ad showing places)

    Loading and show ads:
    To load ads, see the example, in the ```TestUI(Flutter)``` class, the SDK is initialize by call the method ```caramelInitialize()``` this is required for right work of SDK. Let see to ```CaramelAds.setAdListener(...)``` method, from Android project which is required to set up event listeners, the ```CaramelAds.cache(MainActivity.this)``` method from the Android project is called by response to the ```sdkReady()``` event. The ```CaramelAds.cache(...)``` method is required for right work SDK and starts caching of the ad before show, caching is takes a certain amount of time. Further in the example, when you click on the Caramel button,  the method in 
    ```
    if(await platform.invokeMethod('isloaded').then((value) => value??false))
        runApp(AnotherUI());
    ```
    is called and show ad if it is ready to be shown.
        
    Application example:
    Application demonstrate a typical example of showing ads when switching between screens. This is like a behavior computer games and advertisements can be shown at the moment of level up in a game, when there is a switch between screens. In a mobile applications, you can add ad display at the moment before the launch of the settings screen (new Activity or Fragment) of the application or etc. isloaded method place in android project

    You can download an example and review the functionality by looking at the comments in the code.


# Thank you for use our product!

# RUS

## Как использовать:
Откройте с помощью Android Studio проект Flutter и вложенный проект в каталоге Android.
Основной код для запуска находится в проекте Android, его можно не менять. В проекте Flutter происходит запуск
методов из проекта Android.

1.	Добавьте ссылку на наш maven-репозиторий в файл build.gradle (project) в проекте Android:

          ```
          allprojects {
            repositories {
              google()
              jcenter()
              maven { url "https://maven.caramelads.com/repository/maven-releases" }
              maven { url "https://android-sdk.is.com/" }
            }
          }
          ```

2.	Добавьте зависимость и опции компилятора в build.gradle (app) в проекте Android:

        ```
        compileOptions {
           targetCompatibility JavaVersion.VERSION_1_8
           sourceCompatibility JavaVersion.VERSION_1_8
         }

          dependencies {
            ...
            implementation('com.caramelads:sdk:9.20.0')
            ...
          }
          ```

3.	Показ рекламы:

  	Внимание:

  	Если вы использовали наше sdk перед новыми правилами тайминга запросов рекламы, пожалуйста удалите старый код интеграции и старые proguard-rules.pro		(исключая места показа рекламы)

  	Загрузка рекламы и отображение:
  	Для загрузки рекламы обратите внимание на пример, в классе ```TestUI(Flutter)``` происходит инициализация SDK путем запуска метода
    ```caramelInitialize()``` это является обязательным. Обратите внимание на метод ```CaramelAds.setAdListener(...)``` расположенный в проекте Android, этот метод необходим для установки слушателей событий, в нем происходит вызов метода ```CaramelAds.cache(MainActivity.this)``` расположенного в проекте Android, в ответ на событие ```sdkReady()```. Метод ```CaramelAds.cache(...)``` является обязательным и запускает кэширование рекламы перед показом, кэширование занимает определенное время. Далее в примере при нажатии на кнопку Карамели происходит вызов метода
    ```
    if(await platform.invokeMethod('isloaded').then((value) => value??false))
        runApp(AnotherUI());
    ```

    который позволит показать рекламу если она готова к показу. Метод ```isloaded``` расположен в проекте Android.

    Пример приложения:
    В приложении представлен типичный пример показа рекламы в момент переключения экранов. Такое поведение может соответствовать компьютерным играм и рекламу можно показать в момент перехода между уровнями игры, когда происходит переход между экранами. В мобильных приложениях можно добавить показ рекламы в момент перед запуском экрана настроек(новой Activity или Fragment) приложениях или подобных.

  	Вы можете скачать пример и рассмотреть функциональные возможности ориентируясь по комментариям в коде.



# Спасибо, что используете наш продукт!
