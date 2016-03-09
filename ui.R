library(shiny)
library(plotly)
library(dplyr)


shinyUI(navbarPage("Emissions",
  
  # First tab panel                                   
  tabPanel("Carbon Emissions Worldwide",
    
    div(class="outer",
      
        tags$head(
          includeCSS("style.css")
        ),
        
      absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                    draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto", 
                    width = 330, height = "auto",
                    
                    h2("Carbon Emissions"),
                    
                    sliderInput("years", label = h3("Select Year"), min = 1960,
                                max = 2014, value = 1, sep = "")
  
      ),  
        
      mainPanel(
          plotlyOutput('map')
      )
    )
  ),
  
  # Second tab panel
  tabPanel("Time Series",
    div(class="outer",
        tags$head(
          includeCSS("style.css")
        ),
        
        absolutePanel(id = "controls", class = "panel panel-default", fixed = TRUE,
                      draggable = TRUE, top = 60, left = "auto", right = 20, bottom = "auto", 
                      width = 330, height = "auto",
                      
                      h2("Carbon Emissions"),
                      
                      selectInput("countries", label = h3("Select Country"),
                                  choices = list("Afghanistan"="Afghanistan","Albania"="Albania","Algeria"="Algeria",
                                                 "Andorra"="Andorra","Angola"="Angola","Anguilla"="Anguilla",
                                                 "Antigua and Barbuda"="Antigua and Barbuda","Argentina"="Argentina",
                                                 "Armenia"="Armenia","Aruba"="Aruba","Australia"="Australia","Austria"="Austria",
                                                 "Azerbaijan"="Azerbaijan","Bahamas"="Bahamas","Bahrain"="Bahrain",
                                                 "Bangladesh"="Bangladesh","Barbados"="Barbados","Belarus"="Belarus",
                                                 "Belgium"="Belgium","Belize"="Belize","Benin"="Benin","Bermuda"="Bermuda",
                                                 "Bhutan"="Bhutan","Bolivia"="Bolivia","Bosnia and Herzegovina"="Bosnia and Herzegovina",
                                                 "Botswana"="Botswana","Brazil"="Brazil","British Virgin Islands"="British Virgin Islands",
                                                 "Brunei Darussalam"="Brunei Darussalam","Bulgaria"="Bulgaria","Burkina Faso"="Burkina Faso",
                                                 "Burundi"="Burundi","Cambodia"="Cambodia","Cameroon"="Cameroon","Canada"="Canada",
                                                 "Cape Verde"="Cape Verde","Cayman Islands"="Cayman Islands","Central African Republic"="Central African Republic",
                                                 "Chad"="Chad","Chile"="Chile","China"="China","Colombia"="Colombia","Comoros"="Comoros","Congo"="Congo",
                                                 "Cook Islands"="Cook Islands","Costa Rica"="Costa Rica","C_te d'Ivoire"="C_te d'Ivoire","Croatia"="Croatia",
                                                 "Cuba"="Cuba","Cyprus"="Cyprus","Czech Republic"="Czech Republic",
                                                 "Democratic Republic of the Congo"="Democratic Republic of the Congo","Denmark"="Denmark","Djibouti"="Djibouti",
                                                 "Dominica"="Dominica","Dominican Republic"="Dominican Republic","Ecuador"="Ecuador","Egypt"="Egypt",
                                                 "El Salvador"="El Salvador","Equatorial Guinea"="Equatorial Guinea","Eritrea"="Eritrea","Estonia"="Estonia",
                                                 "Ethiopia"="Ethiopia","Faeroe Islands"="Faeroe Islands","Falkland Islands (Malvinas)"="Falkland Islands (Malvinas)",
                                                 "Fiji"="Fiji","Finland"="Finland","France"="France","French Guiana"="French Guiana","French Polynesia"="French Polynesia",
                                                 "Gabon"="Gabon","Gambia"="Gambia","Georgia"="Georgia","Germany"="Germany","Ghana"="Ghana","Gibraltar"="Gibraltar",
                                                 "Greece"="Greece","Greenland"="Greenland","Grenada"="Grenada","Guadeloupe"="Guadeloupe","Guatemala"="Guatemala",
                                                 "Guinea"="Guinea","Guinea-Bissau"="Guinea-Bissau","Guyana"="Guyana","Haiti"="Haiti","Honduras"="Honduras",
                                                 "Hong Kong"="Hong Kong","Hungary"="Hungary","Iceland"="Iceland","India"="India","Indonesia"="Indonesia",
                                                 "Iran"="Iran","Iraq"="Iraq","Ireland"="Ireland","Israel"="Israel","Italy"="Italy","Jamaica"="Jamaica",
                                                 "Japan"="Japan","Jordan"="Jordan","Kazakhstan"="Kazakhstan","Kenya"="Kenya","Kiribati"="Kiribati","Kuwait"="Kuwait",
                                                 "Kyrgyzstan"="Kyrgyzstan","Laos"="Laos","Latvia"="Latvia","Lebanon"="Lebanon","Lesotho"="Lesotho","Liberia"="Liberia",
                                                 "Libya"="Libya","Lithuania"="Lithuania","Luxembourg"="Luxembourg","Macao"="Macao","Macedonia (Republic of)"="Macedonia (Republic of)",
                                                 "Madagascar"="Madagascar","Malawi"="Malawi","Malaysia"="Malaysia","Maldives"="Maldives","Mali"="Mali","Malta"="Malta",
                                                 "Marshall Islands"="Marshall Islands","Martinique"="Martinique","Mauritania"="Mauritania","Mauritius"="Mauritius",
                                                 "Mexico"="Mexico","Micronesia (Federated States of)"="Micronesia (Federated States of)","Moldova"="Moldova",
                                                 "Mongolia"="Mongolia","Montenegro"="Montenegro","Montserrat"="Montserrat","Morocco"="Morocco","Mozambique"="Mozambique",
                                                 "Myanmar"="Myanmar","Namibia"="Namibia","Nauru"="Nauru","Nepal"="Nepal","Netherlands"="Netherlands",
                                                 "Netherlands Antilles"="Netherlands Antilles","New Caledonia"="New Caledonia","New Zealand"="New Zealand",
                                                 "Nicaragua"="Nicaragua","Niger"="Niger","Nigeria"="Nigeria","Niue"="Niue","North Korea"="North Korea","Norway"="Norway",
                                                 "Oman"="Oman","Pakistan"="Pakistan","Palau"="Palau","Panama"="Panama","Papua New Guinea"="Papua New Guinea","Paraguay"="Paraguay",
                                                 "Peru"="Peru","Philippines"="Philippines","Poland"="Poland","Portugal"="Portugal","Qatar"="Qatar","R_union"="R_union",
                                                 "Romania"="Romania","Russian Federation"="Russian Federation","Rwanda"="Rwanda","Saint Helena"="Saint Helena",
                                                 "Saint Kitts and Nevis"="Saint Kitts and Nevis","Saint Lucia"="Saint Lucia","Saint Pierre and Miquelon"="Saint Pierre and Miquelon",
                                                 "Saint Vincent and the Grenadines"="Saint Vincent and the Grenadines","Samoa"="Samoa","Sao Tome and Principe"="Sao Tome and Principe",
                                                 "Saudi Arabia"="Saudi Arabia","Senegal"="Senegal","Serbia"="Serbia","Seychelles"="Seychelles","Sierra Leone"="Sierra Leone",
                                                 "Singapore"="Singapore","Slovakia"="Slovakia","Slovenia"="Slovenia","Solomon Islands"="Solomon Islands","Somalia"="Somalia",
                                                 "South Africa"="South Africa","South Korea"="South Korea","Spain"="Spain","Sri Lanka"="Sri Lanka","Sudan"="Sudan",
                                                 "Suriname"="Suriname","Swaziland"="Swaziland","Sweden"="Sweden","Switzerland"="Switzerland","Syria"="Syria","Taiwan"="Taiwan",
                                                 "Tajikistan"="Tajikistan","Tanzania"="Tanzania","Thailand"="Thailand","Timor-Leste"="Timor-Leste","Togo"="Togo","Tonga"="Tonga",
                                                 "Trinidad and Tobago"="Trinidad and Tobago","Tunisia"="Tunisia","Turkey"="Turkey","Turkmenistan"="Turkmenistan",
                                                 "Turks and Caicos Islands"="Turks and Caicos Islands","Uganda"="Uganda","Ukraine"="Ukraine","United Arab Emirates"="United Arab Emirates",
                                                 "United Kingdom"="United Kingdom","United States of America"="United States of America","Uruguay"="Uruguay","Uzbekistan"="Uzbekistan",
                                                 "Vanuatu"="Vanuatu","Venezuela"="Venezuela","Vietnam"="Vietnam","Wallis and Futuna Islands"="Wallis and Futuna Islands",
                                                 "Western Sahara"="Western Sahara","Yemen"="Yemen","Zambia"="Zambia","Zimbabwe"="Zimbabwe"),
                                  selected = "United States")
    )
  )
  )
))
