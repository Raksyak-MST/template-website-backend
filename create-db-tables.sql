CREATE DATABASE IF NOT EXISTS hotel_cms;
USE hotel_cms;

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
  FOREIGN KEY (template_id) REFERENCES Templates(id) ON DELETE CASCADE
);

CREATE TABLE HotelSections (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_template_id INT NOT NULL,
  template_section_id INT NOT NULL,
  is_active BOOLEAN DEFAULT TRUE,
  FOREIGN KEY (hotel_template_id) REFERENCES HotelTemplates(id) ON DELETE CASCADE,
  FOREIGN KEY (template_section_id) REFERENCES TemplateSections(id) ON DELETE CASCADE
);

CREATE TABLE HotelSectionHeadings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_id INT NOT NULL,
  hotel_section_id INT NOT NULL,
  heading_text VARCHAR(255),
  order_index INT,
  FOREIGN KEY (hotel_id) REFERENCES Hotels(id) ON DELETE CASCADE,
  FOREIGN KEY (hotel_section_id) REFERENCES HotelSections(id) ON DELETE CASCADE
);

CREATE TABLE HotelSectionDescriptions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_id INT NOT NULL,
  hotel_section_id INT NOT NULL,
  description_text TEXT,
  order_index INT,
  FOREIGN KEY (hotel_id) REFERENCES Hotels(id) ON DELETE CASCADE,
  FOREIGN KEY (hotel_section_id) REFERENCES HotelSections(id) ON DELETE CASCADE
);

CREATE TABLE HotelSectionImages (
  id INT AUTO_INCREMENT PRIMARY KEY,
  hotel_id INT NOT NULL,
  hotel_section_id INT NOT NULL,
  image_url VARCHAR(255),
  order_index INT,
  FOREIGN KEY (hotel_id) REFERENCES Hotels(id) ON DELETE CASCADE,
  FOREIGN KEY (hotel_section_id) REFERENCES HotelSections(id) ON DELETE CASCADE
);
