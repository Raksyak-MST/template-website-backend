const express = require("express");
const mysql = require("mysql2");

const app = express();

const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "Template",
});

app.get("/:hotelID", async (req, res) => {
  try {
    const hotel = await getHotel(req.params.hotelID);
    res.status(200).send({ hotel });
  } catch (error) {
    res.status(403).send({ error: "Not able to process request", reason: error });
  }
});

app.get("/:template_page_id/sections", async (req, res) => {
  const { template_page_id } = req.params;
  const sections = await getSections(template_page_id);
  res.status(200).send({
    sections
  })
})

app.get("/:template_section_id/contents", async(req, res) => {
  const { template_section_id } = req.params;
  const contents = await getContents(template_section_id); 
  res.status(200).send({
    contents
  })
})

app.get("/:template_section_id/media-content", async(req, res) => {
  const { template_section_id } = req.params;
  const media_content = await getMediaContens(template_section_id);
  res.status(200).send({
    media_content
  })
})

const getHotel = async (hotelID) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM hotels where id = ?",
      hotelID,
      (err, result) => {
        if (err || !result) {
          console.log(err);
          reject(err);
        } else {
          resolve(result);
        }
      },
    );
  });
};

const getPages = async (template_id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM template_pages where template_id = ?",
      template_id,
      (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      },
    );
  });
};

const getSections = async (templage_page_id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM template_sections where template_page_id = ?",
      templage_page_id,
      (err, result) => {
        if (err) {
          reject(err);
        } else {
          resolve(result);
        }
      },
    );
  });
};

const getContents = async () => {
  return new Promise((resolve, reject) => {
    connection.query("SELECT * FROM contents", (err, result) => {
      if(err){
        reject(err);
      }else{
        resolve(result);
      }
    })
  })
}

const getMediaContens = async (template_section_id) => {
return new Promise((resolve, reject) => {
  connection.query("SELECT url, alt_text, media_type, order_index FROM media_content where template_section_id = ?", template_section_id, (err, result) => {
    if(err){
      reject(err);
    }else {
      resolve(result);
    }
  })
})  
}

app.listen(8000, () => console.log("API service started on port 8000"));
