#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# ------------------------------------------------------------------------------
#+ Autor:  	Ran#
#+ Creado: 	2022/03/12 21:59:34.617787
#+ Editado:	2022/03/12 22:19:48.763776
# ------------------------------------------------------------------------------
#* Clase Contexto do patrón estratexia
# ------------------------------------------------------------------------------
import src.modelo.interfaca_datumbazo as idb

from src.modelo.datos_consulta_dto import DatosConsultaDto
# ------------------------------------------------------------------------------
class DatumBazo:
    def __init__(self, db: idb.DatumBazo):
        # obrigamos o uso dunha instancia
        if isinstance(db, idb.DatumBazo):
            self.db = db
        else:
            raise ValueError(f'Ten que herdar de {DatumBazo.__name__}')

    def executar(self, datos_consulta_dto: DatosConsultaDto):
        self.db.executar(datos_consulta_dto)
# ------------------------------------------------------------------------------
