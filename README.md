# 📨 EmailVerification
Приложение для проверки почты на валидность.
Возможность проверки почты на правильность через сервис Kickbox. 
В качестве результата проверки есть несколько исходов:
+ invalid_email - Specified email is not a valid email address syntax
+ invalid_domain - Domain for email does not exist
+ rejected_email - Email address was rejected by the SMTP server, email address does not exist
+ accepted_email - Email address was accepted by the SMTP server
+ low_quality - Email address has quality issues that may make it a risky or low-value address
+ low_deliverability - Email address appears to be deliverable, but deliverability cannot be guaranteed
+ no_connect - Could not connect to SMTP server
+ timeout - SMTP session timed out
+ invalid_smtp - SMTP server returned an unexpected/invalid response
+ unavailable_smtp - SMTP server was unavailable to process our request
+ unexpected_error - An unexpected error has occurred
## ✍️ Information
+ Документация от сервиса - [Kickbox](https://docs.kickbox.com/docs/single-verification-api)
+ Работа с API через URLSession
+ Полностью на UIKit
+ Auto Layout
+ Градиентные кнопочки из [репо](https://github.com/KorobskoyRoman/GradientView)

## 📺 Демонстрация
<img src=https://user-images.githubusercontent.com/43990145/160446632-89c02d6e-477f-418c-909c-df7528b49bc6.gif height="500">
