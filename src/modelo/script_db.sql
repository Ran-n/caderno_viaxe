CREATE TABLE IF NOT EXISTS "estado" (
    "id"            INTEGER UNIQUE NOT NULL,
    "creacion"      TEXT NOT NULL,
    "modificacion"  TEXT,
    "nome"          TEXT UNIQUE NOT NULL,
    "descricion"    TEXT,
    CONSTRAINT estadoPK PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "usuario" (
    "id"            INTEGER UNIQUE NOT NULL,
    "creacion"      TEXT NOT NULL,
    "modificacion"  TEXT,
    "estado"        INTEGER NOT NULL DEFAULT 0,
    "nome"          TEXT NOT NULL,
    CONSTRAINT usuarioPK PRIMARY KEY ("id"),
    CONSTRAINT usuarioFK1 FOREIGN KEY ("estado") REFERENCES "estado"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL]
);

CREATE TABLE IF NOT EXISTS "tipo" (
    "id"            INTEGER UNIQUE NOT NULL,
    "creacion"      TEXT NOT NULL,
    "modificacion"  TEXT,
    "estado"        INTEGER NOT NULL DEFAULT 0,
    "continente"    INTEGER,
    "nome"          TEXT UNIQUE NOT NULL,
    CONSTRAINT tipoPK PRIMARY KEY ("id"),
    CONSTRAINT tipoFK1 FOREIGN KEY ("estado") REFERENCES "estado"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL],
    CONSTRAINT tipoFK2 FOREIGN KEY ("continente") REFERENCES "tipo"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL]
);

CREATE TABLE IF NOT EXISTS "elemento" (
    "id"            INTEGER UNIQUE NOT NULL,
    "creacion"      TEXT NOT NULL,
    "modificacion"  TEXT,
    "estado"        INTEGER NOT NULL DEFAULT 0,
    "continente"    INTEGER,
    CONSTRAINT elementoPK PRIMARY KEY ("id"),
    CONSTRAINT elementoFK1 FOREIGN KEY ("estado") REFERENCES "estado"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL],
    CONSTRAINT elementoFK2 FOREIGN KEY ("continente") REFERENCES "elemento"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL]
);

CREATE TABLE IF NOT EXISTS "opinion" (
    "id"            INTEGER UNIQUE NOT NULL,
    "creacion"      TEXT NOT NULL,
    "modificacion"  TEXT,
    "estado"        INTEGER NOT NULL DEFAULT 0,
    "nota"          INTEGER,
    "titulo"        TEXT,
    "contido"       TEXT NOT NULL,
    CONSTRAINT opinionPK PRIMARY KEY ("id"),
    CONSTRAINT opinionFK1 FOREIGN KEY ("estado") REFERENCES "estado"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL]
);

CREATE TABLE IF NOT EXISTS "consumicion" (
    "id"            INTEGER UNIQUE NOT NULL,
    "estado"        INTEGER NOT NULL DEFAULT 0,
    "comezo"        TEXT NOT NULL,
    "fin"           TEXT NOT NULL,
    "tempo"         INTEGER NOT NULL,
    CONSTRAINT consumicionPK PRIMARY KEY ("id"),
    CONSTRAINT consumicionFK1 FOREIGN KEY ("estado") REFERENCES "estado"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL]
);
