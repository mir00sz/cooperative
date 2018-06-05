-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-05-31 07:34:33.039

-- tables
-- Table: cost
CREATE TABLE cost (
    id serial  NOT NULL,
    value decimal  NOT NULL,
    cost_type_id int  NOT NULL,
    CONSTRAINT cost_pk PRIMARY KEY (id)
);

-- Table: cost_type
CREATE TABLE cost_type (
    id serial  NOT NULL,
    name varchar(10)  NOT NULL,
    CONSTRAINT cost_type_pk PRIMARY KEY (id)
);

-- Table: flat
CREATE TABLE flat (
    id serial  NOT NULL,
    number int  NOT NULL,
    property_id int  NOT NULL,
    CONSTRAINT flat_pk PRIMARY KEY (id)
);

-- Table: flat_cost
CREATE TABLE flat_cost (
    id serial  NOT NULL,
    cost_id int  NOT NULL,
    flat_id int  NOT NULL,
    CONSTRAINT flat_cost_pk PRIMARY KEY (id)
);

-- Table: flat_tenants
CREATE TABLE flat_tenants (
    id serial  NOT NULL,
    tenant_id int  NOT NULL,
    flat_id int  NOT NULL,
    CONSTRAINT flat_tenants_pk PRIMARY KEY (id)
);

-- Table: property
CREATE TABLE property (
    id serial  NOT NULL,
    street varchar  NOT NULL,
    street_nr int  NOT NULL,
    city varchar  NOT NULL,
    post_code varchar  NOT NULL,
    occupants_number int  NOT NULL,
    CONSTRAINT property_pk PRIMARY KEY (id)
);

-- Table: property_cost
CREATE TABLE property_cost (
    id serial  NOT NULL,
    cost_id int  NOT NULL,
    property_id int  NOT NULL,
    CONSTRAINT property_cost_pk PRIMARY KEY (id)
);

-- Table: tenant
CREATE TABLE tenant (
    id serial  NOT NULL,
    name varchar  NOT NULL,
    surname varchar  NOT NULL,
    id_num bigint  NOT NULL,
    CONSTRAINT tenant_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: building_cost_cost (table: property_cost)
ALTER TABLE property_cost ADD CONSTRAINT building_cost_cost
    FOREIGN KEY (cost_id)
    REFERENCES cost (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: building_cost_property (table: property_cost)
ALTER TABLE property_cost ADD CONSTRAINT building_cost_property
    FOREIGN KEY (property_id)
    REFERENCES property (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: cost_cost_type (table: cost)
ALTER TABLE cost ADD CONSTRAINT cost_cost_type
    FOREIGN KEY (cost_type_id)
    REFERENCES cost_type (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: flat_cost_cost (table: flat_cost)
ALTER TABLE flat_cost ADD CONSTRAINT flat_cost_cost
    FOREIGN KEY (cost_id)
    REFERENCES cost (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: flat_cost_flat (table: flat_cost)
ALTER TABLE flat_cost ADD CONSTRAINT flat_cost_flat
    FOREIGN KEY (flat_id)
    REFERENCES flat (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: flat_property (table: flat)
ALTER TABLE flat ADD CONSTRAINT flat_property
    FOREIGN KEY (property_id)
    REFERENCES property (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: flat_tenants_flat (table: flat_tenants)
ALTER TABLE flat_tenants ADD CONSTRAINT flat_tenants_flat
    FOREIGN KEY (flat_id)
    REFERENCES flat (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- Reference: flat_tenants_tenant (table: flat_tenants)
ALTER TABLE flat_tenants ADD CONSTRAINT flat_tenants_tenant
    FOREIGN KEY (tenant_id)
    REFERENCES tenant (id)
    NOT DEFERRABLE
    INITIALLY IMMEDIATE
;

-- End of file.
