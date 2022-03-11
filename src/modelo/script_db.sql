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
    "nome"          TEXT UNIQUE NOT NULL,
    "contrasinal"   TEXT,
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
    "id_tipo"       INTEGER NOT NULL,
    CONSTRAINT elementoPK PRIMARY KEY ("id"),
    CONSTRAINT elementoFK1 FOREIGN KEY ("estado") REFERENCES "estado"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL],
    CONSTRAINT elementoFK2 FOREIGN KEY ("continente") REFERENCES "elemento"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL],
    CONSTRAINT elementoFK3 FOREIGN KEY ("id_tipo") REFERENCES "tipo"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL]
);

CREATE TABLE IF NOT EXISTS "opinion" (
    "id"            INTEGER UNIQUE NOT NULL,
    "creacion"      TEXT NOT NULL,
    "modificacion"  TEXT,
    "estado"        INTEGER NOT NULL DEFAULT 0,
    "nota"          INTEGER,
    "titulo"        TEXT,
    "contido"       TEXT NOT NULL,
    "id_elemento"   INTEGER NOT NULL,
    CONSTRAINT opinionPK PRIMARY KEY ("id"),
    CONSTRAINT opinionFK1 FOREIGN KEY ("estado") REFERENCES "estado"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL],
    CONSTRAINT opinionFK2 FOREIGN KEY ("id_elemento") REFERENCES "elemento"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL]
);

CREATE TABLE IF NOT EXISTS "consumicion" (
    "id"            INTEGER UNIQUE NOT NULL,
    "estado"        INTEGER NOT NULL DEFAULT 0,
    "comezo"        TEXT NOT NULL,
    "fin"           TEXT NOT NULL,
    "tempo"         INTEGER NOT NULL,
    "id_usuario"    INTEGER NOT NULL,
    "id_elemento"   INTEGER NOT NULL,
    CONSTRAINT consumicionPK PRIMARY KEY ("id"),
    CONSTRAINT consumicionFK1 FOREIGN KEY ("estado") REFERENCES "estado"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL],
    CONSTRAINT consumicionFK2 FOREIGN KEY ("id_usuario") REFERENCES "usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL],
    CONSTRAINT consumicionFK3 FOREIGN KEY ("id_elemento") REFERENCES "elemento"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL]
);

CREATE TABLE IF NOT EXISTS "rol" (
    "id"    INTEGER UNIQUE NOT NULL,
    "nome"  TEXT NOT NULL,
    CONSTRAINT rolPK PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "autoria" (
    "id_elemento"   INTEGER NOT NULL,
    "id_autoria"    INTEGER NOT NULL,
    "id_rol"        INTEGER NOT NULL,
    CONSTRAINT autoriaPK PRIMARY KEY ("id_elemento", "id_autoria", "id_rol"),
    CONSTRAINT autoriaFK1 FOREIGN KEY ("estado") REFERENCES "estado"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL],
    CONSTRAINT autoriaFK2 FOREIGN KEY ("id_usuario") REFERENCES "usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL]
);

CREATE TABLE IF NOT EXISTS "usuario_opinion" (
    "id_usuario"    INTEGER NOT NULL,
    "id_opinion"    INTEGER NOT NULL,
    CONSTRAINT usuario_opinionPK PRIMARY KEY ("id_usuario", "id_opinion"),
    CONSTRAINT usuario_opinionFK1 FOREIGN KEY ("id_usuario") REFERENCES "usuario"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL],
    CONSTRAINT usuario_opinionFK2 FOREIGN KEY ("id_opinion") REFERENCES "opinion"("id") ON DELETE CASCADE ON UPDATE CASCADE MATCH [FULL]
);
