CREATE TABLE cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    apellido TEXT NOT NULL,
    telefono TEXT NOT NULL,
    activo INTEGER DEFAULT 1
);

CREATE TABLE gancho (
    id_gancho INTEGER PRIMARY KEY
);

CREATE TABLE orden (
    id_orden INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    id_gancho INTEGER NOT NULL,
    fecha_recepcion DATETIME NOT NULL,
    fecha_entrega_estimada DATETIME,
    fecha_entrega_real DATETIME,
    estado TEXT NOT NULL,
    total REAL NOT NULL,
    codigo_barras TEXT UNIQUE NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_gancho) REFERENCES gancho(id_gancho)
);

CREATE INDEX idx_cliente_telefono ON cliente(telefono);




-- No todo feedback se aplica de inmediato.