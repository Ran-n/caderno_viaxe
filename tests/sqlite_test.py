#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# ------------------------------------------------------------------------------
#+ Autor:  	Ran#
#+ Creado: 	2022/03/12 23:28:09.052381
#+ Editado:	2022/03/12 23:31:58.353673
# ------------------------------------------------------------------------------
import unittest

import src.modelo.datumbazo as patron
import src.modelo.sqlite as estratexia
# ------------------------------------------------------------------------------
class TestSqlite(unittest.TestCase):
    def test_executar(self):
        """
        """

        db = patron.DatumBazo(estratexia.Sqlite())
        db.executar('a')
# ------------------------------------------------------------------------------
