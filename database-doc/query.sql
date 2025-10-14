SELECT tp.page_name, hp.id AS hotel_page_id, hs.id AS hotel_section_id, ts.section_name, hsh.heading_text, hsd.description_text, hsi.image_url FROM Hotels h JOIN HotelTemplates ht ON ht.hotel_id = h.id JOIN HotelPages hp ON hp.hotel_id = h.id JOIN TemplatePages tp ON tp.id = hp.template_page_id JOIN HotelSections hs ON hs.hotel_page_id = hp.id JOIN TemplateSections ts ON ts.id = hs.template_section_id LEFT JOIN HotelSectionHeadings hsh ON hsh.hotel_section_id = hs.id LEFT JOIN HotelSectionDescriptions hsd ON hsd.hotel_section_id = hs.id LEFT JOIN HotelSectionImages hsi ON hsi.hotel_section_id = hs.id WHERE h.id = 1 AND tp.page_name = 'hero' AND ht.template_id = 1;


SELECT tp.page_name, hp.id AS hotel_page_id, hs.id AS hotel_section_id, ts.section_name, GROUP_CONCAT(DISTINCT hsh.heading_text ORDER BY hsh.id) AS headings, GROUP_CONCAT(DISTINCT hsd.description_text ORDER BY hsd.id) AS descriptions, GROUP_CONCAT(DISTINCT hsi.image_url ORDER BY hsi.id) AS images FROM Hotels h JOIN HotelPages hp ON hp.hotel_id = h.id JOIN TemplatePages tp ON tp.id = hp.template_page_id JOIN HotelSections hs ON hs.hotel_page_id = hp.id JOIN TemplateSections ts ON ts.id = hs.template_section_id LEFT JOIN HotelSectionHeadings hsh ON hsh.hotel_section_id = hs.id LEFT JOIN HotelSectionDescriptions hsd ON hsd.hotel_section_id = hs.id LEFT JOIN HotelSectionImages hsi ON hsi.hotel_section_id = hs.id WHERE h.id = 1 AND tp.page_name = 'hero' GROUP BY hs.id, tp.page_name, hp.id, ts.section_name ORDER BY hs.id;

SELECT
  hs.id AS hotel_section_id,
  ts.section_name,
  hsh.heading_text,
  hsd.description_text,
  hsi.image_url
FROM HotelPages hp
JOIN HotelSections hs
  ON hs.hotel_page_id = hp.id
JOIN TemplateSections ts
  ON ts.id = hs.template_section_id
LEFT JOIN HotelSectionHeadings hsh
  ON hsh.hotel_section_id = hs.id
LEFT JOIN HotelSectionDescriptions hsd
  ON hsd.hotel_section_id = hs.id
LEFT JOIN HotelSectionImages hsi
  ON hsi.hotel_section_id = hs.id
WHERE hp.hotel_id = 3 
  AND hp.id = 1 
ORDER BY hs.id, hsh.id, hsd.id, hsi.id;

-- Get the View table names for the current database
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = DATABASE();

-- Get All headings by hotel section id
SELECT heading_text
FROM HotelSectionHeadings
WHERE hotel_section_id = 1
ORDER BY order_index, id;

-- Get All sections of a hotel
SELECT
  hp.id AS hotel_page_id,
  tp.page_name,
  hs.id AS hotel_section_id,
  ts.section_name,
  hs.is_active
FROM HotelPages hp
JOIN HotelSections hs
  ON hs.hotel_page_id = hp.id
JOIN TemplateSections ts
  ON ts.id = hs.template_section_id
JOIN TemplatePages tp
  ON tp.id = hp.template_page_id
WHERE hp.hotel_id = 1 
ORDER BY hp.id, hs.id;

-- Get Images of a sections for a hotel
SELECT
  hp.id AS hotel_page_id,
  tp.page_name,
  hs.id AS hotel_section_id,
  ts.section_name,
  hsi.image_url,
  hsi.order_index
FROM HotelPages hp
JOIN HotelSections hs
  ON hs.hotel_page_id = hp.id
JOIN TemplateSections ts
  ON ts.id = hs.template_section_id
JOIN TemplatePages tp
  ON tp.id = hp.template_page_id
LEFT JOIN HotelSectionImages hsi
  ON hsi.hotel_section_id = hs.id
WHERE hp.hotel_id = 1 
ORDER BY hs.id, hsi.order_index, hsi.id;

-- Get all descriptions of a section
SELECT description_text

FROM HotelSectionDescriptions
WHERE hotel_section_id = 1 

ORDER BY order_index, id;

-- Get all headings of section of a page
SELECT
  tp.page_name,
  ts.section_name,
  hsh.heading_text,
  hsh.order_index
FROM Hotels h
JOIN HotelPages hp
  ON hp.hotel_id = h.id
JOIN TemplatePages tp
  ON tp.id = hp.template_page_id
JOIN HotelSections hs
  ON hs.hotel_page_id = hp.id
JOIN TemplateSections ts
  ON ts.id = hs.template_section_id
LEFT JOIN HotelSectionHeadings hsh
  ON hsh.hotel_section_id = hs.id
WHERE h.id = 1 
  AND tp.page_name = 'Amenities'
ORDER BY hs.id, hsh.order_index, hsh.id;

-- Get all description of a section of a page
SELECT
  tp.page_name,
  ts.section_name,
  hsd.description_text,
  hsd.order_index
FROM Hotels h
JOIN HotelPages hp
  ON hp.hotel_id = h.id
JOIN TemplatePages tp
  ON tp.id = hp.template_page_id
JOIN HotelSections hs
  ON hs.hotel_page_id = hp.id
JOIN TemplateSections ts
  ON ts.id = hs.template_section_id
LEFT JOIN HotelSectionDescriptions hsd
  ON hsd.hotel_section_id = hs.id
WHERE h.id = 1 
  AND tp.page_name = 'Amenities'
ORDER BY hs.id, hsd.order_index, hsd.id;

-- Get all images of sections for a page
SELECT
  tp.page_name,
  ts.section_name,
  hsi.image_url,
  hsi.order_index
FROM Hotels h
JOIN HotelPages hp
  ON hp.hotel_id = h.id
JOIN TemplatePages tp
  ON tp.id = hp.template_page_id
JOIN HotelSections hs
  ON hs.hotel_page_id = hp.id
JOIN TemplateSections ts
  ON ts.id = hs.template_section_id
LEFT JOIN HotelSectionImages hsi
  ON hsi.hotel_section_id = hs.id
WHERE h.id = 1
  AND tp.page_name = 'Amenities'
ORDER BY hs.id, hsi.order_index, hsi.id;

-- Get combined query skeleton
SELECT *
FROM Hotels h
JOIN HotelTemplates ht ON ht.hotel_id = h.id
JOIN Templates t ON t.id = ht.template_id
JOIN HotelPages hp ON hp.hotel_id = h.id
JOIN TemplatePages tp ON tp.id = hp.template_page_id
JOIN HotelSections hs ON hs.hotel_page_id = hp.id
JOIN TemplateSections ts ON ts.id = hs.template_section_id
LEFT JOIN HotelSectionHeadings hsh ON hsh.hotel_section_id = hs.id
LEFT JOIN HotelSectionDescriptions hsd ON hsd.hotel_section_id = hs.id
LEFT JOIN HotelSectionImages hsi ON hsi.hotel_section_id = hs.id
WHERE h.id = 1 
  AND tp.page_name = 'Hero'
ORDER BY hs.id, hsh.order_index, hsd.order_index, hsi.order_index;


