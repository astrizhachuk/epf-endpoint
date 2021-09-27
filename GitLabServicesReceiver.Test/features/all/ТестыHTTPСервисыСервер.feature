# language: ru

@tree
@classname=ModuleExceptionPath

Функционал: GitLabServicesReceiver.Test.ТестыHTTPСервисыСервер
	Как Разработчик
	Я Хочу чтобы возвращаемое значение метода совпадало с эталонным
	Чтобы я мог гарантировать работоспособность метода

@OnServer
Сценарий: HttpServiceGetVersion
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServiceGetVersion(Контекст());' |

@OnServer
Сценарий: HttpServicePostUpdateError400BadRequest
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostUpdateError400BadRequest(Контекст());' |

@OnServer
Сценарий: HttpServicePostSwitchError400BadRequest
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostSwitchError400BadRequest(Контекст());' |

@OnServer
Сценарий: HttpServicePostUpdateError401Unauthorized
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostUpdateError401Unauthorized(Контекст());' |

@OnServer
Сценарий: HttpServicePostSwitchError401Unauthorized
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostSwitchError401Unauthorized(Контекст());' |

@OnServer
Сценарий: HttpServicePostUpdateError403Forbidden
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostUpdateError403Forbidden(Контекст());' |

@OnServer
Сценарий: HttpServicePostSwitchError403Forbidden
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostSwitchError403Forbidden(Контекст());' |

@OnServer
Сценарий: HttpServicePostUpdateError423Locked
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostUpdateError423Locked(Контекст());' |

@OnServer
Сценарий: HttpServicePostUpdate200Ok
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostUpdate200Ok(Контекст());' |

@OnServer
Сценарий: HttpServicePostSwitch200Enabled
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostSwitch200Enabled(Контекст());' |

@OnServer
Сценарий: HttpServicePostSwitch200Disabled
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.HttpServicePostSwitch200Disabled(Контекст());' |