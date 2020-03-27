# Описание проекта

См. [gitlab-services](https://github.com/astrizhachuk/gitlab-services)

Пример реализации HTTP-сервиса обновления внешний отчетов и обработок на конечной базе-получателе (глубоко модифицированная УТ 10.3).

[Описание API](https://app.swaggerhub.com/apis-docs/astrizhachuk/gitlab-services-receiver/1.0.0)

## Инструменты

* Разработка ведется в [EDT](https://releases.1c.ru/project/DevelopmentTools10). Проект создан по [bootstrap-1c](https://github.com/astrizhachuk/bootstrap-1c);
* Платформа 1С не ниже 8.3.10.2667.
* Модульные тесты EDT [1CUnits](https://github.com/DoublesunRUS/ru.capralow.dt.unit.launcher) - в расширении, см. [./GitLabServicesReceiver.Test](./GitLabServicesReceiver.Test)

## Внедрение

По подсистеме `ВнешниеОтчетыИОбработки`

Точки интеграции:

``` bsl
ОбщийМодуль.ВнешниеОтчетыИОбработкиСервер.ЗаменитьФайлВИнформационнойБазе()
```

``` bsl
ОбщийМодуль.ВнешниеОтчетыИОбработкиСервер.ПереключитьФункциональнуюОпциюЗагрузкиФайлов()
```
