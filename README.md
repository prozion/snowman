This is a README file for Snowman (Snegvik) project.

### Short description

Snowman is a template generating system for CMSes (Content Management Systems). 

All html, css and javascript code is thought to be substituted by uniform lisp-like code. As regular lisp it will be not only markup, but full-fledged programming language.

### Perspective

The script will generate the templates, in each case for certain CMS, for example Joomla or Symphony, depending on user preferences. While required code for these CMSes could be different because of the difference in server side languages and APIs they use, page design and dynamic behaviour will be described once for all in lisp. Then, generator takes all the work to generate files, required by CMS (usually it is a template folder). And then those files will be plugged into the system (through admin panel of the CMS or by some other way).

### (TODO) Carrots

Snowman introduces patching mechanism implemented by "carrots". Carrot is a snippet of html code of a form:

<!-- ooOoo: menu_placeholder -->
<!-- ooO: carrot_name -->
..html code here..
<!-- /ooO: carrot_name -->
<!-- /ooOoo: menu_placeholder -->

html code inside the comments can be altered already after generation of template structure and code. Also carroting can be used as an utility tool for html designer, that manually codes websites, but wants to avoid repetitional work. For example, if website has uniform menu on a several pages it requires several changes done if, say, address of some link in menu changed. With carroting we generate menu by the code:

    (set 'files '("index.html" "past/castle.html" "future/spaceship.html" "present/mongolian_ger.html"))

    (carrot:apply files)
    (carrot:create (name "mymenu") (position "menu_placeholder")
        (W:menu
            (link "Home" (files 0))
            (link "Castle" (files 1))
            (link "Spaceship" (files 2))
            (link "Ger" (files 3))))

After that it is possible to change menu in all or some files:

    (carrot:apply "index.html")
    (carrot:edit (name "mymenu")
        (W:menu
            (link "Home" (files 0))
            (link "Castle" (files 1))
            (link "Spaceship" (files 2))
            (link "Ger" (files 3))
            (link "About" "about.html")))
            

### Examples

1.INLINE

Currently inline pattern is ready. It looks like that:

    (inline (class "blacktext") (t "Hello ") (inline (class "redtext") (t "world")))

that parsed to:

    <span class='blacktext'>Hello <span class='redtext'>world</span></span>
