const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
require("dotenv").config({path: ".env.local"});

const app = express()
const DEFAULT_PORT = 3000;
const allowedOrigin = (process.env.CORS_ORIGINS ?? "").split(",")
const port = (process.env.PORT ?? DEFAULT_PORT)

// Middleware
app.use(
  cors({
    origin(origin, callback) {
      if (!origin || allowedOrigin.includes(origin)) callback(null, true)
      else callback(new Error("Not allowed by CORS"))
    },
  }),
)
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Config
const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
})

app.listen(port, () => console.log(`Started listening on port ${port}`));

// API
app.get("/health", (req, res) => {
  res.status(200).json({status: "OK", message: "Server is alive!"});
})




// -----------------------------------------------------------------------------
// 1️⃣ HOTELS APIs
// -----------------------------------------------------------------------------

app.get("/api/hotels", async (req, res) => {
  try {
    const hotels = await getHotels();
    res.status(200).json(hotels);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch hotels", reason: error });
  }
});

app.get("/api/hotels/:id", async (req, res) => {
  try {
    const hotel = await getHotel(req.params.id);
    res.status(200).json(hotel);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch hotel", reason: error });
  }
});

app.post("/api/hotels", async (req, res) => {
  try {
    const result = await createHotel(req.body);
    res.status(201).json({ message: "Hotel created successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to create hotel", reason: error });
  }
});

app.put("/api/hotels/:id", async (req, res) => {
  try {
    const result = await updateHotel(req.params.id, req.body);
    res.status(200).json({ message: "Hotel updated successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to update hotel", reason: error });
  }
});

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

app.get("/api/templates", async (req, res) => {
  try {
    const templates = await getTemplates();
    res.status(200).json(templates);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch templates", reason: error });
  }
});

app.get("/api/templates/:id", async (req, res) => {
  try {
    const template = await getTemplate(req.params.id);
    res.status(200).json(template);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch template", reason: error });
  }
});

app.post("/api/templates", async (req, res) => {
  try {
    const result = await createTemplate(req.body);
    res.status(201).json({ message: "Template created successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to create template", reason: error });
  }
});

app.put("/api/templates/:id", async (req, res) => {
  try {
    const result = await updateTemplate(req.params.id, req.body);
    res.status(200).json({ message: "Template updated successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to update template", reason: error });
  }
});

app.delete("/api/templates/:id", async (req, res) => {
  try {
    const result = await deleteTemplate(req.params.id);
    res.status(200).json({ message: "Template deleted successfully", result });
  } catch (error) {
    res.status(500).json({ error: "Failed to delete template", reason: error });
  }
});


// -----------------------------------------------------------------------------
// 3️⃣ PAGES APIs (Hotel Pages & Template Pages)
// -----------------------------------------------------------------------------

app.get("/api/hotels/:hotelId/pages", async (req, res) => {
  try {
    const pages = await getPages(req.params.hotelId);
    res.status(200).json(pages);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch hotel pages", reason: error });
  }
});

app.get("/api/hotels/:hotelId/pages/:pagename", async (req, res) => {
  try {
    const { hotelId, pagename } = req.params;
    const { sections, include } = req.query;
    const data = await getHotelPageDetails(hotelId, pagename, sections, include);
    res.status(200).json(data);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch page details", reason: error });
  }
});


// -----------------------------------------------------------------------------
// 4️⃣ SECTIONS, HEADINGS, DESCRIPTIONS, IMAGES, FOOTER APIs
// -----------------------------------------------------------------------------

app.get("/api/hotels/:hotelId/sections", async (req, res) => {
  try {
    const sections = await getSections(req.params.hotelId);
    res.status(200).json(sections);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch sections", reason: error });
  }
});

app.get("/api/sections/:sectionId/headings", async (req, res) => {
  try {
    const headings = await getHeadings(req.params.sectionId);
    res.status(200).json(headings);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch headings", reason: error });
  }
});

app.get("/api/sections/:sectionId/descriptions", async (req, res) => {
  try {
    const desc = await getDescriptions(req.params.sectionId);
    res.status(200).json(desc);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch descriptions", reason: error });
  }
});

app.get("/api/sections/:sectionId/images", async (req, res) => {
  try {
    const images = await getImages(req.params.sectionId);
    res.status(200).json(images);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch images", reason: error });
  }
});

app.get("/api/sections/:sectionId/footer", async (req, res) => {
  try {
    const footer = await getFooter(req.params.sectionId);
    res.status(200).json(footer);
  } catch (error) {
    res.status(500).json({ error: "Failed to fetch footer", reason: error });
  }
});


// -----------------------------------------------------------------------------
// 🔹 HELPER FUNCTIONS (Reusable Query Wrappers)
// -----------------------------------------------------------------------------

const getHotels = () => query("SELECT * FROM hotels");
const getHotel = (id) => query("SELECT * FROM hotels WHERE id = ?", [id]);
const createHotel = (data) => query("INSERT INTO hotels SET ?", data);
const updateHotel = (id, data) => query("UPDATE hotels SET ? WHERE id = ?", [data, id]);
const deleteHotel = (id) => query("DELETE FROM hotels WHERE id = ?", [id]);

const getTemplates = () => query("SELECT * FROM templates");
const getTemplate = (id) => query("SELECT * FROM templates WHERE id = ?", [id]);
const createTemplate = (data) => query("INSERT INTO templates SET ?", data);
const updateTemplate = (id, data) => query("UPDATE templates SET ? WHERE id = ?", [data, id]);
const deleteTemplate = (id) => query("DELETE FROM templates WHERE id = ?", [id]);

const getPages = (hotelId) =>
  query("SELECT * FROM template_pages WHERE hotel_id = ?", [hotelId]);

const getHotelPageDetails = (hotelId, pageName, sections, include) => {
  // You can enhance this later to join multiple tables dynamically
  return query(
    "SELECT * FROM template_pages WHERE hotel_id = ? AND page_name = ?",
    [hotelId, pageName]
  );
};

const getSections = (hotelId) =>
  query("SELECT * FROM hotel_sections WHERE hotel_id = ?", [hotelId]);

const getHeadings = (sectionId) =>
  query("SELECT * FROM hotel_section_headings WHERE section_id = ?", [sectionId]);

const getDescriptions = (sectionId) =>
  query("SELECT * FROM hotel_section_descriptions WHERE section_id = ?", [sectionId]);

const getImages = (sectionId) =>
  query("SELECT * FROM hotel_section_images WHERE section_id = ?", [sectionId]);

const getFooter = (sectionId) =>
  query("SELECT * FROM hotel_footer WHERE section_id = ?", [sectionId]);


// -----------------------------------------------------------------------------
// 🔹 Utility: Generic Query Function
// -----------------------------------------------------------------------------

const query = (sql, params = []) => {
  return new Promise((resolve, reject) => {
    connection.query(sql, params, (err, results) => {
      if (err) reject(err);
      else resolve(results);
    });
  });
};




