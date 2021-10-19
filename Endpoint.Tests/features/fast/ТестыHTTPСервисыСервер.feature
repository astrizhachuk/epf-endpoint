# language: ru

@tree
@classname=ModuleExceptionPath

Функционал: Endpoint.Tests.ТестыHTTPСервисыСервер
	Как Разработчик
	Я Хочу чтобы возвращаемое значение метода совпадало с эталонным
	Чтобы я мог гарантировать работоспособность метода

@OnServer
Сценарий: SetTokenPost400BadRequestMissingValue
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SetTokenPost400BadRequestMissingValue(Контекст());' |

@OnServer
Сценарий: SetTokenPost400BadRequestEmptyValue
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SetTokenPost400BadRequestEmptyValue(Контекст());' |

@OnServer
Сценарий: UploadFilePost200Ok
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.UploadFilePost200Ok(Контекст());' |