This is a README file for Snowman (Snegvik) project.

### Short description

Snowman is a template generating system for CMSes (Content Management Systems). 

All html, css and javascript code is thought to be substituted by uniform lisp-like code. As regular lisp it will be not only markup, but full-fledged programming language.

### Perspective

The script will generate the templates, in each case for certain CMS, for example Joomla or Symphony, depending on user preferences. While required code for these CMSes could be different because of the difference in server side languages and APIs they use, page design and dynamic behaviour will be described once for all in lisp. Then, generator takes all the work to generate files, required by CMS (usually it is a template folder). And then those files will be plugged into the system (through admin panel of the CMS or by some other way).

### Examples

1.INLINE

Currently inline pattern is ready. It looks like that:

    (inline (class "blacktext") (t "Hello ") (inline (class "redtext") (t "world")))

that parsed to:

    <span class='blacktext'>Hello <span class='redtext'>world</span></span>
