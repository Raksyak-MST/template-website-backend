-- Templates
INSERT INTO Templates (name) VALUES
('Luxury Template'), 
('Business Template');

-- Template pages
INSERT INTO TemplatePages (page_name, template_id) VALUES
('Hero', 1),
('Rooms', 1),
('Amenities', 1),
('Contact', 1),
('Restaurant', 1),
('About', 1),
('Meeting', 1),
('Testimonials', 1),
('Booking Policies', 1),
('Offers', 1),
('Dining', 1),
('Activities', 1),
('Gallery', 1),
('Hero', 2),
('Rooms', 2),
('Amenities', 2),
('Contact', 2),
('About', 2),
('Testimonials', 2);

-- Template Sections
INSERT INTO TemplateSections (template_id, section_name, type, is_optional) VALUES
(1, 'Hero Section', 'image', FALSE),
(1, 'Room Section', 'list', FALSE),
(1, 'Amenities Section', 'text', FALSE),
(1, 'Contact Section', 'text', FALSE),
(1, 'Restaurant Section', 'list', TRUE),
(1, 'About Section', 'text', TRUE),
(1, 'Meeting Section', 'list', TRUE),
(1, 'Testimonials Section', 'list', TRUE),
(1, 'Booking Policies', 'text', TRUE),
(1, 'Offers Section', 'list', TRUE),
(1, 'Dining Section', 'list', TRUE),
(1, 'Activities Section', 'list', TRUE),
(1, 'Gallery Section', 'image', TRUE),
(2, 'Hero Section', 'image', FALSE),
(2, 'Room Section', 'list', FALSE),
(2, 'Amenities Section', 'text', FALSE),
(2, 'Contact Section', 'text', FALSE),
(2, 'About Section', 'text', TRUE),
(2, 'Testimonials Section', 'list', TRUE);

-- Hotels
INSERT INTO Hotels (name, owner_id, current_template_id, address, phone, email, domain_name, check_in, check_out, opening, closing) VALUES
('ManyataWoods', 1, 1, '123 Manyata Road, Bangalore', '9876543210', 'contact@manyatawoods.com', 'manyatawoods.com', '14:00', '12:00', '09:00', '22:00'),
('Oterra', 2, 1, '45 Oterra Street, Bangalore', '9876501234', 'info@oterra.com', 'oterra.com', '15:00', '11:00', '08:00', '23:00');

-- ## Hotel pages ##--
-- ManyataWoods
INSERT INTO HotelPages (hotel_id, template_page_id, is_active) VALUES
(1, 1, TRUE),
(1, 2, TRUE),
(1, 3, TRUE),
(1, 4, TRUE),
(1, 5, TRUE),
(1, 6, TRUE),
(1, 7, TRUE),
(1, 8, TRUE),
(1, 9, TRUE),
(1, 10, TRUE),
(1, 11, TRUE),
(1, 12, TRUE),
(1, 13, TRUE);

-- Oterra
INSERT INTO HotelPages (hotel_id, template_page_id, is_active) VALUES
(2, 1, TRUE),
(2, 2, TRUE),
(2, 3, TRUE),
(2, 4, TRUE),
(2, 6, TRUE),
(2, 8, TRUE);

-- ## Hotel sections ## --

-- ManyataWoods
INSERT INTO HotelSections (hotel_page_id, template_section_id, is_active) VALUES
(1, 1, TRUE),
(2, 2, TRUE),
(3, 3, TRUE),
(4, 4, TRUE),
(5, 5, TRUE),
(6, 6, TRUE),
(7, 7, TRUE),
(8, 8, TRUE),
(9, 9, TRUE),
(10, 10, TRUE),
(11, 11, TRUE),
(12, 12, TRUE),
(13, 13, TRUE);

-- Oterra
INSERT INTO HotelSections (hotel_page_id, template_section_id, is_active) VALUES
(14, 14, TRUE),
(15, 15, TRUE),
(16, 16, TRUE),
(17, 17, TRUE),
(18, 18, TRUE),
(19, 19, TRUE);

-- Hotel section headings

INSERT INTO HotelSectionHeadings (hotel_section_id, heading_text, order_index) VALUES
-- ManyataWoods
(1, 'Welcome to ManyataWoods', 1),
(2, 'Our Luxury Rooms', 1),
(3, 'Amenities You Will Love', 1),
(4, 'Get in Touch', 1),
(5, 'Fine Dining & Restaurant', 1),
(6, 'About ManyataWoods', 1),
(7, 'Meetings & Events', 1),
(8, 'Guest Testimonials', 1),
(9, 'Booking Policies', 1),
(10, 'Special Offers', 1),
(11, 'Dining Options', 1),
(12, 'Activities & Adventures', 1),
(13, 'Gallery', 1);

-- Hotel section descriptions
INSERT INTO HotelSectionDescriptions (hotel_section_id, description_text, order_index) VALUES
-- ManyataWoods
(1, 'Experience luxury and comfort at ManyataWoods in Bangalore.', 1),
(2, 'Rooms designed for ultimate relaxation with modern amenities.', 1),
(3, 'Swimming pool, gym, spa, and more to pamper our guests.', 1),
(4, 'Call us at 9876543210 or email contact@manyatawoods.com.', 1),
(5, 'Enjoy a variety of cuisines in our signature restaurant.', 1),
(6, 'Located in Bangalore, ManyataWoods combines style with comfort.', 1),
(7, 'Host meetings, conferences, and private events with ease.', 1),
(8, 'Hear what our satisfied guests have to say about us.', 1),
(9, 'Check-in from 2 PM, Check-out by 12 PM, follow our hotel rules.', 1),
(10, 'Avail exclusive seasonal offers for our premium rooms.', 1),
(11, 'Choose from multiple dining options including buffet & ala carte.', 1),
(12, 'Participate in fun activities such as yoga, trekking, and cycling.', 1),
(13, 'View our hotel gallery to explore our ambiance and facilities.', 1);

-- Hotel section images
INSERT INTO HotelSectionImages (hotel_section_id, image_url, order_index) VALUES
-- ManyataWoods
(1, 'https://example.com/manyatawoods/hero.jpg', 1),
(2, 'https://example.com/manyatawoods/room1.jpg', 1),
(2, 'https://example.com/manyatawoods/room2.jpg', 2),
(3, 'https://example.com/manyatawoods/amenities.jpg', 1),
(5, 'https://example.com/manyatawoods/restaurant.jpg', 1),
(6, 'https://example.com/manyatawoods/about.jpg', 1),
(7, 'https://example.com/manyatawoods/meeting.jpg', 1),
(8, 'https://example.com/manyatawoods/testimonial1.jpg', 1),
(11, 'https://example.com/manyatawoods/dining.jpg', 1),
(12, 'https://example.com/manyatawoods/activities.jpg', 1),
(13, 'https://example.com/manyatawoods/gallery1.jpg', 1),
(13, 'https://example.com/manyatawoods/gallery2.jpg', 2);
