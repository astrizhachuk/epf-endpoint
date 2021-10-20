# language: ru

@tree
@classname=ModuleExceptionPath

Функционал: Endpoint.Tests.ТестыHTTPСервисыСервер
	Как Разработчик
	Я Хочу чтобы возвращаемое значение метода совпадало с эталонным
	Чтобы я мог гарантировать работоспособность метода

@OnServer
Сценарий: InfobaseGet200Ok
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.InfobaseGet200Ok(Контекст());' |

@OnServer
Сценарий: StatusGet200Ok
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.StatusGet200Ok(Контекст());' |

@OnServer
Сценарий: FindByGUIDGet404NotFound
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.FindByGUIDGet404NotFound(Контекст());' |

@OnServer
Сценарий: FindByGUIDGet500BadGUID
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.FindByGUIDGet500BadGUID(Контекст());' |

@OnServer
Сценарий: FindByGUIDGet200Ok
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.FindByGUIDGet200Ok(Контекст());' |

@OnServer
Сценарий: FindByFilenameGet400BadRequest
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.FindByFilenameGet400BadRequest(Контекст());' |

@OnServer
Сценарий: FindByFilenameGet404NotFound
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.FindByFilenameGet404NotFound(Контекст());' |

@OnServer
Сценарий: FindByFilenameGet200Ok
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.FindByFilenameGet200Ok(Контекст());' |

@OnServer
Сценарий: SwitchPost400BadRequestMissingValue
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SwitchPost400BadRequestMissingValue(Контекст());' |

@OnServer
Сценарий: SwitchPost400BadRequestBadValue
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SwitchPost400BadRequestBadValue(Контекст());' |

@OnServer
Сценарий: SwitchPost401Unauthorized
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SwitchPost401Unauthorized(Контекст());' |

@OnServer
Сценарий: SwitchPost403Forbidden
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SwitchPost403Forbidden(Контекст());' |

@OnServer
Сценарий: SwitchPost200Enabled
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SwitchPost200Enabled(Контекст());' |

@OnServer
Сценарий: SwitchPost200Disabled
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SwitchPost200Disabled(Контекст());' |

@OnServer
Сценарий: SetTokenPost400BadRequestMissingValue
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SetTokenPost400BadRequestMissingValue(Контекст());' |

@OnServer
Сценарий: SetTokenPost400BadRequestEmptyValue
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SetTokenPost400BadRequestEmptyValue(Контекст());' |

@OnServer
Сценарий: SetTokenPost401Unauthorized
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SetTokenPost401Unauthorized(Контекст());' |

@OnServer
Сценарий: SetTokenPost200OkInitToken
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SetTokenPost200OkInitToken(Контекст());' |

@OnServer
Сценарий: SetTokenPost200OkChange
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.SetTokenPost200OkChange(Контекст());' |

@OnServer
Сценарий: UploadFilePost400BadRequest
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.UploadFilePost400BadRequest(Контекст());' |

@OnServer
Сценарий: UploadFilePost401Unauthorized
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.UploadFilePost401Unauthorized(Контекст());' |

@OnServer
Сценарий: UploadFilePost403Forbidden
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.UploadFilePost403Forbidden(Контекст());' |

@OnServer
Сценарий: UploadFilePost423Locked
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.UploadFilePost423Locked(Контекст());' |

@OnServer
Сценарий: UploadFilePost404NotFound
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.UploadFilePost404NotFound(Контекст());' |

@OnServer
Сценарий: UploadFilePost200Ok
	И я выполняю код встроенного языка на сервере
	| 'ТестыHTTPСервисыСервер.UploadFilePost200Ok(Контекст());' |