#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# ------------------------------------------------------------------------------
#+ Autor:  	Ran#
#+ Creado: 	2022/03/12 21:59:43.397991
#+ Editado:	2022/03/12 23:45:08.786974
# ------------------------------------------------------------------------------
import sqlite3

from src.modelo.datos_consulta_dto import DatosConsultaDto

import src.modelo.interfaca_datumbazo as idb
# ------------------------------------------------------------------------------
class Sqlite(idb.DatumBazo):
    def __init__(self):
        pass

    def executar(self, datos_consulta_dto: DatosConsultaDto):
        print('funca')
# ------------------------------------------------------------------------------
