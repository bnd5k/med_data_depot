module MedDataDepot
  module WebScraper
    class MockScraper

      def search_for_title_and_content(url, title_location, condition_location, content_location)
        title = "A.S.P.E.N. clinical guidelines: nutrition support of adult patients with hyperglycemia." 
        condition = "barfitis"
        content  = 
        "<div id=\"ctl00_ContentPlaceHolder1_dlXML_ctl03_rptField_ctl00_divOuter\">\r\n                                <a id=\"Field151\"></a>\r\n                                <div class=\"fieldName\">\r\n                                    <span id=\"ctl00_ContentPlaceHolder1_dlXML_ctl03_rptField_ctl00_FieldName\">Major Recommendations</span> \r\n                                     \r\n                                     \r\n                                </div>\r\n                                <div class=\"fieldData\">\r\n                                    <span id=\"ctl00_ContentPlaceHolder1_dlXML_ctl03_rptField_ctl00_nofieldtext\"></span> \r\n                                      \r\n                                            <span id=\"ctl00_ContentPlaceHolder1_dlXML_ctl03_rptField_ctl00_rptValues_ctl00_Value\"><div class=\"content_para\">\n<p>Definitions for the grading of recommendations (<strong>Strong, Weak, Further Research Needed</strong>) and levels of evidence (<strong>High, Moderate, Low, Very Low</strong>) are provided at the end of the \"Major Recommendations\" field.</p>\r\n<p><strong>What is the Desired Blood Glucose Goal Range in Adult Hospitalized Patients Receiving Nutrition Support?</strong></p>\r\n<p>The authors recommend a target blood glucose goal range of 140–180 mg/dL (7.8–10 mmol/L). (<strong>Strong</strong>)</p>\r\n<p><strong>How is Hypoglycemia Defined in Adult Hospitalized Patients Receiving Nutrition Support?</strong></p>\r\n<p>The authors recommend that hypoglycemia be defined as a blood concentration of &lt;70 mg/dL (&lt;3.9 mmol/L). (<strong>Strong</strong>)</p>\r\n<p><strong>Should Diabetes-Specific Enteral Formulas Be Used for Adult Hospitalized Patients With Hyperglycemia?</strong></p>\r\n<p>The authors cannot make a recommendation at this time. (<strong>Further research needed</strong>)</p>\r\n<p><strong><span style=\"text-decoration: underline;\">Definitions</span></strong>:</p>\r\n<p><strong>Level of Evidence</strong></p>\r\n<p><strong>High</strong>: Further research is very unlikely to change the authors' confidence in the estimate of effect</p>\r\n<p><strong>Moderate</strong>: Further research is likely to have an important impact on the authors' confidence in the estimate of effect and may change the estimate</p>\r\n<p><strong>Low</strong>: Further research is very likely to have an important impact on the authors' confidence in the estimate of effect and is likely to change the estimate</p>\r\n<p><strong>Very Low</strong>: Any estimate of effect is very uncertain</p>\r\n<p><strong>Grade of Recommendation</strong></p>\r\n<p><strong>Strong</strong>: Net benefits outweigh harms</p>\r\n<p><strong>Weak</strong>: Tradeoffs for patient are important</p>\r\n<p><strong>Further research needed</strong>: Uncertain tradeoffs</p>\n</div></span> \r\n                                        \r\n                                </div>\r\n                            </div>".gsub(/>\s+</, "><")


        { title: title, condition: condition, content: content }
      end

    end
  end
end
