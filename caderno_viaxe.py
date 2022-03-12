#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# ------------------------------------------------------------------------------
#+ Autor:  	Ran#
#+ Creado: 	2022/03/12 22:22:39.732325
#+ Editado:	2022/03/12 22:26:07.262877
# ------------------------------------------------------------------------------
import src.modelo.datumbazo as patron
import src.modelo.sqlite as estratexia_concreta
# ------------------------------------------------------------------------------
db = patron.DatumBazo(estratexia_concreta.Sqlite())
db.executar('a')
# ------------------------------------------------------------------------------