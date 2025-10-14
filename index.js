const express = require("express"); // Import Express framework
const mysql = require("mysql2"); // Import MySQL client
const cors = require("cors"); // Import CORS middleware
require("dotenv").config({ path: ".env.local" }); // Load environment variables from .env.local

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
app.post("/api/templates", async (req, res) => {
  try {
    const result = await createTemplate(req.body);
    res.status(201).json({ message: "Template created successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to create template", reason: error });
  }
});

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

app.get("/api/hotels/:hotelId/pages/:pagename", async (req, res) => {
  try {
    const { hotelId, pagename } = req.params;
    const { sections, include } = req.query; // optional filters
    const template_id = 1; // Replace with actual template ID retrieval logic
    console.log(pagename);
    const query_str = `SELECT tp.page_name, hp.id AS hotel_page_id, hs.id AS hotel_section_id, ts.section_name, GROUP_CONCAT(DISTINCT hsh.heading_text ORDER BY hsh.id) AS headings, GROUP_CONCAT(DISTINCT hsd.description_text ORDER BY hsd.id) AS descriptions, GROUP_CONCAT(DISTINCT hsi.image_url ORDER BY hsi.id) AS images FROM Hotels h JOIN HotelPages hp ON hp.hotel_id = h.id JOIN TemplatePages tp ON tp.id = hp.template_page_id JOIN HotelSections hs ON hs.hotel_page_id = hp.id JOIN TemplateSections ts ON ts.id = hs.template_section_id LEFT JOIN HotelSectionHeadings hsh ON hsh.hotel_section_id = hs.id LEFT JOIN HotelSectionDescriptions hsd ON hsd.hotel_section_id = hs.id LEFT JOIN HotelSectionImages hsi ON hsi.hotel_section_id = hs.id WHERE h.id = ? AND tp.page_name = ? GROUP BY hs.id, tp.page_name, hp.id, ts.section_name ORDER BY hs.id;`;
    console.log("Executing query:", query_str);
    const data = await query(query_str, [hotelId, pagename]);
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
const createTemplate = (data) => query("INSERT INTO Templates SET ?", data);
const updateTemplate = (id, data) =>
  query("UPDATE Templates SET ? WHERE id = ?", [data, id]);
const deleteTemplate = (id) =>
  query("DELETE FROM Templates WHERE id = ?", [id]);

// ------------------------ PAGES & SECTIONS ------------------------
const getPages = (hotelId) =>
  query(
    "SELECT tp.* FROM TemplatePages tp JOIN Hotels h ON h.current_template_id = tp.template_id WHERE h.id = ?",
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
     WHERE hsh.hotel_id = ?`,
    [hotelId]
  );

const getDescriptions = (hotelId) =>
  query(
    `SELECT hsd.*
     FROM HotelSectionDescriptions hsd
     JOIN HotelSections hs ON hs.id = hsd.hotel_section_id
     WHERE hsd.hotel_id = ?`,
    [hotelId]
  );

const getImages = (hotelId) =>
  query(
    `SELECT hsi.*
     FROM HotelSectionImages hsi
     JOIN HotelSections hs ON hs.id = hsi.hotel_section_id
     WHERE hsi.hotel_id = ?`,
    [hotelId]
  );

const getFooter = (hotelId) =>
  query(
    `SELECT hs.*
     FROM HotelSections hs
     JOIN TemplateSections ts ON ts.id = hs.template_section_id
     JOIN HotelTemplates ht ON ht.id = hs.hotel_template_id
     WHERE ht.hotel_id = ? AND ts.type = 'footer'`,
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
  GROUP_CONCAT(DISTINCT hsh.heading_text ORDER BY hsh.id) AS headings,
  GROUP_CONCAT(DISTINCT hsd.description_text ORDER BY hsd.id) AS descriptions,
  GROUP_CONCAT(DISTINCT hsi.image_url ORDER BY hsi.id) AS images
FROM Hotels h
JOIN HotelPages hp ON hp.hotel_id = h.id
JOIN TemplatePages tp ON tp.id = hp.template_page_id
JOIN HotelSections hs ON hs.hotel_page_id = hp.id
JOIN TemplateSections ts ON ts.id = hs.template_section_id
LEFT JOIN HotelSectionHeadings hsh ON hsh.hotel_section_id = hs.id
LEFT JOIN HotelSectionDescriptions hsd ON hsd.hotel_section_id = hs.id
LEFT JOIN HotelSectionImages hsi ON hsi.hotel_section_id = hs.id
WHERE h.id = ? AND tp.page_name = ?
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
        sectionName: row.section_name,
        type: row.section_type,
        headings: row.headings ? row.headings.split(",") : [],
        descriptions: row.descriptions ? row.descriptions.split(",") : [],
        images: row.images ? row.images.split(",") : [],
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

// ------------------------ START SERVER ------------------------
app.listen(port, () => console.log(`✅ Server running on port ${port}`));
