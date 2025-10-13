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
    hs.hotel_template_id,
    h.id AS hotel_id
FROM 
    HotelSections AS hs
JOIN 
    TemplateSections AS ts 
    ON ts.id = hs.template_section_id
JOIN 
    Hotels AS h 
    ON h.current_template_id = hs.hotel_template_id
WHERE 
    h.id = ?`,
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

// ------------------------ GET HOTEL PAGE DETAILS ------------------------
const getHotelPageDetails = async (hotelId, pageName, sections, include) => {
  // Get the current template of the hotel
  const hotel = await getHotel(hotelId);
  if (!hotel || hotel.length === 0) return null;
  const templateId = hotel[0].current_template_id;

  // Get the page from TemplatePages
  const pageQuery = `
    SELECT * FROM TemplatePages 
    WHERE template_id = ? AND page_name = ?`;
  const pages = await query(pageQuery, [templateId, pageName]);
  if (!pages || pages.length === 0) return null;
  const page = pages[0];

  // Get all sections for this page
  let sectionsQuery = `SELECT * FROM TemplateSections WHERE template_id = ? AND page_name = ?`;
  let allSections = await query(sectionsQuery, [templateId, pageName]);

  // Filter sections if query param 'sections' is provided
  if (sections) {
    const sectionList = sections.split(",").map((s) => s.trim());
    allSections = allSections.filter((sec) =>
      sectionList.includes(sec.section_name)
    );
  }

  // For each section, fetch headings, descriptions, images, footer
  const resultSections = [];
  for (const sec of allSections) {
    const secObj = {
      sectionName: sec.section_name,
      type: sec.type,
    };

    if (!include || include.includes("headings")) {
      secObj.headings = (await getHeadings(sec.id)).map((h) => h.text);
    }
    if (!include || include.includes("descriptions")) {
      secObj.descriptions = (await getDescriptions(sec.id)).map((d) => d.text);
    }
    if (!include || include.includes("images")) {
      secObj.images = (await getImages(sec.id)).map((i) => i.url);
    }
    if (!include || include.includes("footer")) {
      const footerData = await getFooter(sec.id);
      if (footerData.length > 0) {
        secObj.footer = footerData[0];
      }
    }

    resultSections.push(secObj);
  }

  return {
    templateId,
    pageName,
    sections: resultSections,
  };
};

// ------------------------ START SERVER ------------------------
app.listen(port, () => console.log(`✅ Server running on port ${port}`));
