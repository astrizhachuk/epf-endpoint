# language: ru

@tree
@classname=ModuleExceptionPath

Функционал: Endpoint.Tests.TestsHTTPServicesServer
	Как Разработчик
	Я Хочу чтобы возвращаемое значение метода совпадало с эталонным
	Чтобы я мог гарантировать работоспособность метода

@OnServer
Сценарий: SetBodyAsJSON
	И я выполняю код встроенного языка на сервере
	| 'TestsHTTPServicesServer.SetBodyAsJSON(Контекст());' |