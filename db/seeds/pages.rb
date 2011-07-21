# encoding: utf-8
page_position = -1

home_page = Page.create(:title => "Home",
            :show_in_menu => false,
            :deletable => false,
            :link_url => "/",
            :position => (page_position += 1))
home_page.parts.create({
              :title => "Body",
              :body => "<p>Welcome to our site. This is just a place holder page while we gather our content.</p>",
              :position => 0
            })
home_page.parts.create({
              :title => "Side Body",
              :body => "<p>This is another block of content over here.</p>",
              :position => 1
            })

home_page_position = -1
page_not_found_page = home_page.children.create(:title => "Page not found",
            :menu_match => "^/404$",
            :show_in_menu => false,
            :deletable => false,
            :position => (home_page_position += 1))
page_not_found_page.parts.create({
              :title => "Body",
              :body => "<h2>Sorry, there was a problem...</h2><p>The page you requested was not found.</p><p><a href='/'>Return to the home page</a></p>",
              :position => 0
            })

about_us_page = Page.create(:title => "Summerschool",
            :deletable => true,
            :skip_to_first_child => true,
            :position => (page_position += 1))
about_us_page.parts.create({
              :title => "Body",
              :body => "",
              :position => 0
            })

about_us_page_position = -1
philosophy_page = about_us_page.children.create(:title => "Philosophy",
        :deletable => true,
        :position => (about_us_page_position += 1))
philosophy_page.parts.create({
              :title => "Body",
              :body => "<p>The Summerschool in Immunotoxicology is a non-profit association with the objective of teaching and promoting Immunotoxicology.</p><p>The association was founded by its present president : Pr Jacques Descotes in 1992. Each year, a summer school in immunotoxicology is organized to provide toxicologists from the industry as well as academia, state-of-the-art information and current trends on one selected aspect of immunotoxicology.</p><p>The proceedings of the 1st summerschool were published in a special issue of the <em>Journal de Toxicologie Expérimentale et Clinique</em>, then from the 2nd to the 10th summerschool in Elsevier's <em>Toxicology</em>.</p>",
              :position => 0
            })

staff_page = about_us_page.children.create(:title => "Staff",
        :deletable => true,
        :position => (about_us_page_position += 1))
staff_page.parts.create({
              :title => "Body",
              :body => "Work in progress",
              :position => 0
            })

next_school_page = Page.create(:title => "Next School",
            :deletable => true,
            :skip_to_first_child => true,
            :position => (page_position += 1))
next_school_page.parts.create({
              :title => "Body",
              :body => "",
              :position => 0
            })

next_school_page_position = -1

program_page = next_school_page.children.create(:title => "Program",
        :deletable => false,
        :link_url => "/next",
        :position => (next_school_page_position += 1))
program_page.parts.create({
              :title => "Body",
              :body => "",
              :position => 0
            })

registration_form_page = next_school_page.children.create(
        :title => "Registration Form",
        :deletable => false,
        :link_url => "/registration",
        :position => (next_school_page_position += 1))
registration_form_page.parts.create({
              :title => "Body",
              :body => "",
              :position => 0
            })

previous_schools_page = Page.create(:title => "Previous Schools",
            :deletable => false,
            :link_url => "/schools",
            :position => (page_position += 1))
previous_schools_page.parts.create({
              :title => "Body",
              :body => "",
              :position => 0
            })

previous_schools_page_position = -1
