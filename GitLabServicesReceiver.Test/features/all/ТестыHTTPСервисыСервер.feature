# language: ru

@tree
@classname=ModuleExceptionPath

Функционал: GitLabServicesReceiver.Test.ТестыHTTPСервисыСервер
	Как Разработчик
	Я Хочу чтобы возвращаемое значение метода совпадало с эталонным
	Чтобы я мог гарантировать работоспособность метода

@OnServer
Сценарий: HttpServiceGetInfobase
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServiceGetInfobase(Контекст());' |

@OnServer
Сценарий: HttpServicePostUploadError400BadRequest
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostUploadError400BadRequest(Контекст());' |

@OnServer
Сценарий: HttpServicePostSwitchError400BadRequestEmptyValue
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostSwitchError400BadRequestEmptyValue(Контекст());' |

@OnServer
Сценарий: HttpServicePostSwitchError400BadRequestBadValue
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostSwitchError400BadRequestBadValue(Контекст());' |

@OnServer
Сценарий: HttpServicePostUploadError401Unauthorized
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostUploadError401Unauthorized(Контекст());' |

@OnServer
Сценарий: HttpServicePostSwitchError401Unauthorized
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostSwitchError401Unauthorized(Контекст());' |

@OnServer
Сценарий: HttpServicePostUploadError403Forbidden
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostUploadError403Forbidden(Контекст());' |

@OnServer
Сценарий: HttpServicePostSwitchError403Forbidden
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostSwitchError403Forbidden(Контекст());' |

@OnServer
Сценарий: HttpServicePostUploadError423Locked
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostUploadError423Locked(Контекст());' |

@OnServer
Сценарий: HttpServicePostUpload200Ok
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostUpload200Ok(Контекст());' |

@OnServer
Сценарий: HttpServicePostSwitch200Enabled
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostSwitch200Enabled(Контекст());' |

@OnServer
Сценарий: HttpServicePostSwitch200Disabled
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostSwitch200Disabled(Контекст());' |