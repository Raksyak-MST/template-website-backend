CREATE DATABASE IF NOT EXISTS hotel_system;
USE hotel_system;

CREATE TABLE Templates (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE TemplatePages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  page_name VARCHAR(100) NOT NULL,
  template_id INT NOT NULL,
  FOREIGN KEY (template_id) REFERENCES Templates(id) ON DELETE CASCADE
);

CREATE TABLE TemplateSections (
  id INT AUTO_INCREMENT PRIMARY KEY,
  template_id INT NOT NULL,
  section_name VARCHAR(50) NOT NULL,
  type VARCHAR(50),
  is_optional BOOLEAN DEFAULT FALSE,
  FOREIGN KEY (template_id) REFERENCES Templates(id) ON DELETE CASCADE
);

CREATE TABLE Hotels (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  owner_id INT,
  current_template_id INT,
  address VARCHAR(200),
  phone VARCHAR(10),
  email VARCHAR(100),
  domain_name VARCHAR(100),
  check_in VARCHAR(20),
  check_out VARCHAR(20),
  opening VARCHAR(50),
  closing VARCHAR(50),
  FOREIGN KEY (current_template_id) REFERENCES Templates(id) ON DELETE SET NULL
);

CREATE TABLE HotelTemplates (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_id INT NOT NULL,
  template_id INT NOT NULL,
  activated_on DATE,
  FOREIGN KEY (hotel_id) REFERENCES Hotels(id) ON DELETE CASCADE,
  FOREIGN KEY (template_id) REFERENCES Templates(id) ON DELETE CASCADE,
  UNIQUE (hotel_id, template_id)
);

CREATE TABLE HotelPages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_id INT NOT NULL,
  template_page_id INT NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (hotel_id) REFERENCES Hotels(id) ON DELETE CASCADE,
  FOREIGN KEY (template_page_id) REFERENCES TemplatePages(id) ON DELETE CASCADE,
  UNIQUE (hotel_id, template_page_id)
);

CREATE TABLE HotelSections (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_page_id INT NOT NULL,
  template_section_id INT NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (hotel_page_id) REFERENCES HotelPages(id) ON DELETE CASCADE,
  FOREIGN KEY (template_section_id) REFERENCES TemplateSections(id) ON DELETE CASCADE,
  UNIQUE (hotel_page_id, template_section_id)
);

CREATE TABLE HotelSectionHeadings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_section_id INT NOT NULL,
  heading_text VARCHAR(255),
  order_index INT,
  FOREIGN KEY (hotel_section_id) REFERENCES HotelSections(id) ON DELETE CASCADE
);

CREATE TABLE HotelSectionDescriptions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_section_id INT NOT NULL,
  description_text TEXT,
  order_index INT,
  FOREIGN KEY (hotel_section_id) REFERENCES HotelSections(id) ON DELETE CASCADE
);

CREATE TABLE HotelSectionImages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_section_id INT NOT NULL,
  image_url VARCHAR(255),
  order_index INT,
  FOREIGN KEY (hotel_section_id) REFERENCES HotelSections(id) ON DELETE CASCADE
);

-- ### Views ## --

-- View hotel with template
CREATE OR REPLACE VIEW HotelTemplateView AS
SELECT
  h.id AS hotel_id,
  h.name AS hotel_name,
  t.id AS template_id,
  t.name AS template_name,
  ht.activated_on
FROM Hotels h
JOIN HotelTemplates ht
  ON ht.hotel_id = h.id
JOIN Templates t
  ON t.id = ht.template_id;

-- View all the pages with hotel name
CREATE OR REPLACE VIEW HotelPagesView AS
SELECT
  h.id AS hotel_id,
  h.name AS hotel_name,
  hp.id AS hotel_page_id,
  tp.id AS template_page_id,
  tp.page_name
FROM HotelPages hp
JOIN Hotels h
  ON h.id = hp.hotel_id
JOIN TemplatePages tp
  ON tp.id = hp.template_page_id;

-- View all headings along with section name
CREATE OR REPLACE VIEW HotelSectionHeadingsView AS
SELECT
  hsh.id AS heading_id,
  h.name AS hotel_name,
  tp.page_name,
  ts.section_name,
  hsh.heading_text,
  hsh.order_index
FROM HotelSectionHeadings hsh
JOIN HotelSections hs
  ON hs.id = hsh.hotel_section_id
JOIN TemplateSections ts
  ON ts.id = hs.template_section_id
JOIN HotelPages hp
  ON hp.id = hs.hotel_page_id
JOIN Hotels h
  ON h.id = hp.hotel_id
JOIN TemplatePages tp
  ON tp.id = hp.template_page_id
ORDER BY h.name, tp.page_name, ts.section_name, hsh.order_index;

-- View all the image along with section name
CREATE OR REPLACE VIEW HotelSectionImagesView AS
SELECT
  hsi.id AS image_id,
  h.name AS hotel_name,
  tp.page_name,
  ts.section_name,
  hsi.image_url,
  hsi.order_index
FROM HotelSectionImages hsi
JOIN HotelSections hs
  ON hs.id = hsi.hotel_section_id
JOIN TemplateSections ts
  ON ts.id = hs.template_section_id
JOIN HotelPages hp
  ON hp.id = hs.hotel_page_id
JOIN Hotels h
  ON h.id = hp.hotel_id
JOIN TemplatePages tp
  ON tp.id = hp.template_page_id
ORDER BY h.name, tp.page_name, ts.section_name, hsi.order_index, hsi.id;



-- View all description along with section name
CREATE OR REPLACE VIEW HotelSectionDescriptionsView AS
SELECT
  hsd.id AS description_id,
  h.name AS hotel_name,
  tp.page_name,
  ts.section_name,
  hsd.description_text,
  hsd.order_index
FROM HotelSectionDescriptions hsd
JOIN HotelSections hs
  ON hs.id = hsd.hotel_section_id
JOIN TemplateSections ts
  ON ts.id = hs.template_section_id
JOIN HotelPages hp
  ON hp.id = hs.hotel_page_id
JOIN Hotels h
  ON h.id = hp.hotel_id
JOIN TemplatePages tp
  ON tp.id = hp.template_page_id
ORDER BY h.name, tp.page_name, ts.section_name, hsd.order_index, hsd.id;
