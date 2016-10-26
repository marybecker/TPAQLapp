about <- tabPanel("About Project",
                  HTML('

                       <h3>Project Overview</h3>

                       <p>
                       <img src="FrenchR_algae.png" style="float:right; margin-left:10px;"> 
                       The purpose of this research project is to support the Connecticut Department of 
                       Environmental Protection\'s (CT DEEP) ongoing phosphorus management efforts to protect aquatic
                       life in freshwater rivers and streams.  The CT DEEP water monitoring program collects 
                       and analyzes river and stream data as part of this effort.  This R web app is designed to 
                       disseminate data and information related to this research to the public.</p>
                       
                       <p>Phosphorus is a nutrient that is naturally occurring in inland, non-tidal CT rivers and streams
                       , however when added in excess can contribute to cultural eutrophication.  Eutrophication is the 
                       process which leads to an increase in the level of primary production or biomass occurring within 
                       a water body.  Eutrophication is a slow natural process that occurs within a water body, but human 
                       activity can greatly speed up the process primarily through the addition of excess nutrients.  
                       Cultural eutrophication is described as human-caused acceleration of eutrophication through 
                       excess nutrients in water bodies.  Cultural eutrophication causes harmful effects on water bodies 
                       such as fish kills, reduction of dissolved oxygen and pH values, and loss of diversity or changes 
                       in community structure in aquatic plant, invertebrate and fish communities.</p>  
                       
                       <p>Cultural eutrophication is a serious threat to water quality in Connecticut 
                       (CASE 2014; Becker 2014) and is also one of 
                       the most pressing water quality issues facing the nation.  The EPA has identified cultural 
                       eutrophication as one of the primary factors resulting in impairment of U.S. surface waters and 
                       is encouraging all states to develop strategies to reduce nutrient pollution that address 
                       impairments caused by cultural eutrophication.  CT DEEP has taken several steps to implement
                       reductions in the most impacted rivers and streams and is continuing to develop the science to
                       better understand where further reductions are needed.</p>
                       
                       <p></p>              
                       
                       <h3>Research Tab Overview</h3>
                       
                       <p>The CT DEEP monitoring program collects total phosphorus and algae community samples in 
                       rivers and streams. The type of algae collected are called diatoms.  Diatoms are good 
                       indicators of eutrophication in rivers and streams.  The graph displays three metrics:</p>
                       
                       <ul>
                       <li>Relative Abundance Tolerant Diatoms:  Tolerant diatoms are defined as species
                       frequently occurring in high TP conditions and tending to increase in abundance
                       as TP increases</li>
                       <li>Relative Abundance Sensitive Diatoms:  Sensitive diatoms are defined as frequently occurring
                       in low TP conditions and tending to decline in abundance as TP increases</li>
                       <li>Total Phosphorus:  Total phosphorus represents the average concentration of collected
                       stream samples under ambient conditions for a given year</li>
                       </ul>
                       
                       <p>The metrics are a result of ongoing work and are subject to change.
                       For additional information, see references Smucker et al. (2013) and link to pre-publication 
                       version of ongoing work. </p>
                       
                       <p></p>   
                       
                       <h3>Management Tab Overview</h3>
                       
                       <p>In 2011, CT DEEP developed a strategy based on best available information to reduce 
                       phosphorus in watersheds with the highest yields (kg/km2) of phosphorus (Becker 2014).
                       The high yield of phosphorus in these watershed was largely due to municipal water pollution
                       control facilities (WPCFs), therefore DEEP targeted reductions at these facilities.  These methods 
                       were approved by the EPA in a letter dated October 26, 2010 as an interim strategy to establish
                       water quality based phosphorus limits in non-tidal freshwater for National Pollutant Discharge Elimination
                       permits for WPCFs while DEEP further developed research on the effects of phosphorus in freshwaters.  These
                       reductions are being implemented in phases as permits get renewed with additional time allocated for facilities
                       that need to upgrade technology to achieve large reductions.  Interim requirements are occurring at facilities 
                       that cannot achieve final limits in the first permitting cycle.</p>
                       
                       <p>Estimates of seasonal (April - October) TP land cover and WPCF TP loads were summed and divided
                       by the regional basin area to estimate a seasonal yield for that basin. Land cover loads were estimated using
                       USGS Spatially Referenced Regressions on Watershed attributes (SPARROW) 2002 TP model for Northeast
                       and Mid Atlantic Regions (Moore et al. 2011).  Seasonal WPCF TP loads for pre-management and 2015
                       yields were estimated using daily monitoring reports submitted to CT DEEP and EPA.  Future WPCF TP loads
                       were estimated using final permit limits indicated in CT DEEP interim strategy (Becker 2014)</p>
                       
                      <h3>References</h3>
					  
            					  <p><a href=http://www.ct.gov/deep/lib/deep/water/water_quality_standards/p/interimmgntphosstrat_042614.pdf> 
            					  Becker, M.E.  (2014) Interim Phosphorus Reduction Strategy for Connecticut Freshwater Non-Tidal 
            					  Waste-Receiving Rivers and Streams Technical Support Document.  
            					  Connecticut Department of Energy and Environmental Protection.  Hartford, CT.</a></p>
            					  
            					  <p><a href=http://www.ct.gov/deep/lib/deep/water/water_quality_standards/p/sciencemw/casereport_phosphorus.pdf>The Connecticut Academy of 
            					  Science and Engineering (CASE) (2014) Methods to Measure Phosphorus and Make Future Projections.  Rocky Hill, CT.</a></p>
            					  
            					  <p><a href=http://onlinelibrary.wiley.com/doi/10.1111/j.1752-1688.2011.00582.x/abstract>
            					  Moore, Richard B., Craig M. Johnston, Richard A. Smith, and Bryan Milstead (2011) 
            					  Source and Delivery of Nutrients to Receiving Waters in the Northeastern and Mid-Atlantic Regions of the United States. 
            					  Journal of the American Water Resources Association (JAWRA) 47(5):965-990. </a></p>
            					  
            					  <p><a href=http://www.sciencedirect.com/science/article/pii/S1470160X13001246>
            					  Smucker, Nathan J., Mary Becker, Naomi E. Detenbeck, Alisa C. Morrison (2013) 
            					  Using algal metrics and biomass to evaluate multiple ways of defining concentration-based
            					  nutrient criteria in stream and their ecological relevance.  32: 51-61. </a></p>

                       <p><a href=http://www.ct.gov/deep/phosphorus>
                        CT DEEP PA 12-155 Phosphorus Reduction Strategy for Inland Non-Tidal Waters Website</a></p>  
                       
                       <p>Add link to pre-publication</p>
                       
                       <h3>Contact</h3> 
                      
                       <p>
                       <img src="CherryBrook_sampling.png" style="float:left; margin-right:10px;">
                       Mary Becker<br/>
                       Research Principal Investigator<br/> 
                       Senior Environmental Analyst<br/>
                       Stream Monitoring and Assessment Program<br/>
                       Connecticut Department of Environmental Protection</br>
                       mary.becker@ct.gov</p>'  
                       
                       
                       
                       
),

 value="aboutprj"
)

   
