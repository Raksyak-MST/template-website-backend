SELECT  h.id AS hotel_id, h.name AS hotel_name, h.domain AS hotel_domain, t.id AS template_id, t.name AS template_name, t.description AS template_description, tp.id AS page_id, tp.name AS page_name, tp.slug AS page_slug, tp.order_index AS page_order, ts.id AS section_id, ts.section AS section_name, ts.order_index AS section_order, c.id AS content_id, c.title AS content_title, c.description AS content_description, c.order_index AS content_order, m.id AS media_id, m.url AS media_url, m.alt_text AS media_alt_text, m.media_type AS media_type, m.order_index AS media_order FROM hotels h JOIN templates t  ON h.template_id = t.id JOIN template_pages tp  ON t.id = tp.template_id JOIN template_sections ts  ON tp.id = ts.template_page_id LEFT JOIN contents c  ON ts.id = c.template_section_id  AND c.hotel_id = h.id LEFT JOIN media_content m  ON ts.id = m.template_section_id  AND m.hotel_id = h.id WHERE h.id = 1  ORDER BY tp.order_index, ts.order_index, c.order_index, m.order_index;

```
CREATE TABLE hotels (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    domain VARCHAR(255) UNIQUE,
    template_id INT NOT NULL,
    FOREIGN KEY (template_id) REFERENCES templates(id)
);

-- Templates
CREATE TABLE templates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

-- Pages in a template
CREATE TABLE template_pages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    template_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL,
    order_index INT DEFAULT 0,
    FOREIGN KEY (template_id) REFERENCES templates(id)
);

-- Sections inside a page
CREATE TABLE template_sections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    template_page_id INT NOT NULL,
    section VARCHAR(255) NOT NULL,
    order_index INT DEFAULT 0,
    FOREIGN KEY (template_page_id) REFERENCES template_pages(id)
);

-- Textual content per section
CREATE TABLE contents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    template_section_id INT NOT NULL,
    hotel_id INT NOT NULL,
    title VARCHAR(255),
    description TEXT,
    order_index INT DEFAULT 0,
    FOREIGN KEY (template_section_id) REFERENCES template_sections(id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

-- Media content per section (images, videos, audio)
CREATE TABLE media_content (
    id INT AUTO_INCREMENT PRIMARY KEY,
    template_section_id INT NOT NULL,
    hotel_id INT NOT NULL,
    url VARCHAR(500) NOT NULL,
    alt_text VARCHAR(255),
    media_type ENUM('image', 'video', 'audio') DEFAULT 'image',
    order_index INT DEFAULT 0,
    FOREIGN KEY (template_section_id) REFERENCES template_sections(id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);
```
