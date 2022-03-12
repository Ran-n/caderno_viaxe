#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# ------------------------------------------------------------------------------
#+ Autor:  	Ran#
#+ Creado: 	2022/03/12 21:59:38.120934
#+ Editado:	2022/03/12 22:14:44.956765
# ------------------------------------------------------------------------------
# Interface Estratexia do patrón estratexia
# ------------------------------------------------------------------------------
from abc import ABC, abstractmethod

from src.modelo.datos_consulta_dto import DatosConsultaDto
# ------------------------------------------------------------------------------
class DatumBazo(ABC):
    @abstractmethod
    def executar(self, datos_consulta_dto: DatosConsultaDto):
        pass
# ------------------------------------------------------------------------------
