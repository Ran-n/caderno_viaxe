#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# ------------------------------------------------------------------------------
#+ Autor:  	Ran#
#+ Creado: 	2022/03/12 22:12:46.038794
#+ Editado:	2022/03/12 22:14:13.844092
# ------------------------------------------------------------------------------
from dataclasses import dataclass
# ------------------------------------------------------------------------------
@dataclass
class DatosConsultaDto:
    operacion: str
    taboa: str
    obxecto: str
# ------------------------------------------------------------------------------
