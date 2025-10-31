const express = require("express"); // Import Express framework
const mysql = require("mysql2"); // Import MySQL client
const cors = require("cors"); // Import CORS middleware
require("dotenv").config({ path: ".env" });
require("dotenv").config({ path: ".env.local", override: true }); // .env.local overrides global .env

const app = express(); // Initialize Express app
const DEFAULT_PORT = 3000; // Default server port
const allowedOrigin = (process.env.CORS_ORIGINS ?? "").split(","); // Allowed origins for CORS
const port = process.env.PORT ?? DEFAULT_PORT; // Use environment port if available

// ------------------------ MIDDLEWARE ------------------------
// CORS configuration to allow requests from specific origins
app.use(
  cors({
    origin(origin, callback) {
      if (!origin || allowedOrigin.includes(origin)) callback(null, true);
      else callback(new Error("Not allowed by CORS"));
    },
  })
);

// Parse incoming JSON requests
app.use(express.json());
// Parse URL-encoded data
app.use(express.urlencoded({ extended: true }));

// ------------------------ MYSQL CONFIG ------------------------
const connection = mysql.createConnection({
  host: process.env.DB_HOST, // Database host
  user: process.env.DB_USER, // Database username
  password: process.env.DB_PASSWORD, // Database password
  database: process.env.DB_DATABASE, // Database name
});

// ------------------------ HEALTH CHECK ------------------------
app.get("/health", (req, res) => {
  // Simple endpoint to check if server is running
  res.status(200).json({ status: "OK", message: "Server is alive!" });
});

// -----------------------------------------------------------------------------
// 1️⃣ HOTELS APIs
// -----------------------------------------------------------------------------

// GET all hotels
app.get("/api/hotels", async (req, res) => {
  try {
    const hotels = await getHotels();
    res.status(200).json(hotels);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch hotels", reason: error });
  }
});

// GET a single hotel by ID
app.get("/api/hotels/:id", async (req, res) => {
  try {
    const hotel = await getHotel(req.params.id);
    res.status(200).json(hotel);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch hotel", reason: error });
  }
});

// CREATE a new hotel
app.post("/api/hotels", async (req, res) => {
  try {
    const result = await createHotel(req.body);
    res.status(201).json({ message: "Hotel created successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to create hotel", reason: error });
  }
});

// UPDATE hotel by ID
app.put("/api/hotels/:id", async (req, res) => {
  try {
    const result = await updateHotel(req.params.id, req.body);
    res.status(200).json({ message: "Hotel updated successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to update hotel", reason: error });
  }
});

// DELETE hotel by ID
app.delete("/api/hotels/:id", async (req, res) => {
  try {
    const result = await deleteHotel(req.params.id);
    res.status(200).json({ message: "Hotel deleted successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to delete hotel", reason: error });
  }
});

// -----------------------------------------------------------------------------
// 2️⃣ TEMPLATES APIs
// -----------------------------------------------------------------------------

// GET all templates
app.get("/api/templates", async (req, res) => {
  try {
    const templates = await getTemplates();
    res.status(200).json(templates);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch templates", reason: error });
  }
});

// GET single template by ID
app.get("/api/templates/:id", async (req, res) => {
  try {
    const template = await getTemplate(req.params.id);
    res.status(200).json(template);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch template", reason: error });
  }
});

// CREATE a new template
// app.post("/api/templates", async (req, res) => {
//   try {
//     const result = await createTemplate(req.body);
//     res.status(201).json({ message: "Template created successfully", result });
//   } catch (error) {
//     res.status(500).json({ error: "Failed to create template", reason: error });
//   }
// });

// UPDATE template by ID
app.put("/api/templates/:id", async (req, res) => {
  try {
    const result = await updateTemplate(req.params.id, req.body);
    res.status(200).json({ message: "Template updated successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to update template", reason: error });
  }
});

// DELETE template by ID
app.delete("/api/templates/:id", async (req, res) => {
  try {
    const result = await deleteTemplate(req.params.id);
    res.status(200).json({ message: "Template deleted successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to delete template", reason: error });
  }
});

// -----------------------------------------------------------------------------
// 3️⃣ PAGES APIs
// -----------------------------------------------------------------------------

// GET all pages for a hotel
app.get("/api/hotels/:hotelId/pages", async (req, res) => {
  try {
    const pages = await getPages(req.params.hotelId);
    res.status(200).json(pages);
  } catch (error) {
    res
      .status(500)
      .json({ error: "Failed to fetch hotel pages", reason: error });
  }
});

// GET specific page details by hotelId and pagename
app.get("/api/hotels/:hotelId/pages/:pagename", async (req, res) => {
  try {
    const { hotelId, pagename } = req.params;
    const { sections, include } = req.query; // optional filters
    const data = await getHotelPageDetails(
      hotelId,
      pagename,
      sections,
      include
    );
    res.status(200).json(data);
  } catch (error) {
    res
      .status(500)
      .json({ error: "Failed to fetch page details", reason: error });
  }
});

// -----------------------------------------------------------------------------
// 4️⃣ SECTIONS, HEADINGS, DESCRIPTIONS, IMAGES, FOOTER APIs
// -----------------------------------------------------------------------------

// GET all sections for a hotel
app.get("/api/hotels/:hotelId/sections", async (req, res) => {
  try {
    const sections = await getSections(req.params.hotelId);
    res.status(200).json(sections);
  } catch (error) {
    res.status(500).json({
      error: "Failed to fetch sections",
      reason: error,
    });
  }
});

// GET all headings for a hotel
app.get("/api/hotels/:hotelId/headings", async (req, res) => {
  try {
    const headings = await getHeadings(req.params.hotelId);
    res.status(200).json(headings);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch headings", reason: error });
  }
});

// GET all descriptions for a hotel
app.get("/api/hotels/:hotelId/descriptions", async (req, res) => {
  try {
    const desc = await getDescriptions(req.params.hotelId);
    res.status(200).json(desc);
  } catch (error) {
    res
      .status(500)
      .json({ error: "Failed to fetch descriptions", reason: error });
  }
});

// GET all images for a hotel
app.get("/api/hotels/:hotelId/images", async (req, res) => {
  try {
    const images = await getImages(req.params.hotelId);
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch images", reason: error });
  }
});

// GET footer section for a hotel
app.get("/api/hotels/:hotelId/footer", async (req, res) => {
  try {
    const footer = await getFooter(req.params.hotelId);
    res.status(200).json(footer);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch footer", reason: error });
  }
});

// -----------------------------------------------------------------------------
// 5️⃣ HOTEL TEMPLATES APIs
// -----------------------------------------------------------------------------

// GET all templates assigned to a hotel
app.get("/api/hotels/:hotelId/templates", async (req, res) => {
  try {
    const { hotelId } = req.params;
    const templates = await getHotelTemplates(hotelId);
    res.status(200).json({ hotelId, templates });
  } catch (error) {
    res
      .status(500)
      .json({ error: "Failed to fetch hotel templates", reason: error });
  }
});

// ASSIGN a template to a hotel
app.post("/api/hotels/:hotelId/templates", async (req, res) => {
  try {
    const { hotelId } = req.params;
    const { template_id } = req.body;
    const result = await assignTemplateToHotel(hotelId, template_id);
    res.status(201).json({ message: "Template assigned successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to assign template", reason: error });
  }
});

// REMOVE a template from a hotel
app.delete("/api/hotels/:hotelId/templates/:templateId", async (req, res) => {
  try {
    const { hotelId, templateId } = req.params;
    const result = await removeTemplateFromHotel(hotelId, templateId);
    res.status(200).json({ message: "Template removed successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to remove template", reason: error });
  }
});

// -------------------- Create Template --------------------
app.post("/api/templates", async (req, res) => {
  try {
    const { name } = req.body;
    if (!name)
      return res.status(400).json({ error: "Template name is required" });

    const result = await createTemplate({ name });
    res.status(201).json({
      message: "Template created successfully",
      id: result.insertId,
    });
  } catch (error) {
    res.status(500).json({ error: "Failed to create template", reason: error });
  }
});

// -------------------- Create Template Page --------------------
app.post("/api/template-pages", async (req, res) => {
  try {
    const { template_id, page_name } = req.body;
    if (!template_id || !page_name)
      return res
        .status(400)
        .json({ error: "template_id and page_name are required" });

    const result = await createTemplatePage({ template_id, page_name });
    res.status(201).json({
      message: "Template page created successfully",
      id: result.insertId,
    });
  } catch (error) {
    res
      .status(500)
      .json({ error: "Failed to create template page", reason: error });
  }
});

// -------------------- Create Template Section --------------------
app.post("/api/template-sections", async (req, res) => {
  try {
    const { template_id, section_name, type, is_optional } = req.body;
    if (!template_id || !section_name)
      return res
        .status(400)
        .json({ error: "template_id and section_name are required" });

    const result = await createTemplateSection({
      template_id,
      section_name,
      type,
      is_optional,
    });
    res.status(201).json({
      message: "Template section created successfully",
      id: result.insertId,
    });
  } catch (error) {
    res
      .status(500)
      .json({ error: "Failed to create template section", reason: error });
  }
});

// -------------------- Assign Template Section to Hotel Page --------------------
app.post("/api/hotel-sections", async (req, res) => {
  try {
    const { hotel_page_id, template_section_id } = req.body;
    if (!hotel_page_id || !template_section_id) {
      return res.status(400).json({
        error: "hotel_page_id and template_section_id are required",
      });
    }

    const result = await createHotelSection({
      hotel_page_id,
      template_section_id,
    });

    res.status(201).json({
      message: "Template section assigned to hotel page successfully",
      id: result.insertId,
    });
  } catch (error) {
    res.status(500).json({
      error: "Failed to assign template section to hotel page",
      reason: error.message,
    });
  }
});

// -------------------- Add Section Headings --------------------
app.post("/api/hotel-section-headings", async (req, res) => {
  try {
    const result = await addHotelSectionHeadings(req.body);
    res.status(200).json({
      success: true,
      message: "Heading(s) added successfully",
      result,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({
      success: false,
      message: "Error adding heading(s)",
      error: err.message,
    });
  }
});

// -------------------- Add Section Descriptions --------------------
app.post("/api/hotel-section-descriptions", async (req, res) => {
  try {
    const { hotel_section_id, description_text } = req.body;

    if (!hotel_section_id || !description_text) {
      return res.status(400).json({
        error: "hotel_section_id and description_text are required",
      });
    }

    const result = await addHotelSectionDescriptions({
      hotel_section_id,
      description_text,
    });

    res.status(201).json({
      message: "Description(s) added successfully",
      affectedRows: result.affectedRows,
    });
  } catch (error) {
    res.status(500).json({
      error: "Failed to add description(s)",
      reason: error.message,
    });
  }
});

// -------------------- Add Section Images --------------------
app.post("/api/hotel-section-images", async (req, res) => {
  try {
    const { hotel_section_id, image_url, image_urls } = req.body;

    // Validate hotel_section_id
    if (!hotel_section_id)
      return res.status(400).json({ error: "hotel_section_id is required" });

    // Case 1️⃣ — Add multiple images
    if (Array.isArray(image_urls) && image_urls.length > 0) {
      const values = image_urls.map((url) => [hotel_section_id, url]);
      const result = await query(
        "INSERT INTO HotelSectionImages (hotel_section_id, image_url) VALUES ?",
        [values]
      );

      return res.status(201).json({
        message: "Images added successfully",
        insertedCount: result.affectedRows,
      });
    }

    // Case 2️⃣ — Add single image
    if (!image_url)
      return res
        .status(400)
        .json({ error: "image_url or image_urls are required" });

    const result = await addHotelSectionImages({
      hotel_section_id,
      image_url,
    });

    res.status(201).json({
      message: "Image added successfully",
      id: result.insertId,
    });
  } catch (error) {
    res.status(500).json({
      error: "Failed to add image(s)",
      reason: error.message,
    });
  }
});

// -------------------- Update Section Headings API --------------------
app.put("/api/hotel-section-headings", async (req, res) => {
  try {
    const { hotel_section_id, headings } = req.body;

    if (!hotel_section_id || !Array.isArray(headings)) {
      return res
        .status(400)
        .json({ error: "hotel_section_id and headings array are required" });
    }

    const results = await updateHotelSectionHeadings({
      hotel_section_id,
      headings,
    });

    res.status(200).json({
      message: "Heading(s) updated successfully",
      updatedCount: results.length,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      error: "Failed to update heading(s)",
      reason: error.message,
    });
  }
});

// -------------------- Update Section Descriptions API --------------------
app.put("/api/hotel-section-descriptions", async (req, res) => {
  try {
    const { hotel_section_id, descriptions } = req.body;

    if (!hotel_section_id || !Array.isArray(descriptions)) {
      return res.status(400).json({
        error: "hotel_section_id and descriptions array are required",
      });
    }

    const results = await updateHotelSectionDescriptions({
      hotel_section_id,
      descriptions,
    });

    res.status(200).json({
      message: "Description(s) updated successfully",
      updatedCount: results.length,
    });
  } catch (error) {
    res.status(500).json({
      error: "Failed to update description(s)",
      reason: error.message,
    });
  }
});

// -------------------- Update Section Images API --------------------
app.put("/api/hotel-section-images", async (req, res) => {
  try {
    const { hotel_section_id, images } = req.body;

    if (!hotel_section_id || !Array.isArray(images)) {
      return res
        .status(400)
        .json({ error: "hotel_section_id and images array are required" });
    }

    const results = await updateHotelSectionImages({
      hotel_section_id,
      images,
    });

    res.status(200).json({
      message: "Image(s) updated successfully",
      updatedCount: results.length,
    });
  } catch (error) {
    res.status(500).json({
      error: "Failed to update image(s)",
      reason: error.message,
    });
  }
});

// -------------------- Get All Template Sections --------------------
app.get("/api/templates/:templateId/sections", async (req, res) => {
  try {
    const template_id = req.params.templateId;

    const sections = await getAllTemplateSections(template_id);

    res.status(200).json({
      message: "Template sections fetched successfully",
      count: sections.length,
      sections,
    });
  } catch (error) {
    console.error("Error fetching template sections:", error);
    res.status(500).json({
      error: "Failed to fetch template sections",
      reason: error.message,
    });
  }
});

// ------------------------ HELPER FUNCTIONS ------------------------

// Generic query wrapper to support async/await
const query = (sql, params = []) =>
  new Promise((resolve, reject) => {
    connection.query(sql, params, (err, results) => {
      if (err) reject(err);
      else resolve(results);
    });
  });

// ------------------------ HOTELS ------------------------
const getHotels = () => query("SELECT * FROM Hotels");
const getHotel = (id) => query("SELECT * FROM Hotels WHERE id = ?", [id]);
const createHotel = (data) => query("INSERT INTO Hotels SET ?", data);
const updateHotel = (id, data) =>
  query("UPDATE Hotels SET ? WHERE id = ?", [data, id]);
const deleteHotel = (id) => query("DELETE FROM Hotels WHERE id = ?", [id]);

// ------------------------ TEMPLATES ------------------------
const getTemplates = () => query("SELECT * FROM Templates");
const getTemplate = (id) => query("SELECT * FROM Templates WHERE id = ?", [id]);
//const createTemplate = (data) => query("INSERT INTO Templates SET ?", data);
const updateTemplate = (id, data) =>
  query("UPDATE Templates SET ? WHERE id = ?", [data, id]);
const deleteTemplate = (id) =>
  query("DELETE FROM Templates WHERE id = ?", [id]);

// ------------------------ PAGES & SECTIONS ------------------------
const getPages = (hotelId) =>
  query(
    `
    SELECT 
      hp.id AS hotel_page_id,
      hp.hotel_id,
      hp.template_page_id,
      tp.page_name,
      tp.template_id,
      h.name AS hotel_name
    FROM HotelPages AS hp
    JOIN Hotels AS h 
      ON h.id = hp.hotel_id
    JOIN TemplatePages AS tp 
      ON tp.id = hp.template_page_id
    WHERE h.id = ? AND h.current_template_id = tp.template_id
    ORDER BY hp.id ASC;
  `,
    [hotelId]
  );

const getSections = (hotelId) =>
  query(
    `SELECT 
  ts.section_name,
  h.id AS hotel_id,
  hs.id AS hotel_section_id,
  tp.page_name
FROM HotelSections AS hs
JOIN HotelPages AS hp
  ON hp.id = hs.hotel_page_id
JOIN TemplatePages AS tp
  ON tp.id = hp.template_page_id
JOIN TemplateSections AS ts
  ON ts.id = hs.template_section_id
JOIN Hotels AS h
  ON h.id = hp.hotel_id
WHERE h.id = ?
ORDER BY hs.id;`,
    [hotelId]
  );

// ------------------------ HEADINGS, DESCRIPTIONS, IMAGES, FOOTER ------------------------
const getHeadings = (hotelId) =>
  query(
    `SELECT hsh.*
     FROM HotelSectionHeadings hsh
     JOIN HotelSections hs ON hs.id = hsh.hotel_section_id
     JOIN HotelPages hp ON hp.id = hs.hotel_page_id
     JOIN Hotels h ON h.id = hp.hotel_id
     WHERE h.id = ?
     ORDER BY hs.id`,
    [hotelId]
  );

const getDescriptions = (hotelId) =>
  query(
    `SELECT hsd.*
     FROM HotelSectionDescriptions hsd
     JOIN HotelSections hs ON hs.id = hsd.hotel_section_id
     JOIN HotelPages hp ON hp.id = hs.hotel_page_id
     JOIN Hotels h ON h.id = hp.hotel_id
     WHERE h.id = ?
     ORDER BY hs.id`,
    [hotelId]
  );

const getImages = (hotelId) =>
  query(
    `SELECT hsi.*
     FROM HotelSectionImages hsi
     JOIN HotelSections hs ON hs.id = hsi.hotel_section_id
     JOIN HotelPages hp ON hp.id = hs.hotel_page_id
     JOIN Hotels h ON h.id = hp.hotel_id
     WHERE h.id = ?
     ORDER BY hs.id`,
    [hotelId]
  );

const getFooter = (hotelId) =>
  query(
    `SELECT hs.*
     FROM HotelSections hs
     JOIN TemplateSections ts ON ts.id = hs.template_section_id
     JOIN HotelTemplates ht ON ht.id = hs.hotel_template_id
     WHERE ht.hotel_id = ? AND ts.type =`,
    [hotelId]
  );

// ------------------------ HOTEL TEMPLATE ASSIGNMENT ------------------------
const getHotelTemplates = (hotelId) =>
  query("SELECT * FROM HotelTemplates WHERE hotel_id = ?", [hotelId]);

const assignTemplateToHotel = (hotelId, templateId) =>
  query("INSERT INTO HotelTemplates SET ?", {
    hotel_id: hotelId,
    template_id: templateId,
  });

const removeTemplateFromHotel = (hotelId, templateId) =>
  query("DELETE FROM HotelTemplates WHERE hotel_id = ? AND template_id = ?", [
    hotelId,
    templateId,
  ]);

const getHotelPageDetails = async (hotelId, pageName) => {
  try {
    // ---------------- QUERY ----------------
    const query_str = `
      SELECT 
        tp.id AS template_id,
        tp.page_name,
        hs.id AS hotel_section_id,
        ts.section_name,
        ts.type AS section_type,
        GROUP_CONCAT(DISTINCT hsh.heading_text ORDER BY hsh.id SEPARATOR '||' ) AS headings,
        GROUP_CONCAT(DISTINCT hsd.description_text ORDER BY hsd.id SEPARATOR '||' ) AS descriptions,
        GROUP_CONCAT(DISTINCT hsi.image_url ORDER BY hsi.id SEPARATOR '||' ) AS images
      FROM Hotels h
      JOIN HotelPages hp ON hp.hotel_id = h.id
      JOIN TemplatePages tp ON tp.id = hp.template_page_id
      JOIN HotelSections hs ON hs.hotel_page_id = hp.id
      JOIN TemplateSections ts ON ts.id = hs.template_section_id
      LEFT JOIN HotelSectionHeadings hsh ON hsh.hotel_section_id = hs.id
      LEFT JOIN HotelSectionDescriptions hsd ON hsd.hotel_section_id = hs.id
      LEFT JOIN HotelSectionImages hsi ON hsi.hotel_section_id = hs.id
      WHERE h.id = ? AND tp.page_name = ? AND h.current_template_id = tp.template_id
      GROUP BY hs.id, ts.section_name, ts.type, tp.id, tp.page_name
      ORDER BY hs.id;
    `;

    // ---------------- EXECUTE QUERY ----------------
    const rows = await query(query_str, [hotelId, pageName]);
    if (!rows || rows.length === 0) return { error: "Page not found" };

    const templateId = rows[0].template_id;

    // ---------------- PROCESS SECTIONS ----------------
    const sections = rows.map((row) => {
      const secObj = {
        //sectionID: row.hotel_section_id,
        sectionName: row.section_name,
        type: row.section_type,
        headings: row.headings ? row.headings.split("||") : [],
        descriptions: row.descriptions ? row.descriptions.split("||") : [],
        images: row.images ? row.images.split("||") : [],
      };

      // Footer special handling
      if (row.section_name.toLowerCase() === "footer") {
        secObj.hotel = {
          address: row.address || "",
          phone: row.phone || "",
          email: row.email || "",
          timings: {
            checkIn: row.check_in_time || "",
            checkOut: row.check_out_time || "",
            opening: row.opening_hours || "",
            closing: row.closing_hours || "",
          },
        };
        secObj.links = {
          terms: row.terms_link || "",
          privacy: row.privacy_link || "",
          accessibility: row.accessibility_link || "",
        };
      }

      return secObj;
    });

    // ---------------- FINAL RESPONSE ----------------
    return {
      templateId: templateId.toString(),
      pageName,
      sections,
    };
  } catch (err) {
    console.error("Failed to fetch page details:", err);
    return { error: "Failed to fetch page details", reason: err.message };
  }
};

// Create Template
const createTemplate = (data) =>
  query("INSERT INTO Templates (name) VALUES (?)", [data.name]);

// Create Template Page
const createTemplatePage = (data) =>
  query("INSERT INTO TemplatePages (template_id, page_name) VALUES (?, ?)", [
    data.template_id,
    data.page_name,
  ]);

// Create Template Section
const createTemplateSection = (data) =>
  query(
    "INSERT INTO TemplateSections (template_id, section_name, type, is_optional) VALUES (?, ?, ?, ?)",
    [
      data.template_id,
      data.section_name,
      data.type || null,
      data.is_optional ? 1 : 0,
    ]
  );
// Create Hotel Section
const createHotelSection = (data) =>
  query(
    "INSERT INTO HotelSections (hotel_page_id, template_section_id) VALUES (?, ?)",
    [data.hotel_page_id, data.template_section_id]
  );

// -------------------- Add Multiple Hotel Section Headings --------------------
const addHotelSectionHeadings = async (data) => {
  // If heading_text is an array (even single item)
  if (Array.isArray(data.heading_text)) {
    const values = data.heading_text.map((text) => [
      data.hotel_section_id,
      text,
    ]);
    return query(
      "INSERT INTO HotelSectionHeadings (hotel_section_id, heading_text) VALUES ?",
      [values]
    );
  }

  // Fallback for single string (not array)
  return query(
    "INSERT INTO HotelSectionHeadings (hotel_section_id, heading_text) VALUES (?, ?)",
    [data.hotel_section_id, data.heading_text]
  );
};

// -------------------- Add Multiple Hotel Section Descriptions --------------------
const addHotelSectionDescriptions = async (data) => {
  const { hotel_section_id, description_text } = data;

  // Ensure we have a valid section id and at least one description
  if (!hotel_section_id || !description_text)
    throw new Error("hotel_section_id and description_text are required");

  // Normalize to array
  const descriptions = Array.isArray(description_text)
    ? description_text
    : [description_text];

  // Build multi-row insert query
  const values = descriptions.map((desc) => [hotel_section_id, desc]);
  const sql = `
    INSERT INTO HotelSectionDescriptions (hotel_section_id, description_text)
    VALUES ?
  `;

  // Use bulk insert
  const result = await query(sql, [values]);
  return result;
};

// Add Hotel Section Image
const addHotelSectionImages = async (data) => {
  const { hotel_section_id, image_urls } = data;

  if (!Array.isArray(image_urls) || image_urls.length === 0) {
    throw new Error("image_urls must be a non-empty array");
  }

  const values = image_urls.map((url) => [hotel_section_id, url]);

  const queryStr = `
    INSERT INTO HotelSectionImages (hotel_section_id, image_url)
    VALUES ?
  `;

  return query(queryStr, [values]);
};

// -------------------- Update Multiple Hotel Section Headings --------------------
const updateHotelSectionHeadings = async (data) => {
  const { hotel_section_id, headings } = data;

  if (!hotel_section_id || !Array.isArray(headings)) {
    throw new Error("hotel_section_id and headings array are required");
  }

  const updates = headings.map(({ id, heading_text }) =>
    query(
      "UPDATE HotelSectionHeadings SET heading_text = ? WHERE id = ? AND hotel_section_id = ?",
      [heading_text, id, hotel_section_id]
    )
  );

  return Promise.all(updates);
};

// -------------------- Update Multiple Hotel Section Descriptions --------------------
const updateHotelSectionDescriptions = async (data) => {
  const { hotel_section_id, descriptions } = data;

  if (!hotel_section_id || !Array.isArray(descriptions)) {
    throw new Error("hotel_section_id and descriptions array are required");
  }

  const updates = descriptions.map(({ id, description_text }) =>
    query(
      "UPDATE HotelSectionDescriptions SET description_text = ? WHERE id = ? AND hotel_section_id = ?",
      [description_text, id, hotel_section_id]
    )
  );

  return Promise.all(updates);
};

// -------------------- Update Multiple Hotel Section Images --------------------
const updateHotelSectionImages = async (data) => {
  const { hotel_section_id, images } = data;

  if (!hotel_section_id || !Array.isArray(images)) {
    throw new Error("hotel_section_id and images array are required");
  }

  const updates = images.map(({ id, image_url }) =>
    query(
      "UPDATE HotelSectionImages SET image_url = ? WHERE id = ? AND hotel_section_id = ?",
      [image_url, id, hotel_section_id]
    )
  );

  return Promise.all(updates);
};

// Get All Template Sections (with optional template_id filter)
const getAllTemplateSections = async (template_id) => {
  let queryStr = `
    SELECT 
      ts.id AS template_section_id,
      ts.section_name,
      ts.type,
      ts.template_id,
      tp.page_name
    FROM TemplateSections AS ts
    LEFT JOIN TemplatePages AS tp 
      ON tp.template_id = ts.template_id
  `;

  const params = [];

  if (template_id) {
    queryStr += " WHERE ts.template_id = ?";
    params.push(template_id);
  }

  queryStr += " ORDER BY ts.id ASC";

  return query(queryStr, params);
};

// ------------------------ START SERVER ------------------------
app.listen(port, () => console.log(`✅ Server running on port ${port}`));
