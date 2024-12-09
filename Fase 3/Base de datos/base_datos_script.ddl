-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-12-06 22:41:33 CLST
--   sitio:      Oracle Database 21c
--   tipo:      Oracle Database 21c



DROP TABLE customuser CASCADE CONSTRAINTS;

DROP TABLE customuser_role CASCADE CONSTRAINTS;

DROP TABLE estadopedido CASCADE CONSTRAINTS;

DROP TABLE estadoticket CASCADE CONSTRAINTS;

DROP TABLE material CASCADE CONSTRAINTS;

DROP TABLE pedido CASCADE CONSTRAINTS;

DROP TABLE proveedor CASCADE CONSTRAINTS;

DROP TABLE reporte CASCADE CONSTRAINTS;

DROP TABLE ticket CASCADE CONSTRAINTS;

DROP TABLE tiporeporte CASCADE CONSTRAINTS;

DROP TABLE unidadmedida CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customuser (
    id       NUMBER NOT NULL,
    username VARCHAR2(150) NOT NULL,
    email    VARCHAR2(254) NOT NULL,
    password VARCHAR2(128) NOT NULL
);

ALTER TABLE customuser ADD CONSTRAINT customuser_pk PRIMARY KEY ( id );

ALTER TABLE customuser ADD CONSTRAINT index_1 UNIQUE ( username );

ALTER TABLE customuser ADD CONSTRAINT index_2 UNIQUE ( email );


CREATE TABLE CustomUser_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id NUMBER NOT NULL
 ,username VARCHAR2 (150) NOT NULL
 ,email VARCHAR2 (254) NOT NULL
 ,password VARCHAR2 (128) NOT NULL
 );

CREATE OR REPLACE TRIGGER CustomUser_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON CustomUser for each row 
 Declare 
  rec CustomUser_JN%ROWTYPE; 
  blank CustomUser_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.username := :NEW.username; 
      rec.email := :NEW.email; 
      rec.password := :NEW.password; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.username := :OLD.username; 
      rec.email := :OLD.email; 
      rec.password := :OLD.password; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into CustomUser_JN VALUES rec; 
  END; 
  /CREATE TABLE customuser_role (
    user_id NUMBER NOT NULL,
    role_id NUMBER NOT NULL
);

ALTER TABLE customuser_role ADD CONSTRAINT customuser_role_pk PRIMARY KEY ( user_id,
                                                                            role_id );


CREATE TABLE CustomUser_Role_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,user_id NUMBER NOT NULL
 ,role_id NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER CustomUser_Role_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON CustomUser_Role for each row 
 Declare 
  rec CustomUser_Role_JN%ROWTYPE; 
  blank CustomUser_Role_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.user_id := :NEW.user_id; 
      rec.role_id := :NEW.role_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.user_id := :OLD.user_id; 
      rec.role_id := :OLD.role_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into CustomUser_Role_JN VALUES rec; 
  END; 
  /CREATE TABLE estadopedido (
    id          NUMBER NOT NULL,
    descripcion VARCHAR2(500) NOT NULL
);

ALTER TABLE estadopedido ADD CONSTRAINT estadopedido_pk PRIMARY KEY ( id );


CREATE TABLE EstadoPedido_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id NUMBER NOT NULL
 ,descripcion VARCHAR2 (500) NOT NULL
 );

CREATE OR REPLACE TRIGGER EstadoPedido_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON EstadoPedido for each row 
 Declare 
  rec EstadoPedido_JN%ROWTYPE; 
  blank EstadoPedido_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.descripcion := :NEW.descripcion; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.descripcion := :OLD.descripcion; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into EstadoPedido_JN VALUES rec; 
  END; 
  /CREATE TABLE estadoticket (
    id            NUMBER NOT NULL,
    descripcion   VARCHAR2(500) NOT NULL,
    fecha_salida  DATE,
    fecha_entrega DATE
);

ALTER TABLE estadoticket ADD CONSTRAINT estadoticket_pk PRIMARY KEY ( id );


CREATE TABLE EstadoTicket_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id NUMBER NOT NULL
 ,descripcion VARCHAR2 (500) NOT NULL
 ,fecha_salida DATE
 ,fecha_entrega DATE
 );

CREATE OR REPLACE TRIGGER EstadoTicket_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON EstadoTicket for each row 
 Declare 
  rec EstadoTicket_JN%ROWTYPE; 
  blank EstadoTicket_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.descripcion := :NEW.descripcion; 
      rec.fecha_salida := :NEW.fecha_salida; 
      rec.fecha_entrega := :NEW.fecha_entrega; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.descripcion := :OLD.descripcion; 
      rec.fecha_salida := :OLD.fecha_salida; 
      rec.fecha_entrega := :OLD.fecha_entrega; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into EstadoTicket_JN VALUES rec; 
  END; 
  /CREATE TABLE material (
    id                  NUMBER NOT NULL,
    nombre              VARCHAR2(100) NOT NULL,
    descripcion         VARCHAR2(500),
    unidad_medida_id    NUMBER NOT NULL,
    cantidad_disponible NUMBER NOT NULL,
    stock               NUMBER NOT NULL,
    activo              CHAR(1) DEFAULT 'Y' NOT NULL
);

ALTER TABLE material ADD CHECK ( cantidad_disponible >= 0 );

ALTER TABLE material ADD CONSTRAINT material_pk PRIMARY KEY ( id );


CREATE TABLE Material_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id NUMBER NOT NULL
 ,nombre VARCHAR2 (100) NOT NULL
 ,descripcion VARCHAR2 (500)
 ,unidad_medida_id NUMBER NOT NULL
 ,cantidad_disponible NUMBER NOT NULL
 ,stock NUMBER NOT NULL
 ,activo CHAR (1) NOT NULL
 );

CREATE OR REPLACE TRIGGER Material_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Material for each row 
 Declare 
  rec Material_JN%ROWTYPE; 
  blank Material_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.nombre := :NEW.nombre; 
      rec.descripcion := :NEW.descripcion; 
      rec.unidad_medida_id := :NEW.unidad_medida_id; 
      rec.cantidad_disponible := :NEW.cantidad_disponible; 
      rec.stock := :NEW.stock; 
      rec.activo := :NEW.activo; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.nombre := :OLD.nombre; 
      rec.descripcion := :OLD.descripcion; 
      rec.unidad_medida_id := :OLD.unidad_medida_id; 
      rec.cantidad_disponible := :OLD.cantidad_disponible; 
      rec.stock := :OLD.stock; 
      rec.activo := :OLD.activo; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Material_JN VALUES rec; 
  END; 
  /CREATE TABLE pedido (
    id            NUMBER NOT NULL,
    proveedor_id  NUMBER NOT NULL,
    material_id   NUMBER NOT NULL,
    cantidad      NUMBER(10, 2) NOT NULL,
    fecha_pedido  DATE NOT NULL,
    fecha_entrega DATE NOT NULL,
    estado_id     NUMBER NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( id );


CREATE TABLE Pedido_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id NUMBER NOT NULL
 ,proveedor_id NUMBER NOT NULL
 ,material_id NUMBER NOT NULL
 ,cantidad NUMBER (10,2) NOT NULL
 ,fecha_pedido DATE NOT NULL
 ,fecha_entrega DATE NOT NULL
 ,estado_id NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER Pedido_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Pedido for each row 
 Declare 
  rec Pedido_JN%ROWTYPE; 
  blank Pedido_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.proveedor_id := :NEW.proveedor_id; 
      rec.material_id := :NEW.material_id; 
      rec.cantidad := :NEW.cantidad; 
      rec.fecha_pedido := :NEW.fecha_pedido; 
      rec.fecha_entrega := :NEW.fecha_entrega; 
      rec.estado_id := :NEW.estado_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.proveedor_id := :OLD.proveedor_id; 
      rec.material_id := :OLD.material_id; 
      rec.cantidad := :OLD.cantidad; 
      rec.fecha_pedido := :OLD.fecha_pedido; 
      rec.fecha_entrega := :OLD.fecha_entrega; 
      rec.estado_id := :OLD.estado_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Pedido_JN VALUES rec; 
  END; 
  /CREATE TABLE proveedor (
    id        NUMBER NOT NULL,
    nombre    VARCHAR2(100) NOT NULL,
    contacto  VARCHAR2(100),
    telefono  VARCHAR2(20),
    email     VARCHAR2(100),
    direccion VARCHAR2(255)
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id );


CREATE TABLE Proveedor_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id NUMBER NOT NULL
 ,nombre VARCHAR2 (100) NOT NULL
 ,contacto VARCHAR2 (100)
 ,telefono VARCHAR2 (20)
 ,email VARCHAR2 (100)
 ,direccion VARCHAR2 (255)
 );

CREATE OR REPLACE TRIGGER Proveedor_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Proveedor for each row 
 Declare 
  rec Proveedor_JN%ROWTYPE; 
  blank Proveedor_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.nombre := :NEW.nombre; 
      rec.contacto := :NEW.contacto; 
      rec.telefono := :NEW.telefono; 
      rec.email := :NEW.email; 
      rec.direccion := :NEW.direccion; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.nombre := :OLD.nombre; 
      rec.contacto := :OLD.contacto; 
      rec.telefono := :OLD.telefono; 
      rec.email := :OLD.email; 
      rec.direccion := :OLD.direccion; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Proveedor_JN VALUES rec; 
  END; 
  /CREATE TABLE reporte (
    id               NUMBER NOT NULL,
    usuario_id       NUMBER NOT NULL,
    tipo_reporte_id  NUMBER NOT NULL,
    fecha_inicio     DATE NOT NULL,
    fecha_fin        DATE NOT NULL,
    fecha_generacion DATE DEFAULT sysdate NOT NULL
);

ALTER TABLE reporte ADD CONSTRAINT reporte_pk PRIMARY KEY ( id );


CREATE TABLE Reporte_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id NUMBER NOT NULL
 ,usuario_id NUMBER NOT NULL
 ,tipo_reporte_id NUMBER NOT NULL
 ,fecha_inicio DATE NOT NULL
 ,fecha_fin DATE NOT NULL
 ,fecha_generacion DATE NOT NULL
 );

CREATE OR REPLACE TRIGGER Reporte_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Reporte for each row 
 Declare 
  rec Reporte_JN%ROWTYPE; 
  blank Reporte_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.usuario_id := :NEW.usuario_id; 
      rec.tipo_reporte_id := :NEW.tipo_reporte_id; 
      rec.fecha_inicio := :NEW.fecha_inicio; 
      rec.fecha_fin := :NEW.fecha_fin; 
      rec.fecha_generacion := :NEW.fecha_generacion; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.usuario_id := :OLD.usuario_id; 
      rec.tipo_reporte_id := :OLD.tipo_reporte_id; 
      rec.fecha_inicio := :OLD.fecha_inicio; 
      rec.fecha_fin := :OLD.fecha_fin; 
      rec.fecha_generacion := :OLD.fecha_generacion; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Reporte_JN VALUES rec; 
  END; 
  /CREATE TABLE ticket (
    id                     NUMBER NOT NULL,
    usuario_id             NUMBER NOT NULL,
    material_solicitado_id NUMBER NOT NULL,
    cantidad               NUMBER NOT NULL,
    estado                 VARCHAR2(20) DEFAULT 'pendiente' NOT NULL,
    fecha_creacion         TIMESTAMP DEFAULT current_timestamp NOT NULL,
    estadoticket_id        NUMBER NOT NULL
);

ALTER TABLE ticket ADD CONSTRAINT ticket_pk PRIMARY KEY ( id );


CREATE TABLE Ticket_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id NUMBER NOT NULL
 ,usuario_id NUMBER NOT NULL
 ,material_solicitado_id NUMBER NOT NULL
 ,cantidad NUMBER NOT NULL
 ,estado VARCHAR2 (20) NOT NULL
 ,fecha_creacion TIMESTAMP NOT NULL
 ,EstadoTicket_id NUMBER NOT NULL
 );

CREATE OR REPLACE TRIGGER Ticket_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON Ticket for each row 
 Declare 
  rec Ticket_JN%ROWTYPE; 
  blank Ticket_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.usuario_id := :NEW.usuario_id; 
      rec.material_solicitado_id := :NEW.material_solicitado_id; 
      rec.cantidad := :NEW.cantidad; 
      rec.estado := :NEW.estado; 
      rec.fecha_creacion := :NEW.fecha_creacion; 
      rec.EstadoTicket_id := :NEW.EstadoTicket_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.usuario_id := :OLD.usuario_id; 
      rec.material_solicitado_id := :OLD.material_solicitado_id; 
      rec.cantidad := :OLD.cantidad; 
      rec.estado := :OLD.estado; 
      rec.fecha_creacion := :OLD.fecha_creacion; 
      rec.EstadoTicket_id := :OLD.EstadoTicket_id; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into Ticket_JN VALUES rec; 
  END; 
  /CREATE TABLE tiporeporte (
    id          NUMBER NOT NULL,
    descripcion VARCHAR2(500) NOT NULL
);

ALTER TABLE tiporeporte ADD CONSTRAINT tiporeporte_pk PRIMARY KEY ( id );


CREATE TABLE TipoReporte_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id NUMBER NOT NULL
 ,descripcion VARCHAR2 (500) NOT NULL
 );

CREATE OR REPLACE TRIGGER TipoReporte_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON TipoReporte for each row 
 Declare 
  rec TipoReporte_JN%ROWTYPE; 
  blank TipoReporte_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.descripcion := :NEW.descripcion; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.descripcion := :OLD.descripcion; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into TipoReporte_JN VALUES rec; 
  END; 
  /CREATE TABLE unidadmedida (
    id            NUMBER NOT NULL,
    unidad_medida VARCHAR2(10) NOT NULL,
    descripcion   VARCHAR2(50)
);

ALTER TABLE unidadmedida ADD CONSTRAINT unidadmedida_pk PRIMARY KEY ( id );

ALTER TABLE unidadmedida ADD CONSTRAINT unique_unidad_descripcion UNIQUE ( unidad_medida,
                                                                           descripcion );


CREATE TABLE UnidadMedida_JN
 (JN_OPERATION CHAR(3) NOT NULL
 ,JN_ORACLE_USER VARCHAR2(30) NOT NULL
 ,JN_DATETIME DATE NOT NULL
 ,JN_NOTES VARCHAR2(240)
 ,JN_APPLN VARCHAR2(35)
 ,JN_SESSION NUMBER(38)
 ,id NUMBER NOT NULL
 ,unidad_medida VARCHAR2 (10) NOT NULL
 ,descripcion VARCHAR2 (50)
 );

CREATE OR REPLACE TRIGGER UnidadMedida_JNtrg
  AFTER 
  INSERT OR 
  UPDATE OR 
  DELETE ON UnidadMedida for each row 
 Declare 
  rec UnidadMedida_JN%ROWTYPE; 
  blank UnidadMedida_JN%ROWTYPE; 
  BEGIN 
    rec := blank; 
    IF INSERTING OR UPDATING THEN 
      rec.id := :NEW.id; 
      rec.unidad_medida := :NEW.unidad_medida; 
      rec.descripcion := :NEW.descripcion; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      IF INSERTING THEN 
        rec.JN_OPERATION := 'INS'; 
      ELSIF UPDATING THEN 
        rec.JN_OPERATION := 'UPD'; 
      END IF; 
    ELSIF DELETING THEN 
      rec.id := :OLD.id; 
      rec.unidad_medida := :OLD.unidad_medida; 
      rec.descripcion := :OLD.descripcion; 
      rec.JN_DATETIME := SYSDATE; 
      rec.JN_ORACLE_USER := SYS_CONTEXT ('USERENV', 'SESSION_USER'); 
      rec.JN_APPLN := SYS_CONTEXT ('USERENV', 'MODULE'); 
      rec.JN_SESSION := SYS_CONTEXT ('USERENV', 'SESSIONID'); 
      rec.JN_OPERATION := 'DEL'; 
    END IF; 
    INSERT into UnidadMedida_JN VALUES rec; 
  END; 
  /ALTER TABLE customuser_role
    ADD CONSTRAINT customuser_role_customuser_fk FOREIGN KEY ( user_id )
        REFERENCES customuser ( id );

ALTER TABLE material
    ADD CONSTRAINT material_unidadmedida_fk FOREIGN KEY ( unidad_medida_id )
        REFERENCES unidadmedida ( id );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_estadopedido_fk FOREIGN KEY ( estado_id )
        REFERENCES estadopedido ( id );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_material_fk FOREIGN KEY ( material_id )
        REFERENCES material ( id );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_proveedor_fk FOREIGN KEY ( proveedor_id )
        REFERENCES proveedor ( id );

ALTER TABLE reporte
    ADD CONSTRAINT reporte_customuser_fk FOREIGN KEY ( usuario_id )
        REFERENCES customuser ( id );

ALTER TABLE reporte
    ADD CONSTRAINT reporte_tiporeporte_fk FOREIGN KEY ( tipo_reporte_id )
        REFERENCES tiporeporte ( id );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_customuser_fk FOREIGN KEY ( usuario_id )
        REFERENCES customuser ( id );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_estadoticket_fk FOREIGN KEY ( estadoticket_id )
        REFERENCES estadoticket ( id );

ALTER TABLE ticket
    ADD CONSTRAINT ticket_material_fk FOREIGN KEY ( material_solicitado_id )
        REFERENCES material ( id );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             0
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
