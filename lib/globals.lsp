
### Constants
(constant (global 'BASE_HTML_FILE) "resources/templates/html/base.html")
(constant (global 'RESET_CSS_FILE) "resources/templates/css/reset.css")

(constant (global 'HTML) "-//W3C//DTD HTML 4.01 Transitional//EN")
(constant (global 'HTML_DTD) "http://www.w3.org/TR/html4/loose.dtd")
(constant (global 'HTML_DOCTYPE) (format {html PUBLIC "%s" "%s"} HTML HTML_DTD))  

(constant (global 'XHTML) "-//W3C//DTD XHTML 1.0 Transitional//EN")
(constant (global 'XHTML_DTD) "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd")
(constant (global 'XHTML_DOCTYPE) (format {html PUBLIC "%s" "%s"} XHTML XHTML_DTD))  

(constant (global 'HTML5) "HTML5")
(constant (global 'HTML5_DOCTYPE) "html")

### Globals
(set '@block "div") (constant (global '@block))
(set '@inline "span") (constant (global '@inline))
(set (global '__html) "")
(set (global '__css) "")
(set (global '__js) "")

(set (global '@imagedir) "images")
(set (global '@stylesheet) "styles.css")
(set (global '@javascript) "functions.js")
(set (global '@dir) "_new_template")
(set (global '@lang) "en")
(set (global '@html_file) "index.html")
(set (global '@doctype) XHTML)
(set (global '@title) "Snowman generator")


