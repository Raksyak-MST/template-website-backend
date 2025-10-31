## DB Diagram

[DB diagram](https://dbdiagram.io/d/website_template_2-68e7a6f5d2b621e4220dbfe6)

## Postman Collection

[Hotel CMS API](https://web.postman.co/workspace/My-Workspace~e63285cb-863d-4bb0-80d1-a70802ec3315/collection/46769986-6e591093-de3a-49ae-8e1a-19a395fa39c0?action=share&source=copy-link&creator=46769986)

# Database

## Insert query sequence from left to right

`Templates → TemplatePages → TemplateSections → Hotels → HotelTemplates → HotelPages → HotelSections → HotelSectionHeadings / HotelSectionDescriptions / HotelSectionImages`

## Created View tables

1. HotelTemplateView – shows which hotel is using which template.
1. HotelPagesView – shows all pages with the corresponding hotel name.
1. HotelSectionHeadingsView – lists all headings with section name, page name, and hotel name.
1. HotelSectionImagesView – lists all images with section name, page name, and hotel name.
1. HotelSectionDescriptionsView – lists all descriptions with section name, page name, and hotel name

## Left to Right Query

```text
Templates
   → TemplatePages
   → TemplateSections
Hotels
   → HotelTemplates → Templates
   → HotelPages → TemplatePages
   → HotelSections → HotelTemplates → HotelPages → TemplateSections
        → HotelSectionHeadings
        → HotelSectionDescriptions
        → HotelSectionImages
```

# API

`/api/hotels/:hotelId/pages`            GET   ALL pages
`/api/hotels/:hotelId/pages/:pagename`  GET   Get all pages for hotel specific template

- query params
  - `sections=home,room,dining` (fetch only specific sections)
  - `include=heading,description,images,footer` (fetch required content)

## API for editing (Template Management UI)

### 1. Templates APIs

`/api/templates` GET Get all templates (id, name, page_name)  
`/api/templates/:id` GET Get single template by id  
`/api/templates` POST Create a new template  
`/api/templates/:id` PUT Update template details  
`/api/templates/:id` DELETE Delete template (hotels’ template_id may be set to NULL)
`/api/templates/:id/pages` GET Get pages of the template

### 2. Hotels APIs

`/api/hotels` GET List all hotels with template info  
`/api/hotels/:id` GET Get hotel details including template_id  
`/api/hotels` POST Create new hotel  
`/api/hotels/:id` PUT Update hotel info  
`/api/hotels/:id` DELETE Delete hotel and all related sections/content

### 3. HotelTemplates APIs

`/api/hotels/:hotelId/templates` GET Get templates used by a hotel (history or active)
`/api/hotels/:hotelId/templates` POST Assign a template to a hotel  
`/api/hotels/:hotelId/templates/:id` PUT Update activated_on or template assignment  
`/api/hotels/:hotelId/templates/:id` DELETE Remove template from hotel

### 4. HotelSections APIs

`/api/hotels/:hotelId/sections`             GET   Get all sections for a hotel (with headings, descriptions, images)
`/api/hotels/:hotelId/sections/:sectionId`  GET       Get a specific section’s content  
`/api/hotels/:hotelId/sections`             POST      Add new section instance for hotel  
`/api/hotels/:hotelId/sections/:sectionId`  PUT       Update section (toggle `is_active`)  
`/api/hotels/:hotelId/sections/:sectionId`  DELETE    Delete hotel section

### 5. HotelSectionHeadings APIs

`/api/sections/:sectionId/headings` GET List headings for section  
`/api/sections/:sectionId/headings` POST Add heading  
`/api/headings/:id` PUT Update heading text or order_index
`/api/headings/:id` DELETE Delete heading

### 6. HotelSectionDescriptions APIs

`/api/sections/:sectionId/descriptions` GET List descriptions for section  
`/api/sections/:sectionId/descriptions` POST Add description  
`/api/descriptions/:id` PUT Update description text or order_index
`/api/descriptions/:id` DELETE Delete description

### 7. HotelSectionImages APIs

`/api/sections/:sectionId/images` GET List images for section  
`/api/sections/:sectionId/images` POST Add image (path, alt_text, order_index)
`/api/images/:id` PUT Update image path/alt_text/order_index  
`/api/images/:id` DELETE Delete image

## Combined API response

```JSON
{
  "templateId": "6",
  "pageName": "home",
  "sections": [
    {
      "sectionName": "hero",
      "type": "hero",
      "headings": ["Welcome to Our Hotel", "Luxury Redefined"],
      "descriptions": [],
      "images": ["/images/room1.jpg"]
    },
    {
      "sectionName": "rooms",
      "type": "rooms",
      "headings": ["Our Rooms", "Stay in Comfort"],
      "descriptions": ["Spacious and elegant rooms for all travelers."],
      "images": ["/images/room1.jpg", "/images/room2.jpg"]
    },
    {
      "sectionName": "aboutHotel",
      "type": "about",
      "headings": ["About Our Hotel", "A Legacy of Hospitality"],
      "descriptions": ["Founded in 1980, we serve luxury with care."],
      "images": ["/images/about.jpg"]
    },
    {
      "sectionName": "dining",
      "type": "dining",
      "headings": ["Fine Dining", "Taste That Lasts"],
      "descriptions": ["Experience world-class cuisines from our chefs."],
      "images": ["/images/dining.jpg"]
    }
  ]
}
```

## Admin panel UI



## Common components
- Hero section (headings, descriptions, bg image, images)
- Room section (headings, descriptions, room card)
- Amenities section (headings, descriptions, bg image)
- Contact section (phone number, email, address, location for map)
- Restaurant section (Headings descriptions, menu card, images)
- About section (headings, descriptions, images)
- Meeting section (headings, descriptions, images)
- Testimonials section (headings, descriptions, testimonial)
- Booking Policies (headings, descriptions, hotel rules check in, check out, amenities usage)
- Offers sections (headings, descriptions, offer card)
- Dining section (headings, descriptions, dine in restaurant card)
- Activities section (headings, descriptions, activity card)
- Gallery section (headings, descriptions, images)
- Our accommodations (headings, accommodation)
- Story section (headings, descriptions, image)
- Highlight section (headings, description, image)
- Promotional section (headings, descriptions, image)

# Card Components
- Menu Card (title, menu items list)
- Room card (title, descriptions, image, occupancy)
- Offer card (image, heading, description)
- Restaurant card (images, title, description)
- Activity card (images, title, description)
- Testimonial Card (author name, review)
- Blog Card (image, title, description)
- Accommodation Card (headings, Occupancy, image)

# Website Components

## template 1:

Hero Section : 4 images
Overview Section : 1 Heading, 3 Descriptions, 2 images
Rooms Section : 1 Heading, 1 Description, Room (titles, Images)
Amenities Section : 1 Heading, 1 Description, Amenity(titles, Description, Images)
Restaurant : 3 Headings, 1 Description, Menus(title, Bullet point description)
Activities Section : 1 Heading, 1 Description, Activity (titles, Descriptions, Images)
Meeting & Events Section : 1 Heading, Meeting(titles, Descriptions, Images)
Specials Section : 1 Heading, 1 Description, Special(titles, Descriptions, Images)
Contact Section : Mobile number, Email, Location for map
Footer Section : Address, Mobile Number, Email, Timings, Links

## template 2:

Home Page:
-> Hero section : 1 Heading, 1 Subheading, 1 Image
-> Restaurant section : 2 Images, 1 Heading, 1 Description
-> Amenities section : 8 Icons with titles
-> Rooms section : Rooms(Titles, Sub-titles, Images)
-> Testimonials section : 1 Heading, Reviews(Descriptions, author)
-> Contact section : 1 Heading, Address, Number, Email
-> Footer section : Address, Number, Email, Icons

Rooms Page:
-> Hero section : 1 Image
-> Rooms section : 1 Heading, 1 Sub-heading, 1 Description, Rooms(Title, 2 Descriptions, Images)
-> Amenities section : 1 Image, 1 Heading, 8 Icons with titles
-> Rooms section : Rooms(Titles, Sub-titles, Images)
-> Footer section : Address, Number, Email, Icons

About us Page:
-> Hero section : 1 Image
-> About us section : 1 Heading, 1 Sub-heading, 1 Description
-> Amenities section : 1 Image, 8 Icons with titles
-> Booking policies & Amenities Section : Booking policies Tab (1 Heading, 4 sub-headings, 4 Descriptions) & Amenities Tab (1 Heading, 50 Bullet point titles)
-> Reserve Now Section : 1 Images, 1 Heading, 1 Sub-heading
-> Footer section : Address, Number, Email, Icons

SPA Page:
-> Hero section : 1 Image
-> SPA section : 1 Heading, 1 Sub-heading, 1 Description, 2 Images
-> Extra services section : 1 Heading, 1 Sub-heading, Services(Titles, Images, Description)
-> Footer section : Address, Number, Email, Icons

Restaurant Page:
-> Hero section : 1 Image
-> Restaurant section : 1 Heading, 1 Sub-heading, 1 Description, Address, Number, Email
-> Foods section : 4 Images
-> Footer section : Address, Number, Email, Icons

Blog Page:
-> Hero section : 1 Image
-> Blog 1 section : 1 Heading, 1 Sub-heading, 1 Description
-> Blog 2 section : 3 Images, 3 Headings, 3 Sub-headings, 3 Descriptions, 1 text
-> Footer section : Address, Number, Email, Icons

Contact us Page:
-> Hero section : 1 Image
-> Contact us section : 1 Heading, 1 Sub-heading, 3 Icons with Address, number, email
-> Map section : 1 Heading, Location
-> Reserve Now Section : 1 Heading, 1 Sub-heading
-> Footer section : Address, Number, Email, Icons

## template 3:

Home Page:
-> Hero Section: 1 video, 1 Heading, 1 Sub-heading
-> Welcome Section : 1 Heading, 1 Sub-heading, 1 Image
-> Relax Section : 1 Heading, 1 Sub-heading, 1 Image
-> Review Section : 1 Heading, 1 Sub-heading, 1 Image, 1 Description, 1 text
-> Dining Experience Section : 1 Heading, 1 Sub-heading, 1 Image
-> Location Section : 1 Heading, 1 Sub-heading, Location for maps
-> Footer Section : Number, Email, Address

Rooms & Suites Page:
-> Hero Section: 1 Image, 1 Heading
-> Rooms Section : 1 Heading, Rooms(Images, Descriptions, titles, bullet point texts)
-> Footer Section : Number, Email, Address

Dinning Page:
-> Hero Section: 1 Image, 1 Heading
-> Restaurant & Menus Section : 3 icons, Address, Phone, Email, Time, sub-heading, 5 Images
-> Chefs Table Section : 1 Heading, 1 Description, 1 Text, 1 Image
-> Footer Section : Number, Email, Address

Activities Page:
-> Hero Section: 1 Image, 1 Heading
-> Contact Us Section : 4(Images, Headings, Descriptions)
-> Footer Section : Number, Email, Address

FAQ'S Page:
-> Hero Section: 1 Image, 1 Heading
-> Q & A Section : 1 Heading, 5 Q & A
-> Footer Section : Number, Email, Address

Contact Page:
-> Hero Section: 1 Image, 1 Heading
-> Contact Section : 1 Description
-> Location Section : 1 Heading, 1 Sub-heading, Location for map
-> Footer Section : Number, Email, Address

Blog Page:
-> Hero Section: 1 Image, 1 Heading
-> Blog Section : 3(Descriptions, Images, Headings)
-> Footer Section : Number, Email, Address

# template 5

- home page
  - hero section
    - heading[2]
  - about hotel section
    - headings[1], description[2], images
  - hotel offers
    - heading[2]
    - offer (image, title, small description)
  - rooms section
    - heading[1], bg image
  - activities section
    - heading[1], bg image
  - testimonial section
    - headings[1],
    - testimoial (author, review description)
  - our gallery section
    - headings[1], description[1], images[4]
  - our location section
    - headings[2], hotel location (used for map)
  - contact us section,
    - heading[1]
    - hotel (address, email, phone, logo, timmings(check in, check out, hotel open, hotel close))

- terms and conditions page

- privacy and cookies statement page

- room page
  - hero section
    - headings[2], bg image.
  - rooms section
    - room (room image, room type, room occupancy, room small description)

- property page
  - hero section
    - headings[2], bg image.
  - about property section
    - headings[2], description[2].
  - property amenities section
    - amenities(title, icon)
  - property rules and regulations section
    - headings[1], descriptions[1]

- activities page
  - hero section
    - headings[2], bg image,
  - activities section
    - activity (activity name, occupancy, activity description)

- contact page
  - hero section
    - headings[2], bg image
  - conctact us section
    - hotel location (for map), heading, description, hotel description bullet points.
    - contact us form
      - heading, descriptions[1]
    - social section
      - hotel images[4]

## template 6

- home page
  - hero section
    - headings[2], bg image
  - room section
    - headings[2], descriptions[1], images[2]
  - about hotel section
    - headings[2], descriptions[1], images[1]
  - dining section
    - headings[2], descriptions[1], images[1]
  - spa section
    - headings[2], descriptions[1], images[2]
  - why choose us section
    - headings[4]
  - footer
    - hotel (address, phone, email, hotel timings (check in, check out, opening, closing).
    - terms and conditions
    - privacy and cookies
    - accessibility statement

- rooms page
  - hero section
    - headings[2], bg image
  - rooms section
    - room (type, occupancy, description)

- about page
  - hero section
    - headings[2], bg image
  - amenities section
    - headings[1], descriptions[1]
    - amenity (title, description, icon)

- restaurant page
  - hero section
    - headings[2], bg image
  - about restaurant section
    - headings[2], descriptions[1], images[1]
  - menu section
    - heading[1], menu (title, description, price)

- spa page
  - hero section
    - headings[2], bg image
  - about spa section
    - headings[2], descriptions[1], images[1]
  - spa amenities
    - spa (title, description, image)

- about hotel page
  - hero section
    - headings[2], bg image
  - our story section
    - headings[2], descriptions[1], images[2]
  - meet our tema section
    - headings[1], descriptions[1]
    - team (name, position, description, image)

- contact page
  - hero section
    - headings[2], bg image
  - contact form section
    - headings[2]
  - contact information section
    - hotel (email, phone, address)
  - our location section
    - map location

## template 7

- home page
  - hero section
    - headings[2], bg image
  - about hotel
    - headings[2], descriptions[1], images[1]
  - why choose us section
    - headings[2], amenity( title, description, icon)
  - our rooms section
    - headings[2], descriptions[1]
    - room (image, title, occupancy, no. of bed, image)
  - gallery section
    - heading[1], descriptions[1], images[6]
  - testimoials section
    - headings[2]
    - testimoial(author, review)
  - social section
    - heading[1], images[4]
  - about section
    - headings[2]
- footer
  - hotel (address, email, phone number, timings (check in, check out, opening, closing)))

- rooms page
  - hero section
    - headigns[2], bg image
  - delicious breakfast section
    - headings[2], descriptins[1]
  - rooms section
  - room (headings[2], description, images[6])

- gallery page
  - hero section
    - headings[2], bg image
  - gallery section
    - images[24]

- negihborhood page
  - hero section
    - headings[2], bg image
  - about section
    - headings[2], descriptions[1], images[1]
  - activities section
    - headings[2]
    - activity(title, description, icon)

- about page
  - hero section
    - headings[2], bg image
  - about section
    - heading[2], descriptions[1], images[1]
  - dine in section
    - headings[2], descriptions[1]
    - dine (image, title, description)
  - teams section
    - headings[1], description[1]
    - team (image, name, position, description)
  - socila section
    - headings[1]
    - images[4]

- contact page
  - hero section
    - headings[2]
  - contact section
    - timings (phone support, check in check out, opening closing)
    - hotel (phone, email, address)
  - contact form section
    - headings[1], descriptions[1], map location
    - guide to arrive (transportation available from and to the hotel)

## template 9

- home page
  - hero section
    - slide(title, description, image)
  - about section
    - headings[1], descriptions[1]
  - villas section
    - headings[1]
    - villa(image, name, no. of guests)
  - activity section
    - headings[1], descriptions[1]
  - testimoials
    - headings[2]
    - testimoial (author, review)

- about us page
  - hero section
    - headings[1], descriptions[2], images[1]
  - teams section
    - headings[2], descriptions[1], images[1]
  - villas
    - vila(image, name, guests)

- contact page
  - hero section
    - headings[1], descriptions[1], images[1]
  - contact form section
    - headings[1], descriptions[2], hotel(email, phone)
  - social section
    - images[5]

- things to do blogs page
  - hero section
    - heading[2]
  - blogs
    - blog (image, title, description)

## template 11

- home page
  - hero section
    - headings[2], bg image
  - testimoials section
    - headings[2]
    - testimoial (author, review)
  - about section
    - headings[2], descriptions[2]

  - rooms section
    - headings[2]
    - room (type, people, amenities, image)
  - specials offer section
    - headings[2]
    - offer (title, description, image)
  - activities section
    - activity (title, image)
  - location section
    - headings[2]
    - map location, phone, email, address
  - social section
    - images[5]
  - newslater section
    - headings[2]

- rooms page
  - hero section
    - headings[2], bg image
  - accommodation section
    - headings[2], descriptions[2]
    - room timings (check in, check out, rules)
  - amenities
    - headings[2]
    - amenity (type, images[7]
  - bookings card
    - booking form
      - headings[1], description[1]
- specials page
  - hero section
    - headings[2], bg image
  - offers section
    - headings[2]
    - offer (image, title, days, description)
  - ad section
    - headings[2], descriptions[1]
- activities page
  - hero section
    - headings[2], bg image
  - things to do section
    - headings[2], descriptions[2]
  - activity (image, name, description)
- gallery page
  - hero section
    - headings[2], bg image
  - category (name, images[6])
- about page
  - hero section
    - headings[2], bg image
  - about us section
    - headings[2], descriptions[1], images[1]
  - location
    - headings[2], descriptions[1], hotel (email, phone, address), map location
  - amenities section
    - amenity (title, icon)
  - our team section
    - headigns[2], descriptions[2], name, position
- contact page
  - hero section
    - headings[2]
  - contact form
  - location section
    - headings[2]
    - address, email, phone, map location
  - offer section
    - headings[2]
    - offer (title, icon, description)

## Miscellaneous

## Miscellaneous

1. Hotel can change the theme (color) of the website.  
2. Hotel can change the content (headings, descriptions, images).  
3. Hotel user can select and mark a template as *Active* to use it for the live website (no need to update headings and content if the template sections are the same).  
4. Option to select and change the template.  
5. Two hotels can use the same template.  
6. Each hotel will be provided with an admin panel to make changes.  
7. Hotel can switch to a different template.  
8. All templates should be in one project or in individual projects for each template.  
9. Create default content for all templates.  
   1. Create common entries (headings, descriptions, images) for all templates.  
10. There should be a way to differentiate which data (headings, descriptions, images) to show for the same template chosen by different hotels.  
11. Deploy and map the hotel domain with its selected template.  
12. Configure Nginx to map the domain with the template path (the template path should be hidden; only page paths should be visible).  
    1. `<domain>/template11/home` → not allowed  
    2. `<domain>/home` → allowed  
13. Define how to display the selected template for each hotel.  
14. When requesting hotel data from a template, show a loading indicator; if data cannot be fetched, show an error message.  
15. If a hotel is deleted, all its related resources should also be deleted.  
16. Provide an API to populate the `HotelPages` table (this should be created automatically upon hotel template selection).  
17. If all templates are served from a single React application, a crash in the application will cause all templates to crash.  
18. When adding a new hotel, all related content entries should not need to be inserted manually.  
19. Define how one hotel can select another template for use. Is any authentication check required?
